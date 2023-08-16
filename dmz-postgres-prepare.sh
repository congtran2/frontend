#!/bin/bash
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/_includes.sh
source $SCRIPT_DIR/deployment.env

if [ -z "$PASS_MACHINE" ] ; then
    PASS_MACHINE=$(fn_get_input_command_line "NHAP PASSWORD CUA CAC MAY DMZ MACHINE")
else
    PASS_MACHINE=$PASS_MACHINE
fi

fn_dmz_dtb_run_script_postgres "$PASS_MACHINE"
