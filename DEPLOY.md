# 若依项目 Docker 部署指南

## 前置要求

- 阿里云服务器已安装 Docker
- 阿里云安全组已开放端口: 80, 3306, 6379, 8080

## 部署步骤

### 1. 上传项目到服务器

```bash
# 方式一: Git 克隆
git clone 你的仓库地址
cd 你的项目目录

# 方式二: 使用 FTP/SFTP 上传
```

### 2. 导入数据库

首次部署需要导入 SQL 文件：

```bash
# 进入 MySQL 容器
docker exec -it ruoyi-mysql mysql -uroot -proot123456

# 创建数据库
CREATE DATABASE IF NOT EXISTS ry-cloud DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

# 退出后导入 SQL
docker exec -i ruoyi-mysql mysql -uroot -proot123456 ry-cloud < sql/ry_base_tables.sql
```

### 3. 启动服务

```bash
# 构建并启动所有容器
docker-compose up -d --build

# 查看运行状态
docker-compose ps
```

### 4. 验证部署

- 前端访问: `http://服务器IP`
- 后端API: `http://服务器IP:8080`

## 常用命令

```bash
# 查看日志
docker-compose logs -f

# 停止服务
docker-compose down

# 重启服务
docker-compose restart

# 查看容器状态
docker ps

# 进入容器内部
docker exec -it ruoyi-mysql /bin/bash
docker exec -it ruoyi-redis /bin/bash
docker exec -it ruoyi-backend /bin/bash
```

## 配置说明

### 修改数据库密码

在 `docker-compose.yml` 中修改:
```yaml
MYSQL_ROOT_PASSWORD: 你的密码
```

同时修改后端配置 `application-druid.yml`

### 修改 Redis 密码

在 `docker-compose.yml` 中修改:
```yaml
command: redis-server --requirepass 你的密码
```

### 修改后端端口

在 `docker-compose.yml` 中修改:
```yaml
ports:
  - "8081:8080"  # 改为 8081
```

## 数据持久化

当前配置已将数据卷挂载到宿主机:
- MySQL 数据: `./mysql/data`
- Redis 数据: `./redis/data`

重启容器数据不会丢失。
