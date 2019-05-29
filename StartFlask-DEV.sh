#!/bin/bash
BASEDIR=`dirname $0`

Infile=$1
Environment=$2

function startserver
{
export FLASK_ENV=$Environment
export FLASK_APP=$Infile

#flask run --host=0.0.0.0 --port=80
flask run --host=0.0.0.0 --port=5000
}

startserver > $BASEDIR/flask.log 2>&1 &
