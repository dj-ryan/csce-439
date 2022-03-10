#include "ros/ros.h"
#include "std_msgs/String.h"

#include <ros/callback_queue.h>

// include custom message types
#include "hw2stats/offensivePlay.h"
#include "hw2stats/gameStatsMsg.h"


// loop count variable 
int loopCount = 0;

// class to hold game stats
class gameStats
{

private:
    // total passes compleated
    double totalPassesCompleated;
    // total passes droped
    double totalPassesDropped;
    // total rushing yards
    double totalRushingYards;
    // total passing yards
    double totalPassingYards;

public:
    // incraments total compleated passes
    void updateTotalPassesCompleated() { totalPassesCompleated++; }
    // incraments total dropped passes
    void updateTotalPassesDropped() { totalPassesDropped++; }
    // incraments total rushing yards
    void updateTotalRushingYards(double yards) { totalRushingYards += yards; }
    // incraments total passing yards
    void updateTotalPassingYards(double yards) { totalPassingYards += yards; }
    // getter for total rushing yards
    double getRushingYards() { return totalRushingYards; }
    // getter for total passing yards
    double getPassingYards() { return totalPassingYards; }
    // calculates compleation percentage
    double getPassCompleationPercentage() { return (totalPassesCompleated * 100) / (totalPassesCompleated + totalPassesDropped); }
    // calculates incompletion  percentage 
    double getPassIncompletionPercentage() { return (totalPassesDropped * 100) / (totalPassesCompleated + totalPassesDropped); }
    // prints class similier to a rostopic echo
    void printStats();
    // returns a message type generated from the class values
    hw2stats::gameStatsMsg generateMessage();
};


// print fuction definition
void gameStats::printStats()
{
    ROS_INFO("==================");
    ROS_INFO("Compilations: %.0f | Dropped: %.0f | Total: %.0f", totalPassesCompleated, totalPassesDropped, (totalPassesCompleated + totalPassesDropped));
    ROS_INFO("Compilation: %%%.2f | Incompletion: %%%.2f", getPassCompleationPercentage(), getPassIncompletionPercentage());
    ROS_INFO("Rushing: %.0f | Passing: %.0f", totalRushingYards, totalPassingYards);
}


// message generation definition
hw2stats::gameStatsMsg gameStats::generateMessage()
{
    hw2stats::gameStatsMsg msg;
    msg.passCompleationPercentage = getPassCompleationPercentage();
    msg.passIncompletionPercentage = getPassIncompletionPercentage();
    msg.totalRushingYards = totalRushingYards;
    msg.totalPassingYards = totalPassingYards;

    return msg;
}

// global gameStats class
gameStats gameStats;


void playCallback(const hw2stats::offensivePlay &data)
{
    // compleated pass
    if (data.isPass == true && data.passCompleted == true)
    {
        gameStats.updateTotalPassesCompleated();
        gameStats.updateTotalPassingYards(data.yards);
    }
    // dropped pass
    else if (data.isPass == true && data.passCompleted == false)
    {
        gameStats.updateTotalPassesDropped();
    }

    // run play
    if (data.isPass == false)
        gameStats.updateTotalRushingYards(data.yards);
}

int main(int argc, char **argv)
{
    ROS_INFO("hw2stats/offensivePlay node starting........\n");

    ros::init(argc, argv, "offensiveStates");

    ros::NodeHandle n;

    // subscribe on plays/huskerkOffensivePlay
    ros::Subscriber sub = n.subscribe("plays/huskerkOffensivePlay", 1000, playCallback);

    // publish on plays/currentGameStats
    ros::Publisher pub = n.advertise<hw2stats::gameStatsMsg>("plays/currentGameStats", 1000);

    ros::Rate loop_rate(10);

    while (ros::ok())
    {
        // print stats
        gameStats.printStats();

        //get message type from class
        hw2stats::gameStatsMsg msg = gameStats.generateMessage();

        // assign current time to header
        msg.header.stamp = ros::Time::now();

        pub.publish(msg);

        ros::spinOnce();
        
        // delay
        loop_rate.sleep();

        ++loopCount;
    }

    return 0;
}