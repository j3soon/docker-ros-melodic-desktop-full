# (Flattened) Docker image for `ros-melodic-desktop-full`

[<img src="https://img.shields.io/badge/dockerhub-image-important.svg?logo=docker">](https://hub.docker.com/r/j3soon/ros-melodic-desktop-full/tags)

A quick reference for setting up `ros-melodic-desktop-full` (binary install) upon custom base image.

## Installation

Clone the repo:

```sh
git clone https://github.com/j3soon/docker-ros-melodic-desktop-full.git
cd docker-ros-melodic-desktop-full
```

## Run

```sh
sudo apt-get update && sudo apt-get install -y docker.io docker-compose
docker run --rm -it j3soon/ros-melodic-desktop-full:latest
roscore
```

The [pre-built docker images](https://hub.docker.com/r/j3soon/ros-melodic-desktop-full/tags) will be pulled automatically.

## Build Docker Images Locally

```sh
docker build -t j3soon/ros-melodic-desktop-full:latest .
```
