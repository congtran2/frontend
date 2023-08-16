function mkdir_folder_for_mid() {
    mkdir -p ${LOG_DIR}
    cd ${LOG_DIR}
    mkdir -p mid-haproxy
    mkdir -p external bpsbase bpsreport bpsreportbroker bpsupload bpsfds
}
function mkdir_folder_for_dmz() {
    mkdir -p ${LOG_DIR}
    cd ${LOG_DIR}
    mkdir -p dmz-haproxy
    mkdir -p datafeed datafeedexport datafeedquery df.persistent  external  inquiry  notification  persistent  report  socket socketmarket  sso transaction haproxy tradeapi smartca webadmin
}
function mkdir_folder_for_dtb() {
    mkdir -p ${DATA_DIR}
    cd ${DATA_DIR}
    mkdir -p postgres rabbitmq/data redis/data rabbitmq-seed/data
    echo "$PASS_MACHINE"|sudo -S chown 1001:1001 postgres
    mkdir -p ${LOG_DIR}
    cd ${LOG_DIR}
    mkdir -p rabbitmq rabbitmq-seed redis-master redis-slave redis-pubsub redis-socket redis-market dmz-out-haproxy postgres
    echo "$PASS_MACHINE"|sudo -S chown 1001:1001 postgres
}
