SCRIPT_DIR=`dirname "$BASH_SOURCE"`
export tools_postgresql_ID=`docker container ls  | grep 'tools_postgresql' | awk '{print $1}'`;
if [ -z "$tools_postgresql_ID" ] ; then 
    echo "" ;
    else
        export tools_postgresql_ID=`docker container ls  | grep 'tools_postgresql' | awk '{print $1}'`;
        echo "++++++++++++>$tools_postgresql_ID"
        docker exec $tools_postgresql_ID bash -c 'export PGPASSWORD='postgres'; psql -U postgres -c "create extension pg_stat_statements;"'
fi