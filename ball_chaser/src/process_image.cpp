#include "ros/ros.h"
#include "ball_chaser/DriveToTarget.h"
#include <sensor_msgs/Image.h>

// Define a global client that can request services
ros::ServiceClient client;

// This function calls the command_robot service to drive the robot in the specified direction
void drive_robot(float lin_x, float ang_z)
{
// DONE: Request a service and pass the velocities to it to drive the robot
  ROS_INFO("Sending request to move the robot.");

  // Initialize service with request values
  ball_chaser::DriveToTarget srv;
  srv.request.linear_x = lin_x;
  srv.request.angular_z = ang_z;

  // Attempt to call the service and log error if call fails
  if (!client.call(srv)) 
  {
    ROS_ERROR("Failed to call service /ball_chaser/command_robot");
  }
  
}

// This callback function continuously executes and reads the image data
void process_image_callback(const sensor_msgs::Image img)
{
    const int white_pixel = 255;

    // Iterate through every pixel in the image
    for (int i = 0; i < img.height * img.step; i += 3)
    {
        // Check for white pixel
        if (img.data[i] == white_pixel && img.data[i + 1] == white_pixel && img.data[i + 2] == white_pixel)
        {
            int column_index = i % img.step;

            // Determine the direction based on the column index
            if (column_index < img.step / 3)
                drive_robot(0.5, 1); // Turn left
            else if (column_index < 2 * img.step / 3)
                drive_robot(0.5, 0); // Move forward
            else
                drive_robot(0.5, -1); // Turn right

            return; // Exit after finding the ball
        }
    }

    // If no white pixel found, stop the robot
    drive_robot(0, 0);
}
int main(int argc, char** argv)
{
    // Initialize the process_image node and create a handle to it
    ros::init(argc, argv, "process_image");
    ros::NodeHandle n;

    // Define a client service capable of requesting services from command_robot
    client = n.serviceClient<ball_chaser::DriveToTarget>("/ball_chaser/command_robot");

    // Subscribe to /camera/rgb/image_raw topic to read the image data inside the process_image_callback function
    ros::Subscriber sub1 = n.subscribe("/camera/rgb/image_raw", 10, process_image_callback);

    // Handle ROS communication events
    ros::spin();

    return 0;
}
