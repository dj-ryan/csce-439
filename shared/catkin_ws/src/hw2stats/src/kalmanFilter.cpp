#include "ros/ros.h"
#include "std_msgs/String.h"




int loopCount = 0;




void chatterCallback(const std_msgs::String::ConstPtr& msg)
{
  ROS_INFO("I heard: [%s]", msg->data.c_str());
}




int main(int argc, char **argv)
{

  ros::init(argc, argv, "kalmanFilter");

 
  ros::NodeHandle n;

  ros::Subscriber sub = n.subscribe("chatter", 1000, chatterCallback);

  while (ros::ok())
    {




        pub.publish(msg);

        ros::spinOnce();
        
        // delay
        loop_rate.sleep();

        ++loopCount;
    }

  return 0;
}