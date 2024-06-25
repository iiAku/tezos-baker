#!/bin/bash 

#. `which tezos-env.sh` - make sure to source the tezos environment variables

nohup tezpay continual -p $TEZPAY_RUN_DIR --disable-donation-prompt &>$TEZPAY_LOG_FILE &

sleep 1
ps aux | grep tezpay | grep -v grep
