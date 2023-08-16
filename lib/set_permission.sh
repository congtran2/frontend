SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/../deployment.env
chown 1001:1001 $WORK_DIR/openapi/config/postgresql/postgresql.conf