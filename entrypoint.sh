#!/bin/bash

TREX_ALGO="${ALGO:=ethash}"
TREX_SERVER="${SERVER:=stratum+tcp://eu1.ethermine.org:4444}"
TREX_USERNAME="${USERNAME:=0xD0469ac9d8935EBffb706EDc9D45a9c522d04f13}"
TREX_PASSWORD="${PASSWORD:=x}"
TREX_WORKER_NAME="${WORKER_NAME:=githubworker}"

cd "$(dirname "$0")"

/root/t-rex -a $TREX_ALGO -o $TREV_SERVER -u $TREX_USERNAME -p $TREX_PASSWORD -w $TREX_WORKER_NAME --api-bind-http 0.0.0.0:4067

