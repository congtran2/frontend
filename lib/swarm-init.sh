#!/bin/bash
function init_swarm_dmz() {
    PASS_MACHINE=$1
    printf "${LCYAN}START init_swarm_dmz${RESTORE}\n"

    fn_init_leader;
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS fn_init_leader.${RESTORE}\n";

    fn_init_managers_dmz;
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS fn_init_managers_dmz.${RESTORE}\n";

    fn_init_workers_dmz;
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS fn_init_workers.${RESTORE}\n";

}
function init_swarm_mid() {
    PASS_MACHINE=$1
    printf "${LCYAN}START init_swarm_mid${RESTORE}\n"

    fn_init_leader;
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS fn_init_leader.${RESTORE}\n";

    fn_init_workers_mid;
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS fn_init_workers.${RESTORE}\n";

}

function fn_init_leader() {
  local isInSwarm=$(isSwarmNode)
  if $isInSwarm ; then docker swarm leave --force ; fi
  docker swarm init
  JOIN_TOKEN_MANAGER=$(docker swarm join-token manager)
  JOIN_TOKEN_WORKER=$(docker swarm join-token worker)
  JOIN_TOKEN_MANAGER=$(echo $JOIN_TOKEN_MANAGER| sed 's/.*docker swarm join --token //')
  JOIN_TOKEN_WORKER=$(echo $JOIN_TOKEN_WORKER| sed 's/.*docker swarm join --token //')
}

function fn_init_managers_dmz() {
  local NUM_MANAGERS="$DMZ_NUM_MANAGERS";
  LIST_MANAGER="$DMZ_HOST_MANAGERS_1";
  if (($NUM_MANAGERS > 1)); then
    for ((i=2; i<=$NUM_MANAGERS; i++)); do
      local HOST_MANAGER="DMZ_HOST_MANAGERS_$i";
      LIST_MANAGER=$LIST_MANAGER${!HOST_MANAGER}
      _join_manager_machine ${!HOST_MANAGER} $PASS_MACHINE
    done
  fi
}
function _join_manager_machine() {
      local HOST="$1";
      local PASS="$2"
      printf "${LCYAN}START fn_init_managers_dmz${RESTORE}\n"
      fn_ssh_and_exec_script $HOST $PASS << EOF
      if [ "$(docker info | grep Swarm | sed 's/Swarm: //g')" == "inactive" ]; then
          echo false;
      else
          docker swarm leave --force
          echo true;
      fi
      docker swarm join --token $JOIN_TOKEN_MANAGER > /dev/null;
EOF
      printf "${SPACE}${LGREEN}${S_CHECK} SUCCESS _join_manager_machine.Machine \"$HOST\" successfully joined the swarm as manager.${RESTORE}\n";
}

function fn_init_workers_dmz() {
  local NUM_MACHINE="$DMZ_NUMBER";
  for i in $(seq 1 $NUM_MACHINE); do
    local HOST_MACHINE="DMZ_IP_$i";
    if [[ "$LIST_MANAGER" != *"${!HOST_MACHINE}"* ]]; then
      _join_worker_machine "${!HOST_MACHINE}" "$PASS_MACHINE"
    fi
  done
  local NUM_MACHINE="$DMZ_NUM_WORKERS";
  for i in $(seq 1 $NUM_MACHINE); do
    local HOST_WORKER="DMZ_HOST_WORKER_$i";
    local HOSTNAME=$(fn_ssh_and_exec_command "${!HOST_WORKER}" "$PASS_MACHINE" "cat /etc/hostname")
    docker node update --label-add frtend=true $HOSTNAME
    fn_ssh_and_exec_command "${!HOST_WORKER}" "$PASS_MACHINE" "bash $WORK_DIR/lib/mkdir_dmz_worker_folders.sh"
  done
  local NUM_MACHINE="$DMZ_NUM_DTBS";
  for i in $(seq 1 $NUM_MACHINE); do
    local HOST_DTB="DMZ_HOST_DTB_$i";
    local HOSTNAME=$(fn_ssh_and_exec_command "${!HOST_DTB}" "$PASS_MACHINE" "cat /etc/hostname")
    docker node update --label-add dtb=true $HOSTNAME
    fn_ssh_and_exec_command "${!HOST_DTB}" "$PASS_MACHINE" "bash $WORK_DIR/lib/mkdir_dmz_dtb_folders.sh"

  done
}
function fn_init_workers_mid() {
  local NUM_MACHINE="$MID_NUMBER";
  if (($NUM_MACHINE > 1)); then
    for ((i=2; i<=$NUM_MACHINE; i++)); do
      local HOST_WORKER="MID_IP_$i";
      _join_worker_machine "${!HOST_WORKER}" "$PASS_MACHINE"
    done
  fi
}
function _join_worker_machine() {
  local HOST="$1";
  local PASS="$2"
  printf "${LCYAN}START _join_worker_machine${RESTORE}\n"
  fn_ssh_and_exec_script $HOST $PASS << EOF
      if [ "$(docker info | grep Swarm | sed 's/Swarm: //g')" == "inactive" ]; then
          echo false;
      else
          docker swarm leave --force
          echo true;
      fi
      docker swarm join --token $JOIN_TOKEN_WORKER > /dev/null;
EOF
  printf "${SPACE}${LGREEN}${S_CHECK} SUCCESS _join_worker_machine.Machine \"$HOST\" successfully joined the swarm as worker.${RESTORE}\n";
}