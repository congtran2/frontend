#!/bin/bash
function deploy_portainer_agent() {
    local ENV_FILE_PATH=$1
    docker stack rm portainer-agent
    wait
    create_docker_network portainer_agent
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/portainer/portainer-agent.yml config > ${WORK_DIR}/portainer-agent-temp.yml
    docker-compose -f ${WORK_DIR}/portainer-agent-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/portainer-agent-temp.yml portainer-agent --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/portainer-agent-temp.yml
    check_stack_up portainer-agent 1
}

function deploy_portainer_adm() {
    local ENV_FILE_PATH=$1
    mkdir -p ${DATA_DIR}/portainer/data
    docker stack rm portainer-adm
    wait
    create_docker_network portainer_adm
    docker-compose --env-file ${ENV_FILE_PATH} -f ${WORK_DIR}/portainer/portainer-adm.yml config > ${WORK_DIR}/portainer-adm-temp.yml
    docker-compose -f ${WORK_DIR}/portainer-adm-temp.yml pull
    docker stack deploy -c ${WORK_DIR}/portainer-adm-temp.yml portainer-adm --with-registry-auth --resolve-image always
    rm -rf ${WORK_DIR}/portainer-adm-temp.yml
    check_stack_up portainer-adm 1
}