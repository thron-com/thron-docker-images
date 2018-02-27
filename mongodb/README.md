# Mongo

It will start sequentially a Mongo node from the port 27017

Environment variable:
* set `MONGOD_REPLICA_SET` to specify the replica set name. If not set it will use the default name `myReplSet`
* set `MONGOD_INSTANCES` to specify the number of node in the replica set. If not set it will use 3.
