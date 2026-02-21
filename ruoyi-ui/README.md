# 若依员工管理系统

若依员工管理系统是一个基于 Spring Boot + Vue + Element UI 开发的通用后台管理系统。

## 项目简介

本系统采用前后端分离架构，前端基于 Vue 2.6 + Element UI 2.15 开发，提供完善的用户管理、角色权限、部门管理等企业级功能。

## 技术栈

### 前端技术
- **Vue 2.6** - 渐进式JavaScript框架
- **Vuex** - 状态管理
- **Vue Router** - 路由管理
- **Element UI** - UI组件库
- **Axios** - HTTP请求库
- **ECharts** - 数据可视化
- **Sass** - CSS预处理器

### 后端技术（配套）
- Spring Boot
- Spring Security
- MyBatis / MyBatis-Plus
- JWT
- Druid
- Redis

## 功能特性

- 用户管理：用户增删改查、角色分配
- 角色管理：角色权限配置
- 菜单管理：动态菜单、按钮权限
- 部门管理：组织架构管理
- 岗位管理
- 字典管理
- 参数配置
- 日志管理
- 定时任务
- 数据监控

## 环境要求

- Node.js >= 8.9
- npm >= 3.0.0

## 安装启动

```bash
# 克隆项目
git clone https://gitee.com/y_project/RuoYi-Vue.git

# 进入前端项目目录
cd ruoyi-ui

# 安装依赖
npm install

# 建议使用国内镜像加速安装
npm install --registry=https://registry.npm.taobao.org

# 启动开发服务器
npm run dev
```

浏览器访问 http://localhost:80

## 项目构建

```bash
# 构建测试环境
npm run build:stage

# 构建生产环境
npm run build:prod
```

## 项目结构

```
ruoyi-ui/
├── public/                 # 静态公共资源
├── src/
│   ├── api/               # API接口
│   ├── assets/            # 静态资源
│   ├── components/        # 公共组件
│   ├── directive/         # 指令
│   ├── router/            # 路由配置
│   ├── store/             # Vuex状态管理
│   ├── utils/             # 工具函数
│   ├── views/             # 页面视图
│   ├── App.vue            # 根组件
│   ├── main.js            # 入口文件
│   └── settings.js        # 系统配置
├── package.json           # 项目配置
└── vue.config.js         # Vue CLI配置
```

## 配置说明

系统配置文件位于 `src/settings.js`，可修改以下配置：

- `title` - 系统标题
- `sideTheme` - 侧边栏主题（theme-dark/theme-light）
- `tagsView` - 是否显示标签页
- `fixedHeader` - 是否固定头部
- `sidebarLogo` - 是否显示侧边栏Logo

## 许可证

MIT License
