
SCRIPT_DIR=`dirname "$BASH_SOURCE"`
source $SCRIPT_DIR/../deployment.env

#start cac service vung dmz
docker stack rm bussystem
wait
docker network rm nw_bussystem
#kiem tra trang thai dmz network da xoa duoc chua
while true
do
        count=`docker network ls | grep "nw_bussystem" | wc -l`
        echo "nw_bussystem is being removed $count"
        if [[ $count -eq 0 ]]; then
                echo "nw_bussystem removed"
                break;
        fi
        sleep 2
done
docker network create nw_bussystem -d overlay --attachable
docker-compose --env-file "$SCRIPT_DIR/../deployment.env" -f ${WORK_DIR}/bussystem/bussystem.yml config > ${WORK_DIR}/bussystem/bussystem-temp.yml
docker-compose -f ${WORK_DIR}/bussystem/bussystem-temp.yml pull
docker stack deploy -c ${WORK_DIR}/bussystem/bussystem-temp.yml bussystem --with-registry-auth --resolve-image always
rm -rf ${WORK_DIR}/bussystem/bussystem-temp.yml
#kiem tra trang thai cac service trong stack
