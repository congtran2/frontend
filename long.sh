cat << EOF >> /etc/docker/daemon.json
{
    "storage-driver": "overlay2",
    "log-driver":"json-file",
    "graph": "/app/docker",
    "log-opts": {
        "max-size": "100m",
        "max-file": "3",
    },
    "insecure-registries" : ["$REGISTRY:5000"]
}
EOF
