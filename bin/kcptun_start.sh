#!/bin/bash

PROXY_DIR=$HOME/proxy-server
CONFIGURE1=$PROXY_DIR/kcptun/kcptun_server1.json
CONFIGURE2=$PROXY_DIR/kcptun/kcptun_server2.json
CONFIGURE3=$PROXY_DIR/kcptun/kcptun_server3.json
LOG1=$PROXY_DIR/log/kcptun_server1.log
LOG2=$PROXY_DIR/log/kcptun_server2.log
LOG3=$PROXY_DIR/log/kcptun_server3.log

nohup server -c $CONFIGURE1> $LOG1 2>&1 &
nohup server -c $CONFIGURE2> $LOG2 2>&1 &
nohup server -c $CONFIGURE3> $LOG3 2>&1 &

