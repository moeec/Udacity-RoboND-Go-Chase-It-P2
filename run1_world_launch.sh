#!/bin/bash

#Creates a new variable with a value of "Run"
learningbash="World Launch"
echo $learningbash
source devel/setup.bash
roslaunch my_robot world.launch
