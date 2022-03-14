#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"

#include <unistd.h>
#include <stdlib.h>

#include <Eigen/Dense>

#include "hw2stats/rocketState.h"

int loopCount = 0;

// Set true for debug print output
int debug = true;

// Set true to publish to debug topics
int debugTopics = true;

// Sensor data struct
struct SensorData
{
  float velocity;
  float acceleration;
};

// Ground truth struct
struct GroundData
{
  float altitude;
  float velocity;
  float acceleration;
};

// Predicted data struct
struct PredictionData
{
  float altitude;
  float velocity;
  float acceleration;
};

/* === Global vars === */
SensorData sensorData;
GroundData groundData;
PredictionData predictionData;
float controlAccelerationValue;

/* === Call back function deffinitions === */

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

/* === Debug function deffinitions === */

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

/*
* === Kalman filter function definitions ===
* Naming Scheme:
* (adjusted for better comprehension)
*   - Steps:
        Time Update => Prediction Step
        Measurment Update => Correction Step
    - Matrices:
        a priori estimate => x_predict & p_predict
        a posteriori estimate => x_correct & p_correct
        Previous step => x_old & p_old
*/

void calculatePredictionStep(Eigen::Matrix<float, 3, 1> *x_predict,
                             Eigen::Matrix<float, 3, 3> *p_predict,
                             Eigen::Matrix<float, 3, 3> A,
                             Eigen::Matrix<float, 3, 1> x_old,
                             Eigen::Matrix<float, 3, 3> B,
                             Eigen::Matrix<float, 3, 1> u,
                             Eigen::Matrix<float, 3, 3> p_old,
                             Eigen::Matrix<float, 3, 3> Q)
{

  /* === Prediction step ===
   * The time update equations are responsible for projecting
   * forward (in time) the current state and error covariance
   * estimates to obtain the a priori estimates for the next time step.
   */

  /*
   * The a priori state based on the previous step and
   * the control paramiter
   */
  *x_predict = (A * x_old) + (B * u);

  /*
   * The a priori error covariance based on
   * the previous step and the process noise covariance
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

  /* === Correction Step ===
   * The measurement update equations are responsible for the feedback—i.e.
   * for incorporating a new measurement into the a priori estimate to
   * obtain an improved a posteriori estimate.
   */

  /*
   * The matrix K is the Kalman gain or blending factor that
   * minimizes the a posteriori error covariance
   */
  Eigen::Matrix<float, 3, 3> K_term0 = p_predict * H.transpose();
  Eigen::Matrix<float, 3, 3> K_term1 = (H * p_predict * H.transpose()) + R;
  /*
   * Final Kalman gain term, no need to save, can be calculated anew ever time
   */
  Eigen::Matrix<float, 3, 3> K = K_term0 * K_term1.inverse();

  /*
   * The difference between z and (H * x_predict) is called the measurement innovation,
   * or the residual. The residual reflects the discrepancy between the predicted
   * measurement and the actual measurement . A residual of zero means that the
   * two are in complete agreement.
   */
  Eigen::Matrix<float, 3, 1> residual = z - (H * x_predict);

  /*
   * The a posteriori state estament based on the actually measurements the process
   */
  *x_correct = x_predict + residual;

  /*
   * The a posteriori error covariance correction
   */
  Eigen::Matrix<float, 3, 3> p_correct_term0 = K * H;
  Eigen::Matrix<float, 3, 3> p_correct_term1 = I - p_correct_term0;
  *p_correct = p_correct_term1 * p_predict;
}

/* === main === */

int main(int argc, char **argv)
{

  ros::init(argc, argv, "kalmanFilter");

  ROS_INFO("hw2stats/kalmanFilter node starting......");

  ros::NodeHandle n;

  /* === Subscriptions === */
  ros::Subscriber sensorsAcceleration = n.subscribe("sensors/acceleration", 1000, sensorsAccelerationCallback);
  ros::Subscriber sensorsVelocity = n.subscribe("sensors/velocity", 1000, sensorsVelocityCallback);
  ros::Subscriber controlAcceleration = n.subscribe("control/acceleration", 1000, controlAccelerationCallback);
  ros::Subscriber groundtruthAltitude = n.subscribe("groundtruth/altitude", 1000, groundtruthAltitudeCallback);
  ros::Subscriber groundtruthVelocity = n.subscribe("groundtruth/velocity", 1000, groundtruthVelocityCallback);
  ros::Subscriber groundtruthAcceleration = n.subscribe("groundtruth/acceleration", 1000, groundtruthAccelerationCallback);

  /* === Publishers === */
  ros::Publisher predictedAltitude = n.advertise<std_msgs::String>("predicted/altitude", 1000);
  ros::Publisher predictedVelocity = n.advertise<std_msgs::Float64>("predicted/velocity", 1000);
  ros::Publisher predictedAcceleration = n.advertise<std_msgs::Float64>("predicted/acceleration", 1000);
  ros::Publisher trueRocketState = n.advertise<hw2stats::rocketState>("trueRocketState", 1000);
  ros::Publisher predictedKalmanState = n.advertise<hw2stats::rocketState>("predictedKalmanState", 1000);
  

  ros::Rate loop_rate(100);

  // Initalize matrices A, B, H, Q, R, X, P, u, z

  /*
   * Matrix A relates the state at the previous
   * time step to the state at the current step
   */
  Eigen::Matrix<float, 3, 3> A;
  A << 0, 0, 0,
      0, 0.1, 0,
      0, 0, 0.1;

  /*
   * Matrix B relates the current control
   * value to the a priori state
   */
  Eigen::Matrix<float, 3, 3> B;
  B << 0, 0, 0,
      0, 0, 0,
      0, 0, 1;

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
   * Measurment noise covariance
   */
  Eigen::Matrix<float, 3, 3> R;
  R << 1, 0, 0,
      0, 1, 0,
      0, 0, 1;

  /*
   * State
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
  Eigen::Matrix<float, 3, 3> p_predict; // current state initalize to zero
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

  if (debug)
  {
    // print matrices A, B, H, Q, R, K, X, P, u, z
    ROS_INFO("=== Kalman filter setup ===");
    ROS_INFO("A:");
    debugPrint3x3Matrix(A);

    ROS_INFO("B:");
    debugPrint3x3Matrix(B);

    ROS_INFO("H:");
    debugPrint3x3Matrix(H);

    ROS_INFO("Q:");
    debugPrint3x3Matrix(Q);

    ROS_INFO("R:");
    debugPrint3x3Matrix(R);
  }

  /* main loop */

  while (ros::ok())
  {

    /* grab current values */
    // This is the only element of the controll matrix that needs to be updated because it is the only paramater provided.
    u(2, 0) = controlAccelerationValue;
    // save old prediction value as old value
    x_old = x_predict;
    p_old = p_predict;
    // Update sensor data
    z(1, 0) = sensorData.velocity;
    z(2, 0) = sensorData.acceleration;

    /* === Prediction step === */

    calculatePredictionStep(&x_predict, &p_predict, A, x_old, B, u, p_old, Q);

    /* === Correction Step === */

    calculateCorrectionStep(&x_correct, &p_correct, p_predict, H, R, z, x_predict);

    /* === Publish data to topics === */

    if (debug)
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

    if(debugTopics) {
      hw2stats::rocketState currentTrueRocketState;
      hw2stats::rocketState currentPredictedKalmanState;

      currentTrueRocketState.altitude = groundData.altitude;
      currentTrueRocketState.velocity = groundData.velocity;
      currentTrueRocketState.acceleration = groundData.acceleration;

      currentTrueRocketState.header.stamp = ros::Time::now();

      currentPredictedKalmanState.altitude = p_correct(0,0);
      currentPredictedKalmanState.velocity = p_correct(1,0);
      currentPredictedKalmanState.acceleration  = p_correct(2,0);

      currentPredictedKalmanState.header.stamp = ros::Time::now();

      trueRocketState.publish(currentTrueRocketState);
      predictedKalmanState.publish(currentPredictedKalmanState);
    }

    // get all available messages
    ros::spinOnce();

    // delay
    loop_rate.sleep();

    ++loopCount;
  }

  return 0;
}