#!/bin/bash

PROXY_DIR=$HOME/proxy-server
CONFIGURE=$PROXY_DIR/shadowsocks/shadowsocks.json
LOG=$PROXY_DIR/log/shadowsocks.log

nohup shadowsocks-server -c $CONFIGURE> $LOG 2>&1 &

