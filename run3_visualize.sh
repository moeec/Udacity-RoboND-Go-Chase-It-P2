#!/bin/bash

#Creates a new variable with a value of "Run"
RunComp="Lidar Camera Launch"
echo $RunComp
source devel/setup.bash
sleep .5 # Waits 0.5 second.
rosrun rqt_image_view rqt_image_view  
