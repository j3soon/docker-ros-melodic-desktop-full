FROM ubuntu:bionic

# ros-core
# Ref: https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/ros-core/Dockerfile
# setup timezone
RUN echo 'Etc/UTC' > /etc/timezone && \
    # ln -s /usr/share/zoneinfo/Etc/UTC /etc/localtime && \
    apt-get update && \
    apt-get install -q -y --no-install-recommends tzdata && \
    rm -rf /var/lib/apt/lists/*
# install packages
RUN apt-get update && apt-get install -q -y --no-install-recommends \
    dirmngr \
    gnupg2 \
    && rm -rf /var/lib/apt/lists/*
# setup sources.list
RUN echo "deb http://snapshots.ros.org/melodic/final/ubuntu bionic main" > /etc/apt/sources.list.d/ros1-snapshots.list
# setup keys
RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 4B63CF8FDE49746E98FA01DDAD19BAB3CBF125EA
# setup environment
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV ROS_DISTRO melodic
# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-ros-core=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# ros-base
# Ref: https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/ros-base/Dockerfile
# install bootstrap tools
RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    python-rosdep \
    python-rosinstall \
    python-vcstools \
    && rm -rf /var/lib/apt/lists/*
# bootstrap rosdep
RUN rosdep init && \
  rosdep update --rosdistro $ROS_DISTRO
# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-ros-base=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# ros-robot
# Ref: https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/robot/Dockerfile
# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-robot=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# ros-desktop
# Ref: https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/desktop/Dockerfile
# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-desktop=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# ros-desktop-full
# Ref: https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/desktop-full/Dockerfile
# install ros packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    ros-melodic-desktop-full=1.4.1-0* \
    && rm -rf /var/lib/apt/lists/*

# ros-core
# Ref: https://github.com/osrf/docker_images/blob/master/ros/melodic/ubuntu/bionic/ros-core/Dockerfile
# setup entrypoint
COPY ./thirdparty/ros_entrypoint.sh /
ENTRYPOINT ["/ros_entrypoint.sh"]
CMD ["bash"]
