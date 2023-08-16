#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

docker login -u "readonly" -p "readonly" $REGISTRY:5000
bash $SCRIPT_DIR/bussystem/start.sh
check_stack_up bussystem 1