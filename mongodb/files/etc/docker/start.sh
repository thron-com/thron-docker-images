#!/usr/bin/env bash
MONGO_INIT_LOCK_PATH=/etc/mongod-init.lock
MONGOD_START_PORT=27017


MONGOD_MEMBERS=""
for MONGOD_ID in $(seq 1 ${MONGOD_INSTANCES}); do 
  export MONGOD_PORT=$(($MONGOD_START_PORT + $MONGOD_ID - 1))
  export MONGOD_ID
  mkdir -p /data/db-${MONGOD_ID}
  envsubst < /etc/mongod.conf.template > /etc/mongod-${MONGOD_ID}.conf
  if [ "${MONGOD_ID}" != 1 ]; then
    MONGOD_MEMBER="{_id: ${MONGOD_ID},host: \"127.0.0.1:${MONGOD_PORT}\"}"
    MONGOD_MEMBERS="${MONGOD_MEMBERS},${MONGOD_MEMBER}"
  else
    MONGOD_MEMBER="{_id: ${MONGOD_ID},priority: 2, host: \"127.0.0.1:${MONGOD_PORT}\"}"
    MONGOD_MEMBERS="${MONGOD_MEMBER}"
  fi
  mongod -f /etc/mongod-${MONGOD_ID}.conf &
done

cfg="{_id: \"${MONGOD_REPLICA_SET}\",members: [${MONGOD_MEMBERS}]}"
{
  sleep 10s; 
  if [ ! -f "${MONGO_INIT_LOCK_PATH}" ]; then
    echo $cfg
    mongo localhost:${MONGOD_START_PORT} --eval "JSON.stringify(db.adminCommand({'replSetInitiate' : $cfg}))";
    touch "${MONGO_INIT_LOCK_PATH}";
  fi
}&
bash
