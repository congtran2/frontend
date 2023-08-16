#!/bin/bash
function deploy_mid_stack() {
    local ENV_FILE_PATH=$1
    printf "${LCYAN}START deploy_mid_stack${RESTORE}\n" 
    docker stack rm femid
    wait
    create_docker_network "mid-network"
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/openapi/swarm.mid.yml config > ${WORK_DIR}/swarm.mid-temp.yml
    docker-compose -f ${WORK_DIR}/swarm.mid-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/swarm.mid-temp.yml femid --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/swarm.mid-temp.yml
    check_stack_up femid 1
    # printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS deploy_mid_stack.${RESTORE}\n";
}
function deploy_dmz_tools_stack() {
    local ENV_FILE_PATH=$1
    printf "${LCYAN}START deploy_dmz_tools_stack${RESTORE}\n" 
    docker stack rm tools
    wait
    local isNetworkExist=$(check_docker_network_exist "nw_dmz")
    if [ "$isNetworkExist" = "false" ] ; then create_docker_network "nw_dmz"; fi
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/openapi/swarm.tools.yml config > ${WORK_DIR}/swarm.tools-temp.yml
    docker-compose -f ${WORK_DIR}/swarm.tools-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/swarm.tools-temp.yml tools --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/swarm.tools-temp.yml
    check_stack_up tools 1
    # printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS deploy_dmz_tools_stack.${RESTORE}\n";

}
function deploy_dmz_service_stack() {
    local ENV_FILE_PATH=$1
    printf "${LCYAN}START deploy_dmz_service_stack${RESTORE}\n" 
    docker stack rm fedmz
    wait
    local isNetworkExist=$(check_docker_network_exist "nw_dmz")
    if [ "$isNetworkExist" = "false" ] ; then create_docker_network "nw_dmz"; fi
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/openapi/swarm.dmz.yml config > ${WORK_DIR}/swarm.dmz-temp.yml
    docker-compose -f ${WORK_DIR}/swarm.dmz-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/swarm.dmz-temp.yml fedmz --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/swarm.dmz-temp.yml
    check_stack_up fedmz 1
    # printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS deploy_dmz_service_stack.${RESTORE}\n";

}
function deploy_dmz_fs2pro_stack() {
    local ENV_FILE_PATH=$1
    printf "${LCYAN}START deploy_dmz_fs2pro_stack${RESTORE}\n" 
    docker stack rm feweb
    wait
    local isNetworkExist=$(check_docker_network_exist "nw_dmz")
    if [ "$isNetworkExist" = "false" ] ; then create_docker_network "nw_dmz"; fi
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/openapi/swarm.fs2.yml config > ${WORK_DIR}/swarm.fs2-temp.yml
    docker-compose -f ${WORK_DIR}/swarm.fs2-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/swarm.fs2-temp.yml feweb --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/swarm.fs2-temp.yml
    check_stack_up feweb 1
    # printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS deploy_dmz_service_stack.${RESTORE}\n";

}
function deploy_admin_service_stack() {
    local ENV_FILE_PATH=$1
    printf "${LCYAN}START deploy_dmz_service_stack${RESTORE}\n" 
    docker stack rm admtools
    wait
    local isNetworkExist=$(check_docker_network_exist "nw_dmz")
    if [ "$isNetworkExist" = "false" ] ; then create_docker_network "nw_dmz"; fi
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/openapi/swarm.admtools.yml config > ${WORK_DIR}/swarm.admtools-temp.yml
    docker-compose -f ${WORK_DIR}/swarm.admtools-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/swarm.admtools-temp.yml admtools --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/swarm.admtools-temp.yml
    check_stack_up admtools 1
    # printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS deploy_dmz_service_stack.${RESTORE}\n";
}
function check_docker_network_exist() {
    local NETWORK_NAME=$1    
    #kiem tra trang thai network
    count=`docker network ls | grep " $NETWORK_NAME " | wc -l`
    if [[ $count -eq 0 ]]; then
        echo false
    else 
        echo true
    fi
}
function create_docker_network() {
    local NETWORK_NAME=$1    
    printf "${LCYAN}START create_docker_network $NETWORK_NAME ${RESTORE}\n"
    local isNetworkExist=$(check_docker_network_exist "$NETWORK_NAME")
    if [ "$isNetworkExist" = "true" ] ; then docker network rm $NETWORK_NAME; fi
    #kiem tra trang thai network da xoa duoc chua
    while true
    do
            count=`docker network ls | grep " $NETWORK_NAME " | wc -l`
            echo "Xoa docker network $NETWORK_NAME. Waiting...."
            if [[ $count -eq 0 ]]; then
                    echo "Xoa docker network $NETWORK_NAME. Success"
                    break;
            fi
            sleep 2
    done
    docker network create $NETWORK_NAME -d overlay --attachable
    #kiem tra trang thai network da tao duoc chua
    while true
    do
            count=`docker network ls | grep " $NETWORK_NAME " | wc -l`
            echo "Dang khoi tao docker network $NETWORK_NAME. Waiting...."
            if [[ $count -eq 0 ]]; then
                    sleep 2
                else 
                    echo "Khoi tao docker network $NETWORK_NAME. Success"
                    break;
            fi
            
    done
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS create_docker_network $NETWORK_NAME.${RESTORE}\n";
}
