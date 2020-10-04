# postgres-docker

Create a new image for the conference application

```
docker image build -t postgres:conference-app .
```

Run the docker-compose to start the database

```
docker-compose -f docker-compose.yml up -d
```

Create tables using following statements

```
docker cp create_tables.sql postgres_postgres_1:/create_tables.sql
docker exec -it postgres_postgres_1 psql -d conference_app -f create_tables.sql -U postgres
```

Insert data using following scripts

```
docker cp insert_data.sql postgres_postgres_1:/insert_data.sql
docker exec -it postgres_postgres_1 psql -d conference_app -f insert_data.sql -U postgres
```
