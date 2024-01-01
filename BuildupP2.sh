#!/bin/bash

#This was created to rebuild P2 project after I run into issues

RunComp="Go Chase it Build out"
echo $RunComp
mkdir -p ~/catkin_ws/src
sleep .3 # Waits 0.3 second.
cd ~/catkin_ws/src
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
echo "<?xml version="1.0" encoding="UTF-8"?>

<sdf version="1.4">

  <world name="default">

    <include>
      <uri>model://ground_plane</uri>
    </include>

    <!-- Light source -->
    <include>
      <uri>model://sun</uri>
    </include>

    <!-- World camera -->
    <gui fullscreen='0'>
      <camera name='world_camera'>
        <pose>4.927360 -4.376610 3.740080 0.000000 0.275643 2.356190</pose>
        <view_controller>orbit</view_controller>
      </camera>
    </gui>

  </world>
</sdf>" >> empty.world
sleep .5 # Waits 0.5 second.
cd ~/catkin_ws/src/my_robot/launch/ 
touch world.launch
echo "<?xml version="1.0" encoding="UTF-8"?>

<launch>

  <!-- World File -->
  <arg name="world_file" default="$(find my_robot)/worlds/empty.world"/>

  <!-- Launch Gazebo World -->
  <include file="$(find gazebo_ros)/launch/empty_world.launch">
    <arg name="use_sim_time" value="true"/>
    <arg name="debug" value="false"/>
    <arg name="gui" value="true" />
    <arg name="world_name" value="$(arg world_file)"/>
  </include>

</launch>" >> world.launch
echo "Launching World"
sleep 3 # Waits 3 second.
cd ~/catkin_ws/
catkin_make
source devel/setup.bash
roslaunch my_robot world.launch


