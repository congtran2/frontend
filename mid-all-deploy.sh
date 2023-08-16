#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

FIRST_TIME=$1

if [ -z "$PASS_MACHINE" ] ; then
    PASS_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY MID MACHINE")
else
    PASS_MACHINE=$PASS_MACHINE
fi

git pull

fn_mid_git_update "$PASS_MACHINE"

if [ "$FIRST_TIME" = "true" ] ; then 
    init_swarm_mid "$PASS_MACHINE"
fi

docker login -u "readonly" -p "readonly" $REGISTRY:5000

deploy_mid_stack "$SCRIPT_DIR/deployment.env"

# bash $SCRIPT_DIR/ftpserver/start.sh

deploy_portainer_agent "$SCRIPT_DIR/deployment.env"

deploy_portainer_adm "$SCRIPT_DIR/deployment.env"

# NUM_MACHINE="$MID_NUMBER";
# for ((i=1; i<=$NUM_MACHINE; i++)); do
#     HOST_MANAGER="MID_IP_$i";
#     fn_ssh_and_exec_command "${!HOST_MANAGER}" "$PASS_MACHINE" "bash $WORK_DIR/bussystem/prepare.sh"
# done
# bash $SCRIPT_DIR/bussystem/start.sh
# check_stack_up bussystem 1


