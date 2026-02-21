<template>
  <div class="app-container">
    <el-form
      :model="queryParams"
      ref="queryForm"
      :inline="true"
      :rules="rules"
      v-show="showSearch"
      label-width="68px"
    >
      <el-form-item label="奖品名称" prop="pname">
        <el-input
          v-model="queryParams.pname"
          placeholder="请输入奖品名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="市场价" prop="priceLow">
        <el-input
          v-model="queryParams.priceLow"
          placeholder="请输入最低价"
          clearable
          size="small"
        />
      </el-form-item>
      ~
      <el-form-item prop="priceHigh">
        <el-input
          v-model="queryParams.priceHigh"
          placeholder="请输入最高价"
          clearable
          size="small"
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
          type="primary"
          plain
          icon="el-icon-plus"
          size="mini"
          @click="handleAdd"
          >新增
        </el-button>
      </el-col>
      <el-col :span="1.5">
        <el-upload
          class="avatar-uploader"
          action="#"
          :show-file-list="false"
          :http-request="handleExcelSuccess"
          :before-upload="beforeExcelUpload"
        >
          <el-button type="warning" plain icon="el-icon-download" size="mini">
            导入
          </el-button>
        </el-upload>
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

    <el-table
      v-loading="loading"
      :data="postList"
      @selection-change="handleSelectionChange"
    >
      <el-table-column type="selection" width="55" align="center" />
      <el-table-column label="奖品编号" align="center" prop="id" />
      <el-table-column label="奖品名称" align="center" prop="pname" />
      <el-table-column label="图片" align="center" prop="pic">
        <template slot-scope="scope">
          <img :src="scope.row.pic" min-width="70" height="70" />
        </template>
      </el-table-column>
      <el-table-column label="简介" align="center" prop="content" />
      <el-table-column label="市场价" align="center" prop="price" />

      <el-table-column
        label="操作"
        align="center"
        class-name="small-padding fixed-width"
      >
        <template slot-scope="scope">
          <el-button
            size="mini"
            type="text"
            icon="el-icon-edit"
            @click="handleUpdate(scope.row)"
            v-hasPermi="['system:post:edit']"
            >修改
          </el-button>
          <el-button
            size="mini"
            type="text"
            icon="el-icon-delete"
            @click="handleDelete(scope.row)"
            v-hasPermi="['system:post:remove']"
            >删除
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

    <!-- 添加或修改岗位对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="奖品名称" prop="pname">
          <el-input v-model="form.pname" placeholder="请输入奖品名称" />
        </el-form-item>
        <el-form-item label="图片" prop="pic">
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
        <el-form-item label="简介" prop="content">
          <el-input v-model="form.content" placeholder="请输入奖品简介" />
        </el-form-item>
        <el-form-item label="市场价" prop="price">
          <el-input
            v-model="form.price"
            placeholder="请输入市场价"
            type="number"
          />
        </el-form-item>
      </el-form>
      <div slot="footer" class="dialog-footer">
        <el-button type="primary" @click="submitForm">确 定</el-button>
        <el-button @click="cancel">取 消</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
// import store from '@/store'
import {
  listPost,
  getPost,
  delPost,
  addPost,
  updatePost,
  exportPost,
} from "@/api/hit/product";
import {Message} from 'element-ui'
import { uploadAvatar, uploadExcel } from "@/api/hit/upload";

export default {
  name: "Product",
  data() {
    return {
      // 遮罩层
      loading: true,
      // 选中数组
      ids: [],
      // // 非单个禁用
      single: true,
      // // 非多个禁用
      multiple: true,
      // 显示搜索条件
      showSearch: true,
      // 总条数
      total: 0,
      // 奖品表格数据
      postList: [],
      // 弹出层标题
      title: "",
      // 是否显示弹出层
      open: false,
      // 状态数据字典
      statusOptions: [],
      //等级字典
      // levelDict: [{}],
      //
      imageUrl: "",
      //
      dictType: { dictType: "userlevel" },
      // 查询参数
      queryParams: {
        pageNum: 1,
        pageSize: 10,
        pname: undefined,
        priceLow: undefined,
        priceHigh: undefined,
      },

      // 表单参数
      form: {},
      // 表单校验
      rules: {
        priceHigh: [
          {
            pattern:
              /^0\.\d[1-9]$|^0\.[1-9]$|^0\.[1-9]\d$|^[1-9][0-9]*(\.\d{1,2})?$/,
            message: "请输入正确的价格",
            trigger: "blur",
          },
        ],
        priceLow: [
          {
            pattern:
              /^0\.\d[1-9]$|^0\.[1-9]$|^0\.[1-9]\d$|^[1-9][0-9]*(\.\d{1,2})?$/,
            message: "请输入正确的价格",
            trigger: "blur",
          },
        ],
        price: [
          { required: true, message: "市场价不能为空", trigger: "blur" },
          {
            pattern:
              /^0\.\d[1-9]$|^0\.[1-9]$|^0\.[1-9]\d$|^[1-9][0-9]*(\.\d{1,2})?$/,
            message: "请输入正确的价格",
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
    requestUpload() {},
    /** 查询岗位列表 */
    getList() {
      this.loading = true;
      listPost(this.queryParams).then((response) => {
        this.postList = response.rows;
        this.total = response.total;
        this.loading = false;
      });
    },

    // 取消按钮
    cancel() {
      this.open = false;
      this.imageUrl = "";
      this.reset();
    },
    // 表单重置
    reset() {
      this.form = {
        id: undefined,
        pname: undefined,
        pic: undefined,
        content: undefined,
        price: undefined,
        delState: 0,
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
      this.title = "添加会员";
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
          this.title = "修改会员";
        } else {
          this.getList();
          this.msgError("该数据不存在,无法修改");
        }
      });
    },
    // 上传预处理

    /** 提交按钮 */
    submitForm: function () {
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
    addOrUpdate(state) {
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
      const id = row.id || this.ids;
      this.$confirm('是否确认删除奖品编号为"' + id + '"的数据项?', "警告", {
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
      const id_list = this.ids;
      // console.log(this.ids)
      if (this.ids.length > 0) {
        this.$confirm("是否确认导出所选有奖品数据项?", "警告", {
          confirmButtonText: "确定",
          cancelButtonText: "取消",
          type: "warning",
        })
          .then(function () {
            // console.log(JSON.stringify(id_list));
            return exportPost(JSON.stringify(id_list));
          })
          .then((response) => {
            this.download(response.msg);
          });
      }else{
        Message({
        message: "您未选中任何数据",
        type: 'warning'
      })
      }
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
    handleExcelSuccess(data) {
      let file = data.file;
      let formData = new FormData();
      formData.append("myExcel", file);
      uploadExcel(formData).then((response) => {
        if (response.code == 200) {
          this.msgSuccess(response.msg);
        } else {
          this.msgError(response.msg);
        }
      });
    },
    beforeExcelUpload(file) {
      // console.log(file.type);
      const isExcel =
        file.type ===
        "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
      const isLt10M = file.size / 1024 / 1024 < 10;

      if (!isExcel) {
        this.$message.error("导入文件只能是 Excel 文件!");
      }
      if (!isLt10M) {
        this.$message.error("导入文件大小不能超过 10MB!");
      }
      return isExcel && isLt10M;
    },
    // 多选框选中数据
    handleSelectionChange(selection) {
      this.ids = selection.map((item) => item.id);
      // console.log(this.ids);
      this.single = selection.length != 1;
      this.multiple = !selection.length;
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
