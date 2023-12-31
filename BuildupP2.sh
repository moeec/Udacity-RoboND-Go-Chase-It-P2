#!/bin/bash

#This was created to rebuild P2 project after I run into issues

RunComp="Go Chase it Build out"
echo $RunComp
mkdir -p ~/catkin_ws2/src
sleep .3 # Waits 0.3 second.
cd ~/catkin_ws2/src
sleep .3 # Waits 0.3 second.
catkin_init_workspace
sleep 10 # Waits 10 second. 
cd ~/catkin_ws/src/
sleep .3 # Waits 0.3 second.
catkin_create_pkg my_robot
sleep 10 # Waits 10 second. 
cd ~/catkin_ws/src/my_robot/
mkdir launch
sleep .3 # Waits 0.3 second.
mkdir worlds
sleep .3 # Waits 0.3 second.
cd ~/catkin_ws/src/my_robot/worlds/
touch empty.world

