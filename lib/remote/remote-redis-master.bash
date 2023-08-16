export tools_cache_redis_master_ID=`docker container ls  | grep 'tools_cache-redis-master' | awk '{print $1}'`;
echo "tools_cache_redis_master_ID="$tools_cache_redis_master_ID;
sudo docker exec -it $tools_cache_redis_master_ID redis-cli

