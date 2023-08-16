#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

ABSOLUTE_SCRIPT_DIR=$(SELF=$(dirname "$0") && bash -c "cd \"$SELF\" && pwd")
sudo bash $SCRIPT_DIR/crontab/set-crontab.sh
PASS_MID_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY MID MACHINE")
fn_exec_command_on_mid_machine_remote "$PASS_MID_MACHINE" "echo $PASS_MID_MACHINE | sudo -S bash $ABSOLUTE_SCRIPT_DIR/crontab/set-crontab.sh"