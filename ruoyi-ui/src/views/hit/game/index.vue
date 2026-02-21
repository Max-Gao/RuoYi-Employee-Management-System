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
          style="width: 240px"
          format="yyyy年-MM月-dd日 HH时:mm分:ss秒"
          value-format="yyyy-MM-dd HH:mm:ss"
          type="datetimerange"
          range-separator="-"
          start-placeholder="开始日期"
          end-placeholder="结束日期"
        />
      </el-form-item>
      <el-form-item label="类型" prop="type">
        <el-select
          v-model="queryParams.type"
          placeholder="请选择类型"
          clearable
          size="small"
        >
          <el-option
            v-for="(dict, index) in typeDict"
            :key="index"
            :label="dict.dictValue"
            :value="dict.dictKey"
          />
        </el-select>
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增
        </el-button>
      </el-col>

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
      <el-table-column label="活动编号" align="center" prop="id" />
      <el-table-column label="活动主题" align="center" prop="title" />

      <el-table-column
        label="开始时间"
        align="center"
        prop="startTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ scope.row.startTime }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="结束时间"
        align="center"
        prop="endTime"
        width="180"
      >
        <template slot-scope="scope">
          <span>{{ scope.row.endTime }}</span>
        </template>
      </el-table-column>
      <el-table-column label="类型" align="center" prop="type">
        <template slot-scope="scope">
          <span>{{ getTypeNick(scope.row.type) }}</span>
        </template>
      </el-table-column>
      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
        width="200"
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
          <el-button
            size="mini"
            v-if="isShow(scope.row.startTime)"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:post:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            v-if="isShow(scope.row.startTime)"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:post:remove']"
            >删除
          </el-button>
          <el-button
            size="mini"
            v-if="isShow(scope.row.startTime)"
            type="text"
            icon="el-icon-present"
            @click="handleProduct(scope.row)"
            v-hasPermi="['system:post:remove']"
            >奖品配置
          </el-button>
          <el-button
            size="mini"
            v-if="isShow(scope.row.startTime)"
            type="text"
            icon="el-icon-setting"
            @click="handleRule(scope.row)"
            v-hasPermi="['system:post:remove']"
            >策略配置
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

    <!-- 添加或修改活动对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="活动主题" prop="title" required>
          <el-input v-model="form.title" placeholder="请输入活动主题" />
        </el-form-item>
        <el-form-item label="宣传图" prop="pic">
          <!--          <input type="file" accept="image/*" ref="inputer" id="fileupload">-->
          <el-upload
            class="avatar-uploader"
            action="#"
            :show-file-list="false"
            :http-request="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload"
          >
            <img v-if="imageUrl" :src="imageUrl" class="avatar" />
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="活动简介" prop="content" required>
          <el-input v-model="form.content" placeholder="请输入活动简介" />
        </el-form-item>
        <el-form-item label="开始时间" prop="startTime" required>
          <el-date-picker
            v-model="form.startTime"
            placeholder="请选择开始时间"
            clearable
            size="small"
            type="datetime"
            value-format="yyyy-MM-dd HH:mm:ss"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>

        <el-form-item label="结束时间" prop="endTime" required>
          <el-date-picker
            v-model="form.endTime"
            placeholder="请选择结束时间"
            clearable
            size="small"
            value-format="yyyy-MM-dd HH:mm:ss"
            type="datetime"
            @keyup.enter.native="handleQuery"
          />
        </el-form-item>
        <el-form-item label="类型" prop="type" required>
          <el-select
            v-model="form.type"
            placeholder="请选择类型"
            clearable
            size="small"
          >
            <el-option
              v-for="(dict, index) in typeDict"
              :key="index"
              :label="dict.dictValue"
              :value="dict.dictKey * 1"
            />
          </el-select>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>

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
          <el-input :value="getTypeNick(form.type)" disabled />
        </el-form-item>
        <el-form-item label="奖品">
          <el-table v-loading="loading" :data="detailProducts">
            <el-table-column label="奖品名称" align="center" prop="pname" />
            <el-table-column label="数量" align="center" prop="amount" />
            <el-table-column
              label="操作"
              align="center"
              class-name="small-padding fixed-width"
              width="80"
            >
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  v-if="isShow(myDateTime)"
                  type="text"
                  icon="el-icon-delete"
                  @click="deleteProductCongig(scope.row)"
                  >删除
                </el-button>
                <el-button
                  size="mini"
                  v-else
                  type="text"
                  style="color: #ccc"
                  disabled
                  ><i class="el-icon-delete" style="color: #ccc"></i>删除
                </el-button>
              </template>
            </el-table-column>
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
            <el-table-column
              label="操作"
              align="center"
              class-name="small-padding fixed-width"
              width="80"
            >
              <template slot-scope="scope">
                <el-button
                  size="mini"
                  v-if="isShow(myDateTime)"
                  type="text"
                  icon="el-icon-delete"
                  @click="deleteRuleCongig(scope.row)"
                  >删除
                </el-button>
                <el-button
                  size="mini"
                  v-else
                  type="text"
                  style="color: #ccc"
                  disabled
                  ><i class="el-icon-delete" style="color: #ccc"></i>删除
                </el-button>
              </template>
            </el-table-column>
          </el-table>
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!--  奖品配置   -->
    <el-dialog
      :title="title"
      :visible.sync="openProduct"
      width="500px"
      append-to-body
    >
      <el-form
        ref="productForm"
        :model="productForm"
        :rules="rules"
        label-width="80px"
      >
        <el-form-item label="活动id" prop="gameid">
          <el-input v-model="productForm.gameid" disabled />
        </el-form-item>
        <el-form-item label="奖品" prop="productid" required>
          <el-select v-model="productForm.productid" size="small">
            <el-option
              v-for="(dict, index) in productDict"
              :key="index"
              :label="dict.pname"
              :value="dict.id * 1"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="奖品数量" prop="amount" required>
          <el-input v-model="productForm.amount" type="number" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitProductForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
    <!--  策略配置   -->
    <el-dialog
      :title="title"
      :visible.sync="openRule"
      width="500px"
      append-to-body
    >
      <el-form
        ref="ruleForm"
        :model="ruleForm"
        :rules="rules"
        label-width="80px"
      >
        <el-form-item label="活动id" prop="gameid">
          <el-input v-model="ruleForm.gameid" disabled />
        </el-form-item>
        <el-form-item label="会员等级" prop="levelid" required>
          <el-select v-model="ruleForm.levelid" size="small">
            <el-option
              v-for="(dict, index) in levelDict"
              :key="index"
              :label="dict.dictValue"
              :value="dict.id * 1"
            />
          </el-select>
        </el-form-item>
        <el-form-item label="可抽奖数" prop="enterCount" required>
          <el-input v-model="ruleForm.enterCount" />
        </el-form-item>
        <el-form-item label="可中奖数" prop="hitCount" required>
          <el-input v-model="ruleForm.hitCount" />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitRuleForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
// import store from '@/store'
import {
  typePost,
  levelPost,
  addOrUpdateProduct,
  addOrUpdateRule,
  getPost,
  listPost,
  getProduct,
  delPost,
  addPost,
  updatePost,
  exportPost,
  deleteRule,
deleteProduct
  // getGameProducts,
  // getGameRules,
} from "@/api/hit/game";
import { uploadAvatar } from "@/api/hit/upload";
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
        startTime: undefined,
        endTime: undefined,
        type: undefined,
      },

      // 表单参数
      form: {},
      productForm: {},
      productDict: [],
      ruleForm: {},

      myDateTime: "",
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
    this.getLevel();
    this.getType();
    this.getList();
  },
  methods: {
    requestUpload() {},
    deleteRuleCongig(row) {
      deleteRule(row.id).then((response) => {
        // this.detailProducts = response.data
        this.msgSuccess("删除中奖策略成功");
        this.detailRules = response.data;
      });
    },
    deleteProductCongig(row) {
      deleteProduct(row.id).then((response) => {
        this.msgSuccess("删除奖品配置成功");
        this.detailProducts = response.data;
        // this.detailRules = response.data
      });
    },
    isShow(startTime) {
      return (
        startTime >
        new Date().toLocaleString().replace("/", "-").replace("/", "-")
      );
    },
    /** 获取等级字典 */
    getType() {
      typePost(this.dictType).then((response) => {
        this.typeDict = response.rows;
      });
    },
    getTypeNick(level) {
      for (const levelName of this.typeDict) {
        if (levelName.dictKey == level) {
          return levelName.dictValue;
        }
      }
    },
    getLevel() {
      this.loading = true;
      levelPost({ dictType: "userlevel" }).then((response) => {
        // console.log(response)
        this.levelDict = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },
    getLevelNick(level) {
      for (const levelName of this.levelDict) {
        if (levelName.dictKey == level) {
          return levelName.dictValue;
        }
      }
    },
    // 获取奖品
    getProductDict() {
      getProduct().then((response) => {
        // this.reset();
        response.rows.forEach((item, index) => {
          this.productDict.push({ id: item.id, pname: item.pname });
        });
      });
    },
    /** 查询活动列表 */
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
    // getDetailProductList(gameid) {
    //   getGameProducts(gameid).then((response) => {
    //     this.detailProducts = response.data;
    //   });
    // },
    // getDetailRuleList(gameid) {
    //   getGameRules(gameid).then((response) => {
    //     this.detailRules = response.data;
    //   });
    // },
    // 取消按钮
    cancel() {
      this.open = false;
      this.detailShow = false;
      this.openProduct = false;
      this.openRule = false;
      this.imageUrl = "";

      this.reset();
    },
    // 表单重置
    reset() {
      this.productDict = [];
      this.detailProducts = [
        {
          id: undefined,
          pname: undefined,
          amount: undefined,
        },
      ];
      this.detailRules = [
        {
          id: undefined,
          dictValue: undefined,
          enterCount: undefined,
          hitCount: undefined,
        },
      ];
      this.form = {
        id: undefined,
        title: undefined,
        pic: undefined,
        content: undefined,
        startTime: undefined,
        endTime: undefined,
        type: undefined,
      };
      // this.resetForm('form')
      this.productForm = {
        gameid: undefined,
        productid: undefined,
        amount: undefined,
      };
      // this.resetForm('productForm')
      this.ruleForm = {
        gameid: undefined,
        levelid: undefined,
        enterCount: undefined,
        hitCount: undefined,
      };
      // this.resetForm('ruleForm')
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
          this.form = response.data.cardGame;
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
      this.myDateTime = row.startTime;
      getPost(row.id).then((response) => {
        console.log(response);
        if (response.data != null) {
          this.form = response.data.cardGame;
          this.detailProducts = response.data.gameProductList;
          this.detailRules = response.data.gameRuleList;
          // this.getDetailProductList(row.id);
          // this.getDetailRuleList(row.id);
          this.detailShow = true;
          this.title = "活动详情";
        } else {
          this.msgError("该活动不存在,无法查看!");
          this.getList();
        }
      });
    },
    // 奖品配置
    handleProduct(row) {
      // console.log(row);
      this.reset();
      this.getProductDict();
      this.openProduct = true;
      this.productForm.gameid = row.id;
      // console.log("点击",this.productForm);
      this.title = "奖品配置";
    },

    // 中奖策略配置
    handleRule(row) {
      this.reset();
      this.openRule = true;

      this.ruleForm.gameid = row.id;
      this.title = "中奖策略配置";
    },
    /** 提交按钮 */
    submitForm: function () {
      // console.log(this.form)
      this.$refs["form"].validate((valid) => {
        if (valid) {
          if (this.form.id != undefined) {
            this.addOrUpdate(false);
          } else {
            this.addOrUpdate(true);
          }
        }
      });
    },
    submitProductForm() {
      this.$refs["productForm"].validate((valid) => {
        if (valid) {
          // console.log("表单提交",this.productForm);
          this.addOrUpdateProductForm();
        }
      });
    },
    submitRuleForm() {
      this.$refs["ruleForm"].validate((valid) => {
        if (valid) {
          this.addOrUpdateRuleForm();
        }
      });
    },
    addOrUpdateProductForm() {
      // console.log("add",this.productForm);
      addOrUpdateProduct(this.productForm).then((response) => {
        this.msgSuccess("奖品配置成功");
        this.openProduct = false;
      });
    },
    addOrUpdateRuleForm() {
      // console.log(this.ruleForm);
      addOrUpdateRule(this.ruleForm).then((response) => {
        this.msgSuccess("奖品配置成功");
        this.openRule = false;
      });
    },
    addOrUpdate(state) {
      // console.log(a)
      // console.log(state,this.form)
      if (state) {
        addPost(this.form).then((response) => {
          this.msgSuccess("新增成功");
          this.imageUrl = "";
          this.open = false;
          this.getList();
        });
      } else {
        updatePost(this.form).then((response) => {
          this.msgSuccess("修改成功");
          this.imageUrl = "";
          this.open = false;
          this.getList();
        });
      }
    },
    /** 删除按钮操作 */
    handleDelete(row) {
      const id = row.id;
      this.$confirm('是否确认删除岗位编号为"' + id + '"的数据项?', "警告", {
        confirmButtonText: "确定",
        cancelButtonText: "取消",
        type: "warning",
      })
        .then(function () {
          return delPost(id);
        })
        .then(() => {
          this.getList();
          this.msgSuccess("删除成功");
        });
    },
    /** 导出按钮操作 */
    handleExport() {
      const queryParams = this.queryParams;
      this.$confirm("是否确认导出所有活动数据项?", "警告", {
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
    handleAvatarSuccess(data) {
      let file = data.file;
      let formData = new FormData();
      formData.append("mypic", file);
      uploadAvatar(formData).then((response) => {
        // console.log(response);
        this.form.pic = response.data;
        this.imageUrl = response.data;
      });
    },
    beforeAvatarUpload(file) {
      // console.log(file.type)
      const isImg =
        file.type === "image/jpg" ||
        file.type === "image/jpeg" ||
        file.type === "image/png";
      const isLt10M = file.size / 1024 / 1024 < 10;

      if (!isImg) {
        this.$message.error("上传头像图片只能是 jpg/jpeg/png 格式!");
      }
      if (!isLt10M) {
        this.$message.error("上传头像图片大小不能超过 10MB!");
      }
      return isImg && isLt10M;
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
