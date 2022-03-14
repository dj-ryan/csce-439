#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"

#include <unistd.h>
#include <stdlib.h>

#include <Eigen/Dense>

int loopCount = 0;

int debug = true;

struct SensorData
{
  float velocity;
  float acceleration;
};

struct GroundData
{
  float altitude;
  float velocity;
  float acceleration;
};

struct PredictionData
{
  float altitude;
  float velocity;
  float acceleration;
};

SensorData sensorData;
GroundData groundData;
PredictionData predictionData;
float controlAccelerationValue;

void sensorsAccelerationCallback(const std_msgs::Float64 &msg)
{
  sensorData.acceleration = msg.data;
}

void sensorsVelocityCallback(const std_msgs::Float64 &msg)
{
  sensorData.velocity = msg.data;
}

void controlAccelerationCallback(const std_msgs::Float64 &msg)
{
  controlAccelerationValue = msg.data;
}

void groundtruthAltitudeCallback(const std_msgs::Float64 &msg)
{
  groundData.altitude = msg.data;
}

void groundtruthVelocityCallback(const std_msgs::Float64 &msg)
{
  groundData.velocity = msg.data;
}

void groundtruthAccelerationCallback(const std_msgs::Float64 &msg)
{
  groundData.acceleration = msg.data;
}

void debugPrint3x3Matrix(Eigen::Matrix<float, 3, 3> matrix)
{
  ROS_INFO("3x3 =");
  ROS_INFO("  [ %f  %f  %f", matrix(0, 0), matrix(0, 1), matrix(0, 2));
  ROS_INFO("    %f  %f  %f", matrix(1, 0), matrix(1, 1), matrix(1, 2));
  ROS_INFO("    %f  %f  %f ]", matrix(2, 0), matrix(2, 1), matrix(2, 2));
}

void debugPrint3x1Matrix(Eigen::Matrix<float, 3, 1> matrix)
{
  ROS_INFO("3x1 =");
  ROS_INFO("  [ %f", matrix(0, 0));
  ROS_INFO("    %f", matrix(1, 0));
  ROS_INFO("    %f ]", matrix(2, 0));
}

Eigen::Matrix<float, 3, 1> debugDeltaGroundVsPredicted(Eigen::Matrix<float, 3, 1> matrix, GroundData groundData)
{

  Eigen::Matrix<float, 3, 1> delta;

  delta(0, 0) = matrix(0, 0) - groundData.altitude;
  delta(1, 0) = matrix(1, 0) - groundData.velocity;
  delta(2, 0) = matrix(2, 0) - groundData.acceleration;

  return delta;
}

void calculatePredictionStep(Eigen::Matrix<float, 3, 1> *x_predict,
                             Eigen::Matrix<float, 3, 3> *p_predict,
                             Eigen::Matrix<float, 3, 3> A,
                             Eigen::Matrix<float, 3, 1> x_old,
                             Eigen::Matrix<float, 3, 3> B,
                             Eigen::Matrix<float, 3, 1> u,
                             Eigen::Matrix<float, 3, 3> p_old,
                             Eigen::Matrix<float, 3, 3> Q)
{

  /* === Prediction step === */

  /*
   * Make a state prediction based on the previous step and
   * our control paramiter
   */
  *x_predict = A * x_old + B * u;

  /*
   * Make a error covariance prediction based on
   * the previous step and our ???
   */
  Eigen::Matrix<float, 3, 3> p_predict_term0 = A * p_old * A.transpose();
  *p_predict = p_predict_term0 + Q;
}

void calculateCorrectionStep(Eigen::Matrix<float, 3, 1> *x_correct,
                             Eigen::Matrix<float, 3, 3> *p_correct,
                             Eigen::Matrix<float, 3, 3> p_predict,
                             Eigen::Matrix<float, 3, 3> H,
                             Eigen::Matrix<float, 3, 3> R,
                             Eigen::Matrix<float, 3, 1> z,
                             Eigen::Matrix<float, 3, 1> x_predict)
{

  Eigen::Matrix<float, 3, 3> I;
  I.Identity(); // creates identity matrix

  /* === Correction Step === */

  /*
   * The matrix K is chosen to be the gain
   * or blending factor that minimizes the a
   * posteriori error covariance
   */
  Eigen::Matrix<float, 3, 3> K_term0 = p_predict * H.transpose();
  Eigen::Matrix<float, 3, 3> K_term1 = H * p_predict * H.transpose() + R;
  Eigen::Matrix<float, 3, 3> K = K_term0 * K_term1.inverse(); // Final calculated term, no need to save, can be calculated ever time

  Eigen::Matrix<float, 3, 1> x_correct_term0 = z - (H * x_predict);
  *x_correct = x_predict + x_correct_term0;

  Eigen::Matrix<float, 3, 3> p_correct_term0 = K * H;
  Eigen::Matrix<float, 3, 3> p_correct_term1 = I - p_correct_term0;
  *p_correct = p_correct_term1 * p_predict;
}

int main(int argc, char **argv)
{

  ros::init(argc, argv, "kalmanFilter");

  ROS_INFO("hw2stats/kalmanFilter node starting......");

  ros::NodeHandle n;

  ros::Subscriber sensorsAcceleration = n.subscribe("sensors/acceleration", 1000, sensorsAccelerationCallback);
  ros::Subscriber sensorsVelocity = n.subscribe("sensors/velocity", 1000, sensorsVelocityCallback);
  ros::Subscriber controlAcceleration = n.subscribe("control/acceleration", 1000, controlAccelerationCallback);
  ros::Subscriber groundtruthAltitude = n.subscribe("groundtruth/altitude", 1000, groundtruthAltitudeCallback);
  ros::Subscriber groundtruthVelocity = n.subscribe("groundtruth/velocity", 1000, groundtruthVelocityCallback);
  ros::Subscriber groundtruthAcceleration = n.subscribe("groundtruth/acceleration", 1000, groundtruthAccelerationCallback);

  ros::Publisher predictedAltitude = n.advertise<std_msgs::String>("predicted/altitude", 1000);
  ros::Publisher predictedVelocity = n.advertise<std_msgs::Float64>("predicted/velocity", 1000);
  ros::Publisher predictedAcceleration = n.advertise<std_msgs::Float64>("predicted/acceleration", 1000);

  ros::Rate loop_rate(10);

  // Initalize matrices A, B, H, Q, R, K, X, P, u, z

  // Eigen::Matrix <data type, rows, cols>

  /*
   * Matrix A relates the state at the previous
   * time step to the state at the current step
   */
  Eigen::Matrix<float, 3, 3> A;
  A << 1, 1, 1,
      0, 1, 1,
      0, 0, 1;

  /*
   * Matrix B relates the state at the previous
   *
   */
  Eigen::Matrix<float, 3, 3> B;
  B << 1, 0, 0,
      0, 1, 0,
      0, 0, 1; // Control input, Maps control input u to state x

  /*
   * Relates the state to the measurement zk
   * Initalized to an identity matrix for now
   */
  Eigen::Matrix<float, 3, 3> H;
  H << 1, 0, 0,
      0, 1, 0,
      0, 0, 1;

  /*
   * Process noise covariance
   */
  Eigen::Matrix<float, 3, 3> Q;
  Q << 0.1, 0, 0,
      0, 0.1, 0,
      0, 0, 0.1;

  /*
   * measurment noise covariance
   */
  Eigen::Matrix<float, 3, 3> R;
  R << 1, 0, 0,
      0, 1, 0,
      0, 0, 1;

  /*
   * Kulman gian
   */
  Eigen::Matrix<float, 3, 3> K;
  K << 0, 0, 0,
      0, 0, 0,
      0, 0, 0;

  /*
   * this wil be updated with the
   * controll input and the prediction
   * and re-adjusted with the sensor input
   */
  Eigen::Matrix<float, 3, 1> x_predict; // current state initalize to zero
  x_predict << 0,
      0,
      0;

  Eigen::Matrix<float, 3, 1> x_correct;
  x_correct = x_predict;

  Eigen::Matrix<float, 3, 1> x_old;
  x_old = x_predict;

  /*
   * Error covariance
   */
  Eigen::Matrix<float, 3, 3> p_predict;
  p_predict << 0, 0, 0,
      0, 0, 0,
      0, 0, 0;

  Eigen::Matrix<float, 3, 3> p_correct;
  p_correct = p_predict;

  Eigen::Matrix<float, 3, 3> p_old;
  p_old = p_predict;

  Eigen::Matrix<float, 3, 1> u;
  u << 0,
      0,
      0;

  Eigen::Matrix<float, 3, 1> u_old;
  u_old = u;

  Eigen::Matrix<float, 3, 1> z;
  z << 0,
      0,
      0;

  Eigen::Matrix<float, 3, 3> I;
  I.Identity(); // creates identity matrix

  // Kalman initialization

  while (ros::ok())
  {

    /* save state */
    // x_previous = x;

    /* grab new values */
    u(2, 0) = controlAccelerationValue; // This is the only element of the controll matrix that needs to be updated because it is the only paramater provided.
    x_old = x_predict;                  // save old prediction value as old value
    p_old = p_predict;
    z(1, 0) = sensorData.velocity;
    z(2, 0) = sensorData.acceleration;



    /* === Prediction step === */

    calculatePredictionStep(&x_predict, &p_predict, A, x_old, B, u, p_old, Q);

    /* === Correction Step === */

    calculateCorrectionStep(&x_correct, &p_correct, p_predict, H, R, z, x_predict);

    /* === Publish data to topics === */

    if (debug == true)
    {
      ROS_INFO("ground delta: ");
      debugPrint3x1Matrix(debugDeltaGroundVsPredicted(x_correct, groundData));
    }
    std_msgs::Float64 altitudePublished;
    std_msgs::Float64 velocityPublished;
    std_msgs::Float64 accelerationPublished;

    altitudePublished.data = p_correct(0, 0);
    velocityPublished.data = p_correct(1, 0);
    accelerationPublished.data = p_correct(2, 0);

    predictedAltitude.publish(altitudePublished);
    predictedVelocity.publish(velocityPublished);
    predictedAcceleration.publish(accelerationPublished);

    ros::spinOnce();

    // delay
    loop_rate.sleep();

    ++loopCount;
  }

  return 0;
}