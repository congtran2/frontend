SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/../deployment.env

mkdir -p $DATA_DIR/bussystem
mkdir -p $DATA_DIR/activemq
mkdir -p $DATA_DIR/reports
mkdir -p $LOG_DIR/bussystem