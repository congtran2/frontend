#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

FIRST_TIME=$1

if [ -z "$PASS_MACHINE" ] ; then
    PASS_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY DMZ MACHINE")
else
    PASS_MACHINE=$PASS_MACHINE
fi

git pull

fn_dmz_git_update "$PASS_MACHINE"

if [ "$FIRST_TIME" = "true" ] ; then 
    init_swarm_dmz "$PASS_MACHINE";
    bash $SCRIPT_DIR/openapi/add-label.sh
fi

docker login -u "readonly" -p "readonly" $REGISTRY:5000

deploy_dmz_tools_stack  "$SCRIPT_DIR/deployment.env"

if [ "$FIRST_TIME" = "true" ] ; then 
    fn_dmz_dtb_run_script_postgres "$PASS_MACHINE"
fi

deploy_dmz_service_stack  "$SCRIPT_DIR/deployment.env"

# deploy_dmz_fs2pro_stack  "$SCRIPT_DIR/deployment.env"

deploy_portainer_agent "$SCRIPT_DIR/deployment.env"
