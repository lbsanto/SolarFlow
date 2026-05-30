#!/bin/bash

ARCH=$(uname -m)

echo "Detected architecture: $ARCH"

case "$ARCH" in
    x86_64)
        echo "Starting ws_x86_64"
        /app/backend/ws_x86_64 &
        ;;
    aarch64)
        echo "Starting ws_arm (ARM64)"
        /app/backend/ws_arm &
        ;;
    armv7l)
        echo "Starting ws_arm (ARM32)"
        /app/backend/ws_arm &
        ;;
    *)
        echo "Unsupported architecture: $ARCH"
        exit 1
        ;;
esac

# nginx
nginx -g "daemon off;"
