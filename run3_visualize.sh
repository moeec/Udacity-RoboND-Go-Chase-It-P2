#!/bin/bash

#Creates a new variable with a value of "Run"
RunComp="Lidar Camera Launch"
echo $RunComp
source devel/setup.bash
rosrun rqt_image_view rqt_image_view  
