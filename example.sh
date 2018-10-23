#!/bin/bash
hourglass.sh start
echo "starting time consuming job"
sleep 2
echo "show update of time consuming job"
sleep 3
echo "job finished"
hourglass.sh stop
echo "End of this example."