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
      <el-form-item label="开始时间" prop="startTime">
        <el-date-picker
          v-model="dateRange"
          size="small"
          style="width: 530px"
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
      <el-table-column label="编号" align="center" prop="id" />
      <el-table-column label="活动主题" align="center" prop="title" />

      <el-table-column
        label="开始时间"
        align="center"
        prop="startTime"
        width="180"
        :formatter="dateFormat"
      >
      </el-table-column>
      <el-table-column
        label="结束时间"
        align="center"
        prop="endTime"
        width="180"
        :formatter="dateFormat"
      >
      </el-table-column>
      <el-table-column label="类型" align="center" prop="dictValue">
      </el-table-column>
      <el-table-column label="总奖品数" align="center" prop="sumCount">
      </el-table-column>
      <el-table-column label="已抽中" align="center" prop="hitCount">
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
        width="50"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-info"
            @click="handleShowDetail(scope.row)"
            v-hasPermi="['system:post:edit']"
            >详情
          </el-button>
        </template>
      </el-table-column>
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
      @close="cancel"
    >
      <el-form ref="form" :model="form" label-width="80px">
        <el-form-item label="活动主题" prop="title">
          <el-input v-model="form.title" disabled />
        </el-form-item>
        <el-form-item label="宣传图">
          <img :src="form.pic" alt="" height="55" />
        </el-form-item>

        <el-form-item label="活动简介" prop="content">
          <el-input v-model="form.content" disabled />
        </el-form-item>
        <el-form-item label="开始时间" prop="startTime">
          <el-date-picker
            v-model="form.startTime"
            clearable
            size="small"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            disabled
          />
        </el-form-item>

        <el-form-item label="结束时间" prop="endTime">
          <el-date-picker
            v-model="form.endTime"
            clearable
            size="small"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            disabled
          />
        </el-form-item>
        <el-form-item label="类型" prop="dictValue">
          <el-input :value="form.dictValue" disabled />
        </el-form-item>
        <el-form-item label="中奖明细">
          <el-table v-loading="loading" :data="detailProducts">
            <el-table-column label="奖品名称" align="center" prop="pname" />
            <el-table-column label="可中数量" align="center" prop="amount" />
            <el-table-column label="已中数量" align="center" prop="hitCount" />
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
import {
  typePost,
  levelPost,
  listPost,
  getProduct,
  exportPost,
  getGameProducts
} from "@/api/hit/info";


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
      //详情奖品
      detailProducts: [],

      typeDict: [{}],
      //
      imageUrl: "",
      //
      dictType: { dictType: "gametype" },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        id: undefined,
        title: undefined,
        startTime: undefined,
        endTime: undefined,
        type: undefined,
      },

      // 表单参数
      form: {},
      productForm: {},
      productDict: [],
      ruleForm: {},
      // 表单校验
      rules: {
        productid: [
          { required: true, message: "奖品不能为空", trigger: "blur" },
        ],
        title: [
          { required: true, message: "活动主题不能为空", trigger: "blur" },
        ],
        amount: [
          { required: true, message: "奖品数量不能为空", trigger: "blur" },
          {
            pattern: /[1-9]{1}\d*$/,
            message: "请输入正确奖品数量",
            trigger: "blur",
          },
        ],
        enterCount: [
          { required: true, message: "奖品数量不能为空", trigger: "blur" },
          {
            pattern: /^[1-9]{1}\d*$|0/,
            message: "请输入正确可抽奖数",
            trigger: "blur",
          },
        ],
        hitCount: [
          { required: true, message: "奖品数量不能为空", trigger: "blur" },
          {
            pattern: /^[1-9]{1}\d*$|0/,
            message: "请输入正确可中奖数",
            trigger: "blur",
          },
        ],
      },
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

    // 获取奖品
    getProductDict() {
      getProduct().then((response) => {
        response.rows.forEach((item, index) => {
          // console.log(item)
          this.productDict.push({ id: item.id, pname: item.pname });
        });
      });
    },
    getDetailProductList(gameid) {
      getGameProducts(gameid).then((response) => {
        this.detailProducts = response.data;
      });
    },
    /** 查询岗位列表 */
    getList() {
      this.loading = true;

      listPost(this.myAddDateRange(this.queryParams, this.dateRange)).then(
        (response) => {
          this.postList = response.rows;
          this.total = response.total;
          this.loading = false;
        }
      );
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.detailShow = false;

      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        title: undefined,
        pic: undefined,
        content: undefined,
        startTime: undefined,
        endTime: undefined,
        type: undefined,
      };
      this.resetForm("form");

      this.queryParams = {
        pageNum: 1,
        pageSize: 10,
        id: undefined,
        title: undefined,
        startTime: undefined,
        endTime: undefined,
        type: undefined,
      };
      this.resetForm("queryParams");
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

    /** 详情按钮操作 */
    handleShowDetail(row) {
      this.reset();
      this.queryParams.id = row.id;
      listPost(this.queryParams).then((response) => {
        if (response.rows.length > 0) {
          // console.log(response.rows[0]);
          this.form = response.rows[0];
          this.getDetailProductList(row.id);
          this.total = response.total;
          this.loading = false;
        } else {
          this.msgError("暂无该条数据!");
          this.getList();
        }
      });
      this.detailShow = true;
      this.title = "活动详情";
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm("是否确认导出所有中奖统计数据项?", "警告", {
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
