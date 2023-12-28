#!/bin/bash

#Creates a new variable with a value of "Run"
RunComp="World Launch"
echo $RunComp
source devel/setup.bash
roslaunch ball_chaser ball_chaser.launch
