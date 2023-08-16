export tools_cache_redis_master_ID=`docker container ls  | grep 'tools_cache-redis-market' | awk '{print $1}'`;
echo "tools_cache_redis_market_ID="$tools_cache_redis_market_ID;
sudo docker exec -it $tools_cache_redis_market_ID redis-cli

