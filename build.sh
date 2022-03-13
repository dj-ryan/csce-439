# pip install serial serial-tool

# py tcp_serial_redirect.py COM3 57600 

# rosrun balboa serial


# docker build -t ros .
# localhost:5901
# pip install serial serial-tool
# 57600

# docker run --rm -v "//c/users/your-name/wherever-you-have-your-439-839-folder/shared:/home/shared" -p 5901:5901 -it ros
# docker run --rm -v "//c/users/its-student/Desktop/csce-439/shared:/home/shared" -p 5901:5901 -it ros


# Add to Path
# C:\Users\its-student\AppData\Local\Programs\Python\Python310 - \Scripts
# C:\Program Files\Docker\Docker\rescorces\bin
# C:\Program Files\Git\bin





# HELPFUL COMMANDS:

# docker system prune -a

# source devel/setup.bash 	#rebase / build workspace before catkin_make / building new code

# source /opt/ros/melodic/setup.bash

# rostopic pub /motorSpeeds balboa_core/balboaMotorSpeeds -- "{left: 0.0, right: 0.0}" 	   #publish motor speeds to robot using balboa core

# rosservice list 			#list running ros services

# rosservice /_serviceName_ info		#list info about ros services 

# :set ff=unix 			#in vim, converts mac/windows/etc return carriages and other things to unix

# rostopic info /nodeName		#gives data type and publishers/subscribers

# rostopic echo /nodeName		#prints out what node is publishing 

# rosmsg list 			#lists all ros messages

# rosmsg show package/topic	#gives info on ros messages & data structures 



# CHECKPOINT 1:
# tcp_serial_redirect.py
# tcp_serial_redirect.py /COM6 57600

# roscore
# rosrun turtlesim turtle_teleop_key
# rosrun balboa_core balboa_serial.py
# **rosrun lab1 proc_data.py
# **rosrun lab1 pidLab1.py
# **roslaunch lab1 pidLab1.launch
