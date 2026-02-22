#!/bin/bash

echo "===== 若依项目 Docker 部署脚本 ====="

# 构建前端
echo "1. 构建前端..."
cd ruoyi-ui
npm install --registry=https://registry.npm.taobao.org
npm run build:prod
cd ..

# 构建并启动所有服务
echo "2. 构建并启动 Docker 容器..."
docker-compose up -d --build

echo "===== 部署完成 ====="
echo "服务地址:"
echo "  - 前端: http://你的服务器IP"
echo "  - 后端: http://你的服务器IP:8080"
echo ""
echo "常用命令:"
echo "  查看日志: docker-compose logs -f"
echo "  停止服务: docker-compose down"
echo "  重启服务: docker-compose restart"
