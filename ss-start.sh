#!/bin/bash

SS_CONFIGURE_FILE=$HOME/shadowsocks.json
SS_SERVER_OUT_FILE=$HOME/ssout.txt

nohup shadowsocks-server -c $SS_CONFIGURE_FILE > $SS_SERVER_OUT_FILE 2>&1 &
