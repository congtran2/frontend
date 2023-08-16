SCRIPT_DIR=`dirname "$BASH_SOURCE"`
export tools_postgresql_ID=`docker container ls  | grep 'tools_postgresql' | awk '{print $1}'`;
if [ -z "$tools_postgresql_ID" ] ; then 
    echo "" ;
    else
        export tools_postgresql_ID=`docker container ls  | grep 'tools_postgresql' | awk '{print $1}'`;
        echo "++++++++++++>$tools_postgresql_ID"
        docker exec $tools_postgresql_ID bash -c 'export PGPASSWORD='postgres'; psql -U postgres -c "CREATE DATABASE sso OWNER "postgres";"'
        docker exec $tools_postgresql_ID bash -c 'export PGPASSWORD='postgres'; psql -U postgres -c "CREATE DATABASE userdata OWNER "postgres";"'
        docker exec $tools_postgresql_ID bash -c 'export PGPASSWORD='postgres'; psql -U postgres -c "CREATE DATABASE notification OWNER "postgres";"'
        docker exec $tools_postgresql_ID bash -c 'export PGPASSWORD='postgres'; psql -U postgres -c "CREATE DATABASE jdatafeed OWNER "postgres";"'
        cat $SCRIPT_DIR/sso.sql | docker exec -i $tools_postgresql_ID psql "postgresql://postgres:postgres@localhost:5432/sso"
        cat $SCRIPT_DIR/userdata.sql | docker exec -i $tools_postgresql_ID psql "postgresql://postgres:postgres@localhost:5432/userdata"
        cat $SCRIPT_DIR/notification.sql | docker exec -i $tools_postgresql_ID psql "postgresql://postgres:postgres@localhost:5432/notification"
        cat $SCRIPT_DIR/jdatafeed.sql | docker exec -i $tools_postgresql_ID psql "postgresql://postgres:postgres@localhost:5432/jdatafeed"
        cat $SCRIPT_DIR/userdata_industry.sql | docker exec -i $tools_postgresql_ID psql "postgresql://postgres:postgres@localhost:5432/userdata"
        echo "Create data postgres success!!" ;
fi