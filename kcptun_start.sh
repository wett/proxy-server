#!/bin/bash

nohup server -c kcptun_server.json  > kcptun_server.log 2>&1 &

printf "kcptun started.\n"
cat kcptun_server.json
