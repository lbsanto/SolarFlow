#!/bin/bash

# backend
/app/backend/Energy_ws &

# nginx
nginx -g "daemon off;"
