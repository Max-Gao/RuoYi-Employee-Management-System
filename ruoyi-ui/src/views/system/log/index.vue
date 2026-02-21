<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="操作地址" prop="operIp">
        <el-input
          v-model="queryParams.operIp"
          placeholder="请输入操作地址"
          clearable
          size="small"
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="操作人员" prop="operName">
        <el-input
          v-model="queryParams.operName"
          placeholder="请输入操作人员"
          clearable
          size="small"
          style="width: 240px"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="操作类型" prop="businessType">
        <el-select v-model="queryParams.businessType" placeholder="操作类型" clearable size="small" style="width: 240px">
          <el-option label="新增" value="1" />
          <el-option label="修改" value="2" />
          <el-option label="删除" value="3" />
          <el-option label="查询" value="4" />
          <el-option label="其他" value="9" />
        </el-select>
      </el-form-item>
      <el-form-item label="操作时间">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          value-format="yyyy-MM-dd"
          type="daterange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        ></el-date-picker>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="danger"
          plain
          icon="el-icon-delete"
          size="mini"
          :disabled="multiple"
          @click="handleDelete"
          v-hasPermi="['system:log:remove']"
        >删除</el-button>
      </el-col>
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:log:export']"
        >导出</el-button>
      </el-col>
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList" :columns="columns"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="logList" @selection-change="handleSelectionChange">
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="日志编号" align="center" key="operId" prop="operId" v-if="columns[0].visible" />
      <el-table-column label="操作模块" align="center" prop="title" :show-overflow-tooltip="true" />
      <el-table-column label="操作类型" align="center" prop="businessType" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.businessType === '1'" type="success">新增</el-tag>
          <el-tag v-else-if="scope.row.businessType === '2'" type="primary">修改</el-tag>
          <el-tag v-else-if="scope.row.businessType === '3'" type="danger">删除</el-tag>
          <el-tag v-else-if="scope.row.businessType === '4'">查询</el-tag>
          <el-tag v-else type="info">其他</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作人员" align="center" prop="operName" width="120" />
      <el-table-column label="操作地址" align="center" prop="operIp" width="130" />
      <el-table-column label="操作地点" align="center" prop="operLocation" :show-overflow-tooltip="true" />
      <el-table-column label="操作状态" align="center" prop="status" width="100">
        <template slot-scope="scope">
          <el-tag v-if="scope.row.status === '0'" type="success">成功</el-tag>
          <el-tag v-else type="danger">失败</el-tag>
        </template>
      </el-table-column>
      <el-table-column label="操作日期" align="center" prop="operTime" width="160">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.operTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="消耗时间" align="center" prop="costTime" width="100">
        <template slot-scope="scope">
          <span>{{ scope.row.costTime }}ms</span>
        </template>
      </el-table-column>
    </el-table>

    <pagination
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
  </div>
</template>

<script>
import { listLog, delLog, cleanLog, exportLog } from "@/api/system/log";

export default {
  name: "Log",
  data() {
    return {
      loading: true,
      ids: [],
      single: true,
      multiple: true,
      showSearch: true,
      total: 0,
      logList: [],
      dateRange: [],
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        operIp: undefined,
        operName: undefined,
        businessType: undefined
      },
      columns: [
        { key: 0, label: "日志编号", visible: true },
        { key: 1, label: "操作模块", visible: true },
        { key: 2, label: "操作类型", visible: true },
        { key: 3, label: "操作人员", visible: true },
        { key: 4, label: "操作地址", visible: true },
        { key: 5, label: "操作地点", visible: true },
        { key: 6, label: "操作状态", visible: true },
        { key: 7, label: "操作日期", visible: true },
        { key: 8, label: "消耗时间", visible: true }
      ]
    };
  },
  created() {
    this.getList();
  },
  methods: {
    getList() {
      this.loading = true;
      listLog(this.addDateRange(this.queryParams, this.dateRange)).then(response => {
          this.logList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    resetQuery() {
      this.dateRange = [];
      this.handleQuery();
    },
    handleSelectionChange(selection) {
      this.ids = selection.map(item => item.operId);
      this.single = selection.length !== 1;
      this.multiple = !selection.length;
    },
    handleDelete() {
      const ids = this.ids;
      this.$confirm('是否确认删除选中的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        return delLog(ids);
      }).then(() => {
        this.getList();
        this.msgSuccess("删除成功");
      }).catch(() => {});
    },
    handleExport() {
      this.$confirm('是否确认导出所有操作日志数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning"
      }).then(() => {
        this.download('system/log/export', {
          ...this.queryParams
        }, `log_${new Date().getTime()}.xlsx`);
      });
    }
  }
};
</script>
