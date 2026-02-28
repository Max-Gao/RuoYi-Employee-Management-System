$ErrorActionPreference = "Stop"

docker compose stop mysql redis
docker compose ps mysql redis
