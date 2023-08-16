#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

docker login -u "readonly" -p "readonly" $REGISTRY:5000
deploy_portainer_adm "$SCRIPT_DIR/deployment.env"
