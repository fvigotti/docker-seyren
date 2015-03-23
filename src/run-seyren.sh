#!/bin/bash
set -o errexit

while [[ $# > 0 ]]
do
key="$1"

case $key in
    --MONGO_URL)
    export MONGO_URL="$2"
    shift
    ;;

    --SEYREN_URL)
    export SEYREN_URL="$2"
    shift
    ;;

    --SEYREN_LOG_PATH)
    export SEYREN_LOG_PATH="$2"
    shift
    ;;

    --GRAPHS_ENABLE)
    export GRAPHS_ENABLE="$2"
    shift
    ;;

    --GRAPHITE_URL)
    export GRAPHITE_URL="$2"
    shift
    ;;

    --GRAPHITE_REFRESH)
    export GRAPHITE_REFRESH="$2"
    shift
    ;;

    --GRAPHITE_USERNAME)
    export GRAPHITE_USERNAME="$2"
    shift
    ;;

    --GRAPHITE_PASSWORD)
    export GRAPHITE_PASSWORD="$2"
    shift
    ;;

    --GRAPHITE_KEYSTORE)
    export GRAPHITE_KEYSTORE="$2"
    shift
    ;;

    --GRAPHITE_KEYSTORE_PASSWORD)
    export GRAPHITE_KEYSTORE_PASSWORD="$2"
    shift
    ;;

    --GRAPHITE_TRUSTSTORE)
    export GRAPHITE_TRUSTSTORE="$2"
    shift
    ;;

    --GRAPHITE_CONNECTION_REQUEST_TIMEOUT)
    export GRAPHITE_CONNECTION_REQUEST_TIMEOUT="$2"
    shift
    ;;

    --GRAPHITE_CONNECT_TIMEOUT)
    export GRAPHITE_CONNECT_TIMEOUT="$2"
    shift
    ;;

    --GRAPHITE_SOCKET_TIMEOUT)
    export GRAPHITE_SOCKET_TIMEOUT="$2"
    shift
    ;;


    *)
            # unknown option
    ;;
esac
shift
done


[ -z "${GRAPHITE_URL}" ] && {
    echo 'all seyren accepted env vars are availble, but GRAPHITE_URL IS REQUIRED ! Usage: run-seyren.sh --GRAPHITE_URL $url'
    exit 1
}

export MONGO_URL=mongodb://$MONGODB_PORT_27017_TCP_ADDR:$MONGODB_PORT_27017_TCP_PORT/seyren

echo "MONGO_URL = ${MONGO_URL}" ;
echo "SEYREN_URL = ${SEYREN_URL}" ;
echo "SEYREN_LOG_PATH = ${SEYREN_LOG_PATH}" ;
echo "GRAPHS_ENABLE = ${GRAPHS_ENABLE}" ;
echo "GRAPHITE_URL = ${GRAPHITE_URL}" ;
echo "GRAPHITE_REFRESH = ${GRAPHITE_REFRESH}" ;
echo "GRAPHITE_USERNAME = ${GRAPHITE_USERNAME}" ;
echo "GRAPHITE_PASSWORD = ${GRAPHITE_PASSWORD}" ;
echo "GRAPHITE_KEYSTORE = ${GRAPHITE_KEYSTORE}" ;
echo "GRAPHITE_KEYSTORE_PASSWORD = ${GRAPHITE_KEYSTORE_PASSWORD}" ;
echo "GRAPHITE_TRUSTSTORE = ${GRAPHITE_TRUSTSTORE}" ;
echo "GRAPHITE_CONNECTION_REQUEST_TIMEOUT = ${GRAPHITE_CONNECTION_REQUEST_TIMEOUT}" ;
echo "GRAPHITE_CONNECT_TIMEOUT = ${GRAPHITE_CONNECT_TIMEOUT}" ;
echo "GRAPHITE_SOCKET_TIMEOUT = ${GRAPHITE_SOCKET_TIMEOUT}" ;

env

# timeout is in milliseconds
export TIMEOUT=600000
wait-for-mongo

java -jar /opt/seyren.jar