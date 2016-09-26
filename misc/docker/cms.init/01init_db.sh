#!/bin/bash

export PGPASSWORD=$POSTGRES_PASSWORD

for x in $(seq 15 1); do
    echo $x
    sleep 1
done

if ( echo '\l' | psql -h 127.0.0.1 -U postgres | awk ' { print $1 } ' ) | grep $DB_SCHEMA; then
    echo "DB Already exists. Skipping DB import."
    exit 0
fi

echo "CREATE DATABASE $DB_SCHEMA" | psql -h db -U postgres
echo "CREATE USER $DB_USERNAME WITH PASSWORD '$DB_PASSWORD'" | psql -h db -U postgres
echo "GRANT ALL PRIVILEGES ON DATABASE $DB_SCHEMA TO $DB_USERNAME" | psql -h db -U postgres
 
cat /cms.init/init.sql | sed -e "s/\\\$USERNAME\\\$/$DB_USERNAME/gm" | psql -h db -U postgres $DB_SCHEMA  

