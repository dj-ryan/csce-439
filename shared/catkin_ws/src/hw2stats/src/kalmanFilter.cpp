#include "ros/ros.h"
#include "std_msgs/String.h"
#include "std_msgs/Float64.h"

//#include "Eigen/Dense"




int loopCount = 0;




void sensorsAccelerationCallback(const std_msgs::Float64& data)
{
  // ROS_INFO("I heard: [%s]", msg->data.c_str());

}

void sensorsVelocityCallback(const std_msgs::Float64& data) {


}

void controlAccelerationCallback(const std_msgs::Float64& data) {



}

void groundtruthAltitudeCallback(const std_msgs::Float64& data) {


}

void groundtruthVelocityCallback(const std_msgs::Float64& data) {


}

void groundtruthAccelerationCallback(const std_msgs::Float64& data) {



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




  while (ros::ok())
    {

        std_msgs::Float64 altitude;
        std_msgs::Float64 velocity;
        std_msgs::Float64 acceleration;

        altitude.data = 10;
        velocity.data = 20;
        acceleration.data = 30;

        predictedAltitude.publish(altitude);
        predictedVelocity.publish(velocity);
        predictedAcceleration.publish(acceleration);

        

        ros::spinOnce();
        
        // delay
        loop_rate.sleep();

        ++loopCount;
    }

  return 0;
}