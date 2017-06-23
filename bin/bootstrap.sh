#!/bin/bash

PROXY_DIR=$HOME/proxy-server
BIN_DIR=$PROXY_DIR/bin

cd $BIN_DIR

sudo cp run_server.sh /etc/init.d/

cd /etc/init.d

sudo chmod 777 /etc/init.d/run_server.sh

sudo update-rc.d run_server.sh defaults 95 



