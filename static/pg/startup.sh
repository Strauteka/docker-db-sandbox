#!/bin/bash
set -e
echo "DB Init $DATABASE_USER"
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE ROLE $DATABASE_USER LOGIN SUPERUSER ENCRYPTED PASSWORD '$DATABASE_PASSWORD';
    CREATE DATABASE $DATABASE_NAME WITH OWNER $DATABASE_USER;
    CREATE SCHEMA $DATABASE_SCHEMA;
EOSQL

psql -v ON_ERROR_STOP=0 --username "$POSTGRES_USER" --dbname "$DATABASE_NAME" < "$DATABASE_INIT_SCRIPT"
