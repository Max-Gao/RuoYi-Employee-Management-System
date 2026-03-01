<template>
  <div class="app-container home">
    <el-row :gutter="20">
      <el-col :sm="24" :lg="24">
        <div class="project-header">
          <span class="project-title">若依员工后台管理项目</span>
          <span class="project-intro">本项目为员工后台管理系统，包含首页，系统管理和菜单管理三个模块。内容只用于技术实践和部分展示。</span>
        </div>
        <hr />
      </el-col>
    </el-row>

    <el-row :gutter="20">
      <el-col :xs="24" :sm="24" :md="12" :lg="10">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span class="card-title">技术栈</span>
          </div>
          <div class="card-content">
            <p><strong>后端：</strong>Spring Boot 2.7.18、Spring Security、MyBatis-Plus、Druid、Redis、JWT</p>
            <p><strong>前端：</strong>Vue + Element UI</p>
            <p><strong>数据库：</strong>MySQL</p>
          </div>
        </el-card>
      </el-col>

      <el-col :xs="24" :sm="24" :md="12" :lg="14">
        <el-card class="box-card">
          <div slot="header" class="clearfix">
            <span class="card-title">系统管理功能说明</span>
          </div>
          <div class="card-content">
            <el-tree :data="systemMenu" :props="treeProps" default-expand-all>
              <span class="tree-node" slot-scope="{ node, data }">
                <span><strong>{{ node.label }}</strong></span>
                <span v-if="data.desc" class="tree-desc">{{ data.desc }}</span>
              </span>
            </el-tree>
          </div>
        </el-card>
      </el-col>
    </el-row>

  </div>
</template>

<script>
export default {
  name: "index",
  data() {
    return {
      version: "3.4.0",
      treeProps: {
        children: 'children',
        label: 'label'
      },
      systemMenu: [{
        label: '系统管理',
        children: [
          { label: '用户管理', desc: '管理系统用户账号，支持新增、修改、删除、重置密码等操作' },
          { label: '角色管理', desc: '配置不同角色的权限，控制用户可访问的功能模块' },
          { label: '菜单管理', desc: '配置系统菜单结构，定义菜单名称、路由、图标等' },
          { label: '部门管理', desc: '维护组织架构，设置公司部门层级关系' },
          { label: '岗位管理', desc: '配置员工岗位信息，关联部门与职位' },
          { label: '字典管理', desc: '维护系统常量数据，如状态、类型等下拉选项' },
          { label: '参数设置', desc: '动态配置系统运行参数' },
          { label: '通知公告', desc: '发布系统公告信息' },
          { label: '日志管理', desc: '记录用户操作和登录行为，方便追溯和审计' },
          { label: '权限管理', desc: '配置按钮和字段级别的细粒度权限控制' }
        ]
      }]
    };
  },
  methods: {
    goTarget(href) {
      window.open(href, "_blank");
    },
  },
};
</script>

<style scoped lang="scss">
.home {
  .project-header {
    display: flex;
    flex-direction: column;
    gap: 5px;
  }
  .project-title {
    font-size: 20px;
    font-weight: bold;
    color: #303133;
  }
  .project-intro {
    font-size: 14px;
    color: #606266;
  }
  hr {
    margin-top: 15px;
    margin-bottom: 20px;
    border: 0;
    border-top: 1px solid #eee;
  }
  .card-title {
    font-size: 16px;
    font-weight: 600;
    color: #303133;
  }
  .card-content {
    color: #606266;
    font-size: 14px;
    line-height: 1.8;
  }
  .card-content p {
    margin: 8px 0;
  }
  .card-content code {
    background-color: #f5f7fa;
    padding: 2px 6px;
    border-radius: 4px;
    color: #e6a23c;
    font-size: 14px;
  }
  font-family: "Microsoft YaHei", "Helvetica Neue", Helvetica, Arial, sans-serif;
  font-size: 14px;
  color: #606266;
  overflow-x: hidden;
}
.tree-node {
  flex: 1;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding-right: 8px;
  font-size: 14px;
}
.tree-desc {
  font-size: 14px;
  color: #909399;
  margin-left: 10px;
  text-align: left;
  flex: 1;
}
::v-deep .el-tree-node__content {
  height: 34px;
  font-size: 14px;
  font-family: "Microsoft YaHei", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
::v-deep .el-tree {
  font-family: "Microsoft YaHei", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
::v-deep .el-card__body {
  font-family: "Microsoft YaHei", "Helvetica Neue", Helvetica, Arial, sans-serif;
}
</style>
