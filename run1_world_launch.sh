#!/bin/bash

#Creates a new variable with a value of "Run"
learningbash="World Launch"
echo $learningbash
source devel/setup.bash
sleep .5 # Waits 0.5 second.
roslaunch my_robot world.launch
