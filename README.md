# Luckysheet Server

Spring server to run as luckysheet server

## Requirement

- Redis
- PostgresQL
  - Base schema is defined in trena main api server as a form of prisma
  - It is recommended to use this server after applying the schema defined by prisma

## Deployment

1. Build Luckysheet

```bash
mvn clean compile
mvn package
```

2. Build docker image

```bash
docker build -t luckysheet-server:${TAG} .
```

3. Tag and push to artifactory

```bash
docker tag luckysheet-server:${TAG} \
  art.sec.samsung.net/rs8-sr-nmt_docker/luckysheet-server:${TAG}
docker push art.sec.samsung.net/rs8-sr-nmt_docker/luckysheet-server:${TAG}
```

## Environment

- `REDIS_HOST`
    - Host of REDIS Server
    - Default: `127.0.0.1`
- `REDIS_PORT`
    - Port number of REDIS Server
    - Default: `6379`
- `POSTGRESQL_HOST`
    - Host of PostgresQL Server
    - Default: `127.0.0.1`
- `POSTGRESQL_PORT`
    - Port number of PostgresQL Server
    - Default: `5432`
- `POSTGRESQL_DB`
    - DB Name of PostgresQL Server to use
- `POSTGRESQL_USERNAME`
  - Username of PostgresQL Server
- `POSTGRESQL_PASSWORD`
  - Password of PostgresQL Server
