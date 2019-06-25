#!/bin/bash
BASEDIR=`dirname $0`

Action=$1
Infile=$2
Environment=$3

function startserver
{
export FLASK_ENV=$Environment
export FLASK_APP=$Infile

#flask run --host=0.0.0.0 --port=80
flask run --host=0.0.0.0 --port=5000
}

function stopserver
{
  ps -eaf|grep -i "flask run"|grep -iv grep|awk '{print $2}'|xargs kill -9
}

if [ $Action == "Start" -o $Action == "start" -o $Action == "START" ]
then
    echo "Starting the Server"
    startserver > $BASEDIR/flask.log 2>&1 &
    exit
elif [ "$Action" == "Stop" -o  "$Action" == "stop" -o "$Action" == "STOP" ]
then
   echo  "Stopping the Server"
   stopserver >> $BASEDIR/flask.log
fi
