#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

if [ -z "$PASS_MACHINE" ] ; then
    PASS_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY DMZ MACHINE")
else
    PASS_MACHINE=$PASS_MACHINE
fi

#prepare máy leader
echo $PASS_MACHINE | sudo -S bash lib/install_tools.sh
echo $PASS_MACHINE | sudo -S bash lib/install_docker.sh $USER
echo $PASS_MACHINE | sudo -S bash lib/increase_ulimit.sh
bash lib/set_permission.sh
ABSOLUTE_SCRIPT_DIR=$(SELF=$(dirname "$0") && bash -c "cd \"$SELF\" && pwd")
echo $PASS_MACHINE | sudo -S bash $SCRIPT_DIR/crontab/set-crontab.sh

#prepare máy remote
fn_prepare_dmz_machine_remote "$PASS_MACHINE"
fn_exec_command_on_dmz_machine_remote "$PASS_MACHINE" "echo $PASS_MACHINE | sudo -S bash $ABSOLUTE_SCRIPT_DIR/crontab/set-crontab.sh"