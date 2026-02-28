$ErrorActionPreference = "Stop"

docker compose up -d mysql redis
docker compose ps mysql redis
