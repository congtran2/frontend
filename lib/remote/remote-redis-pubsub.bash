export tools_cache_redis_master_ID=`docker container ls  | grep 'tools_cache-redis-pubsub' | awk '{print $1}'`;
echo "tools_cache_redis_pubsub_ID="$tools_cache_redis_pubsub_ID;
sudo docker exec -it $tools_cache_redis_pubsub_ID redis-cli


