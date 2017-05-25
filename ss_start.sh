#!/bin/bash

SS_CONFIGURE_FILE=$PWD/shadowsocks.json
SS_SERVER_OUT_FILE=$PWD/shadowsocks.log

nohup shadowsocks-server -c $SS_CONFIGURE_FILE > $SS_SERVER_OUT_FILE 2>&1 &

