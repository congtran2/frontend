SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/../deployment.env
cd $WORK_DIR
git pull
