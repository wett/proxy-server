#!/bin/bash

server -c kcptun_server.json 2>&1 &

printf "kcptun started.\n"
cat kcptun_server.json
