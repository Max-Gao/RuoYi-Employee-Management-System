若依员工管理系统 (单体版)

简介
本项目为 RuoYi 单体版后端 + 前端分离结构，后端基于 Spring Boot，前端位于 `ruoyi-ui`。

技术栈
- 后端：Spring Boot 2.2.13、Spring Security、MyBatis-Plus、Druid、Redis、JWT
- 前端：Vue + Element UI（位于 `ruoyi-ui`）
- 数据库：MySQL

目录结构
- `src/`：后端源码（Spring Boot）
- `sql/`：初始化脚本
- `ruoyi-ui/`：前端项目
- `doc/`：文档与说明
- `target/`：构建产物（编译后生成）

环境要求
- JDK 8
- Maven 3.x
- MySQL 5.7+（或 8.x）
- Redis 5.x
- Node.js 14+（前端）

注意：如果出现 Lombok IllegalAccessError，说明当前 JDK 为 9+，请切换到 JDK 8。

数据库初始化
1) 创建数据库（默认配置为 `his`）。
2) 依次导入 `sql/` 目录脚本：
   - `ry_base_tables.sql`
   - `sys_permission_data.sql`
   - `sys_log_permission.sql`
   - `sys_log_permission_data.sql`
   - `fix_oper_log.sql`
   - `test.sql`（可选，测试数据）

配置说明
- 后端主配置：`src/main/resources/application.yml`
- 数据源配置：`src/main/resources/application-druid.yml`
- Redis 默认：`localhost:6379`（密码 `123456`）
- 后端默认端口：`8080`

本地启动
后端：
1) 修改数据库与 Redis 配置（见 `application-druid.yml` / `application.yml`）。
2) 在项目根目录执行：
   - `mvn -DskipTests clean package`
   - `java -jar target/ruoyi.jar`
   或：
   - `mvn spring-boot:run`

前端：
1) 进入 `ruoyi-ui`：
   - `npm install`
   - `npm run dev`

接口与页面
- 后端服务：`http://localhost:8080`
- 前端开发服务：`http://localhost:8081`（以 `ruoyi-ui` 中配置为准）

常见问题
- 编译报 Lombok 模块访问异常：切换到 JDK 8 后重新编译。
