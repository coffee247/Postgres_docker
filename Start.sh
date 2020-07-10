#!/bin/bash

up="docker-compose up -d"
echo ""
echo "****** Stop any running servers on same port before starting up *****"
sh ./Stop.sh
echo "Executing Start command: " $up
$up
echo "Your database is available on localhost:"
