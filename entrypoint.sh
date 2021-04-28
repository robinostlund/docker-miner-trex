#!/bin/bash
#################################
## Begin of user-editable part ##
#################################

SERVER=eu1.ethermine.org:5555
ETH_ADDRESS=0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13
WORKER_NAME=$HOSTNAME

#################################
##  End of user-editable part  ##
#################################

cd "$(dirname "$0")"

/root/t-rex -a ethash -o stratum+tcp://$SERVER -u $ETH_ADDRESS -p x -w $WORKER_NAME 

