#!/usr/bin/env bash
check_stack_up () {
    local STACK_NAME=$1
    local LOOP_CHECK=$2
    starting=1
    docker stack services $STACK_NAME
    for line in $(docker stack services $STACK_NAME | awk '{print $4}');
    do
            replicas="$line"
            if [[ "$replicas" != 'REPLICAS' ]]; then
            sttarr=(`echo $replicas | tr '/' ' '`)
            var0=`echo ${sttarr[0]} | sed 's/ *$//g'`
            var1=`echo ${sttarr[1]} | sed 's/ *$//g'`
            if [[ ${#sttarr[*]} != 2 || $var0 != $var1 ]]; then
                    starting=0
            fi
            fi
    done
    if [[ "$starting" == '0' ]]; then
        echo "Dang khoi tao swarm $STACK_NAME. Waiting..."
        sleep 10;
        if [ "$LOOP_CHECK" -le 10 ]
        then
                LOOP_CHECK=$((LOOP_CHECK+1))
                check_stack_up $STACK_NAME $LOOP_CHECK
        else
                echo "Khoi tao swarm $STACK_NAME khong thanh cong. Vui long kiem tra lai"
        fi
    else
        echo "Khoi tao swarm $STACK_NAME. Success"
    fi
}

# ----------------------------------
# Arguments:
# ~
# $1 - text hien thi khi yeu cau input
# ----------------------------------
function fn_get_input_command_line() {
  read -p "$(echo -e $BOLD$LYELLOW"$1: "$RESTORE)"  input
  echo $input
}
# ----------------------------------
# Arguments:
# ~
# $1 - Host cua may worker. Vd: user@192.168.2.88
# $2 - Pass cua may docker
# $3 - Command can thuc hien
# ----------------------------------
function fn_ssh_and_exec_command() {
    HOST=$1
    PASS=$2
    COMMAND=$3 
    sshpass -p $PASS ssh -o stricthostkeychecking=no $HOST $COMMAND
}
# ----------------------------------
# Arguments:
# ~
# $1 - Host cua may worker. Vd: user@192.168.2.88
# $2 - Pass cua may docker
# $3 - Script can thuc hien
# ----------------------------------
function fn_ssh_and_exec_script() {
    HOST=$1
    PASS=$2
    SCRIPT=$3 
    sshpass -p $PASS ssh -o stricthostkeychecking=no $HOST /bin/bash $SCRIPT
}

function isSwarmNode(){
    if [ "$(docker info | grep Swarm | sed 's/ Swarm: //g')" == "inactive" ]; then
        echo false;
    else
        echo true;
    fi
}
function check_service_installed() {
    if which $1; then echo true; else echo false; fi
}

function check_file_contain_somestring() {
    if ! grep -c -w $1 "$2"; then  #$1 string, $2 file path
        echo false
    else 
        echo true
    fi
}
