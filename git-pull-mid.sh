#!/bin/bash
git pull
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

if [ -z "$PASS_MACHINE" ] ; then
    PASS_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY MID MACHINE")
else
    PASS_MACHINE=$PASS_MACHINE
fi

fn_mid_git_update "$PASS_MACHINE"
