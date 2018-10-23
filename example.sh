#!/bin/bash
# The best usage is to copy hourglass.sh to a location within the PATH environment!
# Otherwise it is done with the absolute path set within this example.
Path2Hourglass="./"
${Path2Hourglass}hourglass.sh start
echo "starting time consuming job"
sleep 2
echo "show update of time consuming job"
sleep 3
echo "job finished"
${Path2Hourglass}hourglass.sh stop
echo "End of this example."
