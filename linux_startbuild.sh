#!/bin/bash

CONTAINER_NAME="energy-app"
IMAGE_NAME="energy-app"

function show_help() {
  echo "Usage: $0 {build|start|stop|remove|help}"
  echo ""
  echo "Commands:"
  echo "  build   - Stop container (if exists) and build image"
  echo "  start   - Create if not exists and start container"
  echo "  stop    - Stop container if running"
  echo "  remove  - Remove container and image"
  echo "  help    - Show this help"
}

case "$1" in

  build)
    echo "Stopping container (if exists)…"
    docker stop $CONTAINER_NAME 2>/dev/null
    docker rm $CONTAINER_NAME 2>/dev/null

    echo "Building image…"
    docker build --no-cache -t $IMAGE_NAME -f deploy/Dockerfile .
    ;;

  remove)
    echo "Stopping container (if exists)…"
    docker stop $CONTAINER_NAME 2>/dev/null

    echo "Removing container (if exists)…"
    docker rm $CONTAINER_NAME 2>/dev/null

    echo "Removing image (if exists)…"
    docker rmi $IMAGE_NAME 2>/dev/null
    ;;
  
 start)
    if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
      echo "Container exists. Starting…"
      docker start $CONTAINER_NAME
    else
      echo "Creating container…"
      docker run -d \
        --name $CONTAINER_NAME \
        -p 80:80 \
        -p 8089:8089 \
        $IMAGE_NAME
      echo "Container exists. Starting…"
      docker start $CONTAINER_NAME
    fi
    ;;

 stop)
    if docker ps -a --format '{{.Names}}' | grep -q "^$CONTAINER_NAME$"; then
      echo "Stopping container…"
      docker stop $CONTAINER_NAME
    else
      echo "Container does not exist."
    fi
    ;;

help|"")
    show_help
    ;;

  *)
    echo "Invalid option: $1"
    echo ""
    show_help
    exit 1
    ;;
esac
