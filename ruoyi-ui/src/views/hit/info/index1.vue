<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="活动主题" prop="title">
        <el-input
          v-model="queryParams.title"
          placeholder="请输入活动主题"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="用户名" prop="username">
        <el-input
          v-model="queryParams.username"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="奖品名称" prop="pname">
        <el-input
          v-model="queryParams.pname"
          placeholder="请输入奖品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <br />
      <el-form-item label="中奖时间" prop="startTime">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 240px"
          format="yyyy年-MM月-dd日 HH时:mm分:ss秒"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="datetimerange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        />
      </el-form-item>
      <el-form-item>
        <el-button
          type="primary"
          icon="el-icon-search"
          size="mini"
          @click="handleQuery"
          >搜索</el-button
        >
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery"
          >重置</el-button
        >
      </el-form-item>
    </el-form>

    <el-row :gutter="10" class="mb8">
      <el-col :span="1.5">
        <el-button
          type="warning"
          plain
          icon="el-icon-download"
          size="mini"
          @click="handleExport"
          v-hasPermi="['system:post:export']"
          >导出
        </el-button>
      </el-col>
      <right-toolbar
        :showSearch.sync="showSearch"
        @queryTable="getList"
      ></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList">
      <!--      <el-table-column label="活动编号" align="center" prop="id"/>-->
      <el-table-column label="活动主题" align="center" prop="title" />
      <el-table-column label="类型" align="center" prop="types" />
      <el-table-column label="用户名" align="center" prop="user_name" />
      <el-table-column label="姓名" align="center" prop="realname" />
      <el-table-column label="身份证" align="center" prop="id_card" />
      <el-table-column label="手机号" align="center" prop="phone" />
      <el-table-column label="会员等级" align="center" prop="level" />
      <el-table-column label="奖品名称" align="center" prop="pname" />
      <el-table-column label="市场价" align="center" prop="price" />
      <el-table-column
        label="中奖时间"
        align="center"
        prop="hittime"
        width="180"
        :formatter="dateFormat"
      />

      <!--      <el-table-column label="操作" align="center" class-name="small-padding fixed-width" width="200">-->
      <!--        <template slot-scope="scope">-->
      <!--          <el-button-->
      <!--            size="mini"-->
      <!--            type="text"-->
      <!--            icon="el-icon-info"-->
      <!--            @click="handleShowDetail(scope.row)"-->
      <!--            v-hasPermi="['system:post:edit']"-->
      <!--          >详情-->
      <!--          </el-button>-->
      <!--        </template>-->
      <!--      </el-table-column>-->
    </el-table>

    <pagination
      v-show="total > 0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getList"
    />
    <!-- 详情对话框 -->
    <el-dialog
      :title="title"
      :visible.sync="detailShow"
      width="500px"
      append-to-body
    >
      <el-form label-width="80px">
        <el-form-item label="活动主题">
          <el-input :value="form.title" disabled />
        </el-form-item>
        <el-form-item label="活动简介">
          <el-input :value="form.content" disabled />
        </el-form-item>
        <el-form-item label="开始时间">
          <el-date-picker
            :value="form.startTime"
            clearable
            size="small"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            disabled
          />
        </el-form-item>
        <el-form-item label="结束时间">
          <el-date-picker
            :value="form.endTime"
            clearable
            size="small"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            disabled
          />
        </el-form-item>
        <el-form-item label="类型">
          <el-input :value="form.type" disabled />
        </el-form-item>
        <el-form-item label="奖品">
          <el-table v-loading="loading" :data="detailProducts">
            <el-table-column label="奖品名称" align="center" prop="pname" />
            <el-table-column label="数量" align="center" prop="amount" />
          </el-table>
        </el-form-item>
        <el-form-item label="策略">
          <el-table v-loading="loading" :data="detailRules">
            <el-table-column label="会员等级" align="center" prop="dictValue" />
            <el-table-column
              label="最大抽奖数"
              align="center"
              prop="enterCount"
            />
            <el-table-column
              label="最大中奖数"
              align="center"
              prop="hitCount"
            />
          </el-table>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
// import store from '@/store'
import { listPost, exportPost } from "@/api/hit/info1";

export default {
  name: "Game",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      detailShow: false,
      dateRange: [],
      //详情奖品
      detailProducts: [],
      //详情策略
      detailRules: [],
      openProduct: false,
      openRule: false,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 岗位表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      //等级字典
      levelDict: [{}],
      typeDict: [{}],
      //
      imageUrl: "",
      //
      dictType: { dictType: "gametype" },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        title: undefined,
        username: undefined,
        phone: undefined,
        pname: undefined,
        startTime: undefined,
        endTime: undefined,
      },

      // 表单参数
      form: {},
    };
  },
  created() {
    this.getList();
  },
  methods: {
    // 时间格式化
    dateFormat(row, column, cellValue, index) {
      // console.log(cellValue)
      return cellValue.slice(0, 19).replace("T", " ");
    },
    /** 查询活动列表 */
    getList() {
      this.loading = true;

      listPost(this.myAddDateRange(this.queryParams,this.dateRange)).then((response) => {
        // console.log(response.rows);
        this.postList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    // 取消按钮
    cancel() {
      this.open = false;
      this.detailShow = false;
      this.reset();
    },
    // 表单重置
    reset() {
      this.detailProducts = [
        {
          pname: undefined,
          amount: undefined,
        },
      ];
      this.detailRules = [
        {
          dictValue: undefined,
          enterCount: undefined,
          hitCount: undefined,
        },
      ];
      this.form = {
        title: undefined,
        type: undefined,
        userName: undefined,
        realname: undefined,
        idCard: undefined,
        phone: undefined,
        level: undefined,
        pname: undefined,
        price: undefined,
        hittime: undefined,
      };
      this.resetForm("form");
    },
    /** 搜索按钮操作 */
    handleQuery() {
      this.queryParams.pageNum = 1;
      this.getList();
    },
    /** 重置按钮操作 */
    resetQuery() {
      this.resetForm("queryForm");
      this.handleQuery();
    },

    /** 新增按钮操作 */
    handleAdd() {
      this.reset();
      this.open = true;
      this.detailShow = false;
      this.title = "添加活动";
    },
    /** 修改按钮操作 */
    handleUpdate(row) {
      this.reset();
      const id = row.id;
      getPost(id).then((response) => {
        if (response.data != null) {
          this.form = response.data;
          this.imageUrl = this.form.pic;
          this.open = true;

          this.detailShow = false;
          this.title = "修改活动";
        } else {
          this.msgError("该活动不存在,无法修改!");
          this.getList();
        }
      });
    },
    /** 详情按钮操作 */
    handleShowDetail(row) {
      this.reset();

      getPost(row.id).then((response) => {
        if (response.data != null) {
          this.form = response.data;
          this.getDetailProductList(row.id);
          this.getDetailRuleList(row.id);
          this.detailShow = true;
          this.title = "活动详情";
        } else {
          this.msgError("该活动不存在,无法查看!");
          this.getList();
        }
      });
    },

    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm("是否确认导出所有中奖历史数据项?", "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return exportPost(queryParams);
        })
        .then((response) => {
          this.download(response.msg);
        });
    },
  },
};
</script>
<style lang="scss" scoped>
.avatar-uploader .el-upload {
  border: 1px dashed #d9d9d9;
  border-radius: 6px;
  cursor: pointer;
  position: relative;
  overflow: hidden;
}

.avatar-uploader .el-upload:hover {
  border-color: #409eff;
}

.avatar-uploader-icon {
  font-size: 20px;
  color: #8c939d;
  width: 50px;
  height: 50px;
  line-height: 50px;
  text-align: center;
}

.avatar {
  width: 50px;
  height: 50px;
  display: block;
}
</style>
