SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/../deployment.env
LOGDIR=$(echo $LOG_DIR | sed "s/[/]/\\\\\//g")
sed "s/#LOG_DIR#/$LOGDIR/" $SCRIPT_DIR/delete-log-files > delete-log-files-temp
sed "s/#MAX_LOGS_DAY#/$MAX_LOGS_DAY/" delete-log-files-temp > delete-log-files-temp-2
rm -rf /etc/cron.d/delete-log-files
cp -r delete-log-files-temp-2 /etc/cron.d/delete-log-files
cat /etc/cron.d/delete-log-files
rm -rf delete-log-files-temp delete-log-files-temp-2