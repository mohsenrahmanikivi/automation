FROM ros:jazzy

SHELL ["/bin/bash", "-c"]

WORKDIR /ros2_ws

# Copy both ROS 2 repositories into the workspace
COPY ros2_ws/src ./src

# Copy lib  into the workspace
COPY ros2_ws/LibAPI ./LibAPI

# Library environment variables
ENV LD_LIBRARY_PATH=/ros2_ws/LibAPI/lib:${LD_LIBRARY_PATH}

# Basic build and dependency tools
RUN apt-get update && \
    apt-get install -y \
        python3-rosdep \
        python3-colcon-common-extensions && \
    rm -rf /var/lib/apt/lists/*

# Initialize rosdep
RUN rosdep init 2>/dev/null || true
RUN rosdep update

# Install dependencies declared by the ROS packages
RUN source /opt/ros/jazzy/setup.bash && \
    rosdep install \
        --from-paths src \
        --ignore-src \
        -r \
        -y

# Build the complete workspace
RUN source /opt/ros/jazzy/setup.bash && \
    colcon build



# Startup script
COPY start.sh /start.sh
RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]