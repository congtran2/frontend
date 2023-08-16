# ----------------------------------
# Arguments:
# ~
# $1 - Host cua may worker. Vd: user@192.168.2.88
# $2 - Pass cua may docker
# ----------------------------------
function fn_prepare_docker_machine_single() {
    local HOST=$1
    local PASS=$2
    printf "${LCYAN}START fn_prepare_docker_machine_single $HOST ${RESTORE}\n"
    fn_ssh_and_exec_command $HOST $PASS "echo $PASS|sudo -S chown -R \$USER /app/"
    fn_ssh_and_exec_command $HOST $PASS "rm -rf $WORK_DIR"
    fn_ssh_and_exec_command $HOST $PASS "git clone -b $BRANCH_NAME $REMOTE_URL $WORK_DIR"
    fn_ssh_and_exec_command $HOST $PASS "echo $PASS | sudo -S bash $WORK_DIR/lib/set_permission.sh"
    fn_ssh_and_exec_command $HOST $PASS "echo $PASS | sudo -S bash $WORK_DIR/lib/install_tools.sh"
    fn_ssh_and_exec_command $HOST $PASS "echo $PASS | sudo -S bash $WORK_DIR/lib/install_docker.sh \$USER"
    fn_ssh_and_exec_command $HOST $PASS "echo $PASS | sudo -S bash $WORK_DIR/lib/increase_ulimit.sh"
    printf "${SPACE}${LGREEN}${S_CHECK}SUCCESS fn_prepare_docker_machine_single $HOST.${RESTORE}\n";
}

function fn_prepare_dmz_machine_remote() {
  local PASS_MACHINE=$1
  local DMZ_NUMBER="$DMZ_NUMBER";
  if (($DMZ_NUMBER > 1)); then
    for ((i=2; i<=$DMZ_NUMBER; i++)); do
      local HOST_MANAGER="DMZ_IP_$i";
      fn_prepare_docker_machine_single "${!HOST_MANAGER}" "$PASS_MACHINE"
    done
  fi
}
function fn_exec_command_on_dmz_machine_remote() {
  local PASS_MACHINE=$1
  local COMMAND=$2
  local DMZ_NUMBER="$DMZ_NUMBER";
  if (($DMZ_NUMBER > 1)); then
    for ((i=2; i<=$DMZ_NUMBER; i++)); do
      local HOST_MACHINE="DMZ_IP_$i";
      fn_ssh_and_exec_command "${!HOST_MACHINE}" "$PASS_MACHINE" "$COMMAND"
    done
  fi
}
function fn_prepare_mid_machine_remote() {
  local PASS_MACHINE=$1
  local NUM_MACHINE="$MID_NUMBER";
  if (($NUM_MACHINE > 1)); then
    for ((i=2; i<=$NUM_MACHINE; i++)); do
      local HOST_MACHINE="MID_IP_$i";
      fn_prepare_docker_machine_single "${!HOST_MACHINE}" "$PASS_MACHINE"
      fn_ssh_and_exec_command "${!HOST_MACHINE}" "$PASS_MACHINE" "bash $WORK_DIR/lib/mkdir_mid_folders.sh"
      fn_ssh_and_exec_command "${!HOST_MACHINE}" "$PASS_MACHINE" "bash $WORK_DIR/bussystem/prepare.sh"
    done
  fi
}
function fn_exec_command_on_mid_machine_remote() {
  local PASS_MACHINE=$1
  local COMMAND=$2
  local NUM_MACHINE="$MID_NUMBER";
  if (($NUM_MACHINE > 1)); then
    for ((i=2; i<=$NUM_MACHINE; i++)); do
      local HOST_MACHINE="MID_IP_$i";
      fn_ssh_and_exec_command "${!HOST_MACHINE}" "$PASS_MACHINE" "$COMMAND"
    done
  fi
}
function fn_dmz_git_update() {
  local PASS_MACHINE=$1
  local NUM_WORKERS="$DMZ_NUM_WORKERS";
  local NUM_MANAGERS="$DMZ_NUM_MANAGERS";
  local NUM_DTBS="$DMZ_NUM_DTBS";
  if (($NUM_MANAGERS > 1)); then
    for ((i=2; i<=$NUM_MANAGERS; i++)); do
        local HOST_MANAGER="DMZ_HOST_MANAGERS_$i";
        printf "\n$HOST_MANAGER: Update config git. "
        fn_ssh_and_exec_command "${!HOST_MANAGER}" "$PASS_MACHINE" "bash $WORK_DIR/lib/git_update.sh"
    done
  fi
  for i in $(seq 1 $NUM_WORKERS); do
    local HOST_WORKER="DMZ_HOST_WORKER_$i";
    printf "\n$HOST_WORKER: Update config git. "
    fn_ssh_and_exec_command "${!HOST_WORKER}" "$PASS_MACHINE" "bash $WORK_DIR/lib/git_update.sh"
  done
  for i in $(seq 1 $NUM_DTBS); do
    local HOST_DTB="DMZ_HOST_DTB_$i";
    printf "\n$HOST_DTB: Update config git. "
    fn_ssh_and_exec_command "${!HOST_DTB}" "$PASS_MACHINE" "bash $WORK_DIR/lib/git_update.sh"
  done
}
function fn_mid_git_update() {
  local PASS_MACHINE=$1
  local NUM_MACHINE="$MID_NUMBER";
  if (($NUM_MACHINE > 1)); then
    for ((i=2; i<=$NUM_MACHINE; i++)); do
        local HOST_MANAGER="MID_IP_$i";
        printf "\n$HOST_MANAGER: Update config git. "
        fn_ssh_and_exec_command "${!HOST_MANAGER}" "$PASS_MACHINE" "bash $WORK_DIR/lib/git_update.sh"
    done
  fi
}
function fn_dmz_dtb_run_script_postgres() {
    local PASS_MACHINE=$1
    local NUM_DTBS="$DMZ_NUM_DTBS";
    for i in $(seq 1 $NUM_DTBS); do
    local HOST_DTB="DMZ_HOST_DTB_$i";
    fn_ssh_and_exec_command "${!HOST_DTB}" "$PASS_MACHINE" "bash $WORK_DIR/pg-script/create_data_postgres.sh"
  done
}