```bash
#!/bin/bash

set -e

echo "Starting Envimo ROS 2 system..."

# Source ROS 2 Jazzy
source /opt/ros/jazzy/setup.bash

# Source the compiled workspace
source /ros2_ws/install/setup.bash

echo "ROS distribution: $ROS_DISTRO"
echo "ROS workspace: $ROS_WS"

# Start Envimo
exec ros2 launch envimo401_bringup envimo401.launch.py
```
