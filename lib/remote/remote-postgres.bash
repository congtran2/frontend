export tools_postgresql_ID=`docker container ls  | grep 'tools_postgresql' | awk '{print $1}'`;
echo "tools_postgresql_ID="$tools_postgresql_ID;
sudo docker exec -it $tools_postgresql_ID psql -U postgres

