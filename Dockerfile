FROM eclipse-temurin:8-jre

# 安装nginx
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

# 创建工作目录
WORKDIR /app

# 复制后端jar
COPY target/ruoyi.jar /app/app.jar

# 复制前端构建文件
COPY ruoyi-ui/dist /usr/share/nginx/html

# 复制nginx配置
COPY nginx.conf /etc/nginx/nginx.conf

# 创建启动脚本
RUN echo '#!/bin/bash\n\
java -jar -Xms512m -Xmx1024m /app/app.jar &\n\
nginx -g "daemon off;"\n' > /start.sh && chmod +x /start.sh

EXPOSE 80

CMD ["/start.sh"]
