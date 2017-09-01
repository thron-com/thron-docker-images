#!/bin/bash

DIFFY_EXPOSED_PORT=8080

if [ -z ${DIFFY_OPT} ]; then
  DIFFY_OPT='-allowHttpSideEffects=true -excludeHttpHeadersComparison=true'
fi

if [ -z ${CANDIDATE} ]; then echo "You MUST set the CANDIDATE env var"; exit 1; fi
if [ -z ${MASTER_PRIMARY} ]; then echo "You MUST set the MASTER_PRIMARY env var"; exit 1; fi
if [ -z ${MASTER_SECONDARY} ]; then echo "You MUST set the MASTER_SECONDARY env var"; exit 1; fi

cd ${DIFFY_PATH}

java -jar ./target/scala-2.11/diffy-server.jar   -candidate="${CANDIDATE}"   -master.primary="${MASTER_PRIMARY}"   -master.secondary="${MASTER_SECONDARY}"   -service.protocol="http"   -serviceName="MyApp"   -proxy.port=:${DIFFY_EXPOSED_PORT}   -admin.port=:31159   -http.port=:31149   -rootUrl=localhost:31149 ${DIFFY_OPT} &

duplicator -f ${MASTER_PRIMARY} -d localhost:${DIFFY_EXPOSED_PORT} -p 80

