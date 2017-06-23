#!/bin/bash

PROXY_DIR=$HOME/proxy-server
BIN_DIR=$PROXY_DIR/bin
SUPERVISOR_DIR=/etc/supervisor/conf.d

SHADOWSOCKS_SERVER_JSON=$PROXY_DIR/shadowsocks/shadowsocks-server.json
SHADOWSOCKS_SERVER_CONF=$SUPERVISOR_DIR/shadowsocks-server.conf
SHADOWSOCKS_SERVER_STDOUT=$PROXY_DIR/log/shadowsocks-server.log
KCPTUN_NUM=3

for ((i = 1; i <= KCPTUN_NUM; i++))
do
    KCPTUN_SERVER$i_CONF=$SUPERVISOR_DIR/kcptun_server$i.conf
	KCPTUN_SERVER$i_JSON=$PROXY_DIR/kcptun_server$i.json
	KCPTUN_SERVER$i_LOG=$PROXY_DIR/log/kcptun_server$i.log
done


sudo printf '\n'

if [ -d $SUPERVISOR_DIR ]
then
    printf "$SUPERVISOR_DIR diretory already exitsts.\n"
else
   apt-get install supervisor
fi

if [ -f $SHADOWSOCKS_SERVER_CONF ]
then
    rm -rf $SHADOWSOCKS_SERVER_CONF
    for ((i = 1; i <= $KCPTUN_NUM; i++))
    do
    	rm -rf $(KCPTUN_SERVER$i_CONF)
    done
    
else
    touch $SHADOWSOCKS_SERVER_CONF
    for (( i = 1; i <= $KCPTUN_NUM; i++))
    do
    	touch $(KCPTUN_SERVER$i_CONF)
    done 
fi

create_conf() {
	cat /dev/null > $SHADOWSOCKS_SERVER_CONF
	for ((i = 1; i <= 3; i++))
	do
		cat /dev/null > $(KCPTUN_SERVER$i_CONF)
	done

	printf "[program:shadowsocks-server]\n" 							>> $SHADOWSOCKS_SERVER_CONF
	printf "command = shadowsocks-server -c $SHADOWSOCKS_SERVER_JSON\n" >> $SHADOWSOCKS_SERVER_JSON
	printf "user=root\n" 												>> $SHADOWSOCKS_SERVER_CONF
	printf "autostart=true\n" 											>> $SHADOWSOCKS_SERVER_CONF
	printf "autorestart=true\n"											>> $SHADOWSOCKS_SERVER_CONF
	printf "stderr_logfile=$SHADOWSOCKS_SERVER_LOG"                     >> $SHADOWSOCKS_SERVER_CONF
	printf "stdout_logfile=$SUPERVISOR_DIR

}

