export tools_cache_redis_master_ID=`docker container ls  | grep 'tools_cache-redis-socket' | awk '{print $1}'`;
echo "tools_cache_redis_socket_ID="$tools_cache_redis_socket_ID;
sudo docker exec -it $tools_cache_redis_socket_ID redis-cli

