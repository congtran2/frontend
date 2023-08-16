#!/bin/bash
CURRENT_USER=$1
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/../_includes.sh
source $SCRIPT_DIR/../deployment.env

DOCKER_INSTALLED=$(check_service_installed docker)
echo "check_service_installed docker: $DOCKER_INSTALLED"
if [ "$DOCKER_INSTALLED" = "false" ]; then
    yum install yum-utils
    yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
    yum install docker-ce-19.03.9 docker-ce-cli-19.03.9 containerd.io -y
    subscription-manager repos --enable=rhel-7-server-extras-rpms
    yum install container-selinux  -y
    yum -y install docker-ce docker-ce-cli containerd.io  
    docker --version
    systemctl start docker
    # cd /etc/docker
    # sudo vi daemon.json
    cat << EOF >> /etc/docker/daemon.json
{
    "storage-driver": "overlay2",
    "log-driver":"json-file",
    "graph": "/app/docker",
    "log-opts": {
        "max-size": "100m",
        "max-file": "3"
    },
    "insecure-registries" : ["$REGISTRY:5000"]
}
EOF
    systemctl restart docker
    wait
    docker login -u "readonly" -p "readonly" $REGISTRY:5000
fi

DOCKER_COMPOSE_INSTALLED=$(check_service_installed docker-compose)
echo "check_service_installed docker-compose: $DOCKER_COMPOSE_INSTALLED"
if [ "$DOCKER_COMPOSE_INSTALLED" = "false" ]; then
    curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    chmod +x /usr/local/bin/docker-compose
fi

IS_ADD_DOCKER_HOSTNAME=$(check_file_contain_somestring "$REGISTRY" "/etc/hosts")
if [ "$IS_ADD_DOCKER_HOSTNAME" = "false" ]; then
    echo "$REGISTRY_IP $REGISTRY" >> /etc/hosts
fi

