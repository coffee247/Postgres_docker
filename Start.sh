#!/bin/bash

up="docker-compose up -d"
echo ""
echo "****** Stop any running servers on same port before starting up *****"
sh ./Stop.sh
echo "Executing Start command: " $up
$up
echo "Now open a browser and navigate to localhost:8085"
echo "Select PostgreSQL from system dropdown"
echo "Enter User: postgres"
echo "Enter Password: password"
echo ""
echo "Examine created database called   rbims   "
