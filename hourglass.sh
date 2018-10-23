#!/bin/bash
# The script is working for a Linux OS on a bash terminal.
# Tested on Linux Mint
# This script will show an ASCII hourglass on the terminal when you call it with the argument "start"
# To stop the moving hourclass call the script with "stop".
# Recommended sequence of usage within an other bash script:
# 1. Before you start a time consuming job (like a bigger download) call
# hourglass.sh start
# 2. Start your job e.g. start coping an disk image with dd
# 3. After finishing the job call
# hourglass.sh stop

case $1 in
   start)
    $0 privatestart & 2>/dev/null
    ;;
   stop)
    $0 privatestop  & 2>/dev/null
    ;;
   privatestart)
    CURSOR_MOVE="\033[1D"
    #"\r"
    #seq 1 100 | while read num2; do 
    num="0"

    while [ true ] 
    do
      num=$[$num+1]

      
      if (( num % 4 == 0 )); then
        echo -ne $CURSOR_MOVE
        printf "|";
      else 
        if (( num % 4 == 1 )); then 
          echo -ne $CURSOR_MOVE
          printf "/";
        else 
          if (( num % 4 == 2 )); then  
            echo -ne $CURSOR_MOVE
            printf "-";
          else
            echo -ne $CURSOR_MOVE
            printf "\\"
          fi
        fi
      fi
      sleep 0.1;
      num=$(($num % 400));
    done;
    echo -ne $CURSOR_MOVE
    
    
    ;;
   privatestop)
    scriptName=$(basename "$0")
    for x in `pgrep -f $scriptName`; 
    do 
        kill $x > /dev/null 2>&1 &
    done;
    ;;
   *)
    ;;
esac

