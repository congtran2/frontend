#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

if [ -z "$PASS_MACHINE" ] ; then
    PASS_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY DMZ MACHINE")
else
    PASS_MACHINE=$PASS_MACHINE
fi

init_swarm_dmz "$PASS_MACHINE"
bash $SCRIPT_DIR/openapi/add-label.sh