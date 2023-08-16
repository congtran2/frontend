
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
cat $SCRIPT_DIR/../deployment.env > deployment_temp.env
source deployment_temp.env
mkdir -p $DATA_DIR/ftpserver
docker-compose --env-file deployment_temp.env -f $SCRIPT_DIR/ftpserver.yml config > ftpserver-temp.yml
docker-compose -f ftpserver-temp.yml pull
docker-compose -f ftpserver-temp.yml down
wait
sleep 10
docker-compose -f ftpserver-temp.yml up -d
rm -rf ftpserver-temp.yml
rm -rf deployment_temp.env
#kiem tra trang thai cac service trong stack
