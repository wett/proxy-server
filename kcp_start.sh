#!/bin/bash

./server_linux_amd64 -c kcp_server.json 2>&1 &

printf "kcptun started.\n"
cat kcp_server.json
