#!/bin/bash
echo "Tool to generate reports of db mysql queries from slow log"
echo "Usage: $0 <minutes_to_run>\n"
echo "Data is saved into file report-Y-m-d.txt"
if [ "$1" == "" ]; then
    PERIOD=5
else
    PERIOD=$1
fi
echo "Running genetating of report for $PERIOD minutes"
./clean.sh
./start.sh
COUNTER=0
while [ $COUNTER -lt $PERIOD ]; do
 sleep 60
 let COUNTER=COUNTER+1 
 echo "$COUNTER"
done
./end.sh
FNAME=`date +report-%Y-%m-%d-%H-%M.txt`
./gen.sh $FNAME
echo "Data saved to $FNAME"
