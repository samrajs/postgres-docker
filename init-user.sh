#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER appuser WITH PASSWORD 'App@SamGmbH1!';
    CREATE DATABASE conference_app;
    GRANT ALL PRIVILEGES ON DATABASE conference_app TO appuser;
EOSQL

psql -v ON_ERROR_STOP=1 --username appuser --dbname conference_app -f /create_tables.sql
psql -v ON_ERROR_STOP=1 --username appuser --dbname conference_app -f /insert_data.sql