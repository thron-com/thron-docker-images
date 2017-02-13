#!/usr/bin/env bash

LOCUSTIO_PATH=/opt/locustio

echo "Waiting..."
sleep 5s

mkdir -p ${LOCUSTIO_PATH}
cd ${LOCUSTIO_PATH}

echo "LOCUSTIO_HOST: set the host to test. For example http://www.example.com"
echo "LOCUSTIO_SCRIPT: set the URL to the script for the test. For example http://www.example.com/myscript.py"
echo "LOCUSTIO_MASTER: set the master endpoint"

if [ -z "${LOCUSTIO_HOST}" ];
then
    echo "Host not set, please set the LOCUSTIO_HOST variable"
    LOCUSTIO_HOST="http://127.0.0.1"
fi

if [ -z "${LOCUSTIO_SCRIPT}" ];
then
    echo "Script not set, please set the LOCUSTIO_SCRIPT variable"
    exit 1
else
    echo "Downloading script"
    wget -O ${LOCUSTIO_PATH}/script.py ${LOCUSTIO_SCRIPT}
fi

if [ ! -z "${LOCUSTIO_MASTER}" ];
then
    echo "Running slave"
    locust -f ${LOCUSTIO_PATH}/script.py --slave --master-host=${LOCUSTIO_MASTER} --host=${LOCUSTIO_HOST}
else
    echo "Running master"
    locust -f ${LOCUSTIO_PATH}/script.py --master --host=${LOCUSTIO_HOST}
fi

