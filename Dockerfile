FROM postgres:12-alpine
COPY *.sh /docker-entrypoint-initdb.d/
COPY create_tables.sql .
COPY insert_data.sql .
