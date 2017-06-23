#!/bin/bash

PROXY_DIR=$HOME/proxy-server
BIN_DIR=$PROXY_DIR/bin

cd $BIN_DIR
./ss_start.sh
./kcptun_start.sh

