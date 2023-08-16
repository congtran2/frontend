#!/usr/bin/env bash

# Error trap definition
set -o errtrace
trap 'err_exit $? $LINENO $BASH_LINENO "$BASH_COMMAND" $(printf "::%s" ${FUNCNAME[@]})' ERR

# Load the required scripts
SCRIPT_DIR_INCLUDE=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR_INCLUDE/lib/error-trap.sh
source $SCRIPT_DIR_INCLUDE/lib/constants.sh
source $SCRIPT_DIR_INCLUDE/portainer/portainer-utils.sh
source $SCRIPT_DIR_INCLUDE/lib/mkdir-log.sh
source $SCRIPT_DIR_INCLUDE/lib/utils.sh
source $SCRIPT_DIR_INCLUDE/lib/stack-deploy.sh
source $SCRIPT_DIR_INCLUDE/lib/prepare.sh
source $SCRIPT_DIR_INCLUDE/lib/swarm-init.sh