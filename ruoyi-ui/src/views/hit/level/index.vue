<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="等级名称" prop="dictValue">
        <el-input
          v-model="queryParams.dictValue"
          placeholder="请输入等级名称"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>

      <el-form-item>
        <el-button type="primary" icon="el-icon-search" size="mini" @click="handleQuery">搜索</el-button>
        <el-button icon="el-icon-refresh" size="mini" @click="resetQuery">重置</el-button>
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

      <right-toolbar :showSearch.sync="showSearch" @queryTable="getLevel"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="levelDict">
      <!--      <el-table-column type="selection" width="55" align="center"/>-->
      <el-table-column label="等级代号" align="center" prop="dictKey"/>
      <el-table-column label="等级名称" align="center" prop="dictValue"/>
      <el-table-column label="创建时间" align="center" prop="createTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.createTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="更新时间" align="center" prop="updateTime" width="180">
        <template slot-scope="scope">
          <span>{{ parseTime(scope.row.updateTime) }}</span>
        </template>
      </el-table-column>
      <el-table-column label="操作" align="center" class-name="small-padding fixed-width">
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
      v-show="total>0"
      :total="total"
      :page.sync="queryParams.pageNum"
      :limit.sync="queryParams.pageSize"
      @pagination="getLevel"
    />

    <!-- 添加或修改岗位对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="等级代号" prop="dictKey" required>
          <el-input v-model="form.dictKey" placeholder="请输入等级代号"/>
        </el-form-item>
        <el-form-item label="等级名称" prop="dictValue" required>
          <el-input v-model="form.dictValue" placeholder="请输入等级名称"/>
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

  import { levelPost, delPost, getPost, addPost, updatePost, exportPost } from '@/api/hit/level'

  export default {
    name: 'Level',
    data() {
      return {
        // 遮罩层
        loading: true,
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        // 总条数
        total: 0,
        // 岗位表格数据
        postList: [],
        // 弹出层标题
        title: '',
        // 是否显示弹出层
        open: false,
        // 状态数据字典
        statusOptions: [],
        //等级字典
        levelDict: [{}],
        //
        imageUrl: '',

        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          dictType: 'userlevel',
          dictValue: undefined
        },

        // 表单参数
        form: {},
        // 表单校验
        rules: {
          dictKey: [
            { required: true, message: '等级代号不能为空', trigger: 'blur' }
          ],
          dictValue: [
            { required: true, message: '等级名称不能为空', trigger: 'blur' }
          ]

        }
      }
    },
    created() {
      this.getLevel()

    },
    methods: {
      /** 获取等级列表 */
      getLevel() {
        this.loading = true
        levelPost(this.queryParams).then(response => {
          // console.log(response)
          this.levelDict = response.rows
          this.total = response.total
          this.loading = false
        })
      },

      // 取消按钮
      cancel() {
        this.open = false
        this.reset()
      },
      // 表单重置
      reset() {
        this.form = {
          id: undefined,
          dictType: 'userlevel',
          dictKey: undefined,
          dictValue: undefined,
          delState: 0
        }
        this.resetForm('form')
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1
        this.getLevel()
      },
      /** 重置按钮操作 */
      resetQuery() {
        this.resetForm('queryForm')
        this.handleQuery()
      },

      /** 新增按钮操作 */
      handleAdd() {
        this.reset()
        this.open = true
        this.title = '添加等级'
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        const id = row.id
        getPost(id).then(response => {
          this.form = response.data
          this.open = true
          this.title = '修改等级'
        })

      },

      /** 提交按钮 */
      submitForm: function() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (this.form.id != undefined) {
              //修改
              this.addOrUpdate(false)
            } else {
              //添加
              this.addOrUpdate(true)
            }
          }
        })
      },
      addOrUpdate(state) {
        if (state) {
          addPost(this.form).then(response => {
            this.msgSuccess('新增成功')
            this.open = false
            this.getLevel()
          })

        } else {
          updatePost(this.form).then(response => {
            this.msgSuccess('修改成功')
            this.open = false
            this.getLevel()
          })
        }
      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const id = row.id

        this.$confirm('是否确认删除岗位编号为"' + id + '"的数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return delPost(id)
        }).then(() => {
          this.getLevel()
          this.msgSuccess('删除成功')
        })

      },
      /** 导出按钮操作 */
      handleExport() {
        const queryParams = this.queryParams
        this.$confirm('是否确认导出所有会员数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return exportPost(queryParams)
        }).then(response => {
          this.download(response.msg)
        })
      },
      handleAvatarSuccess(res, file) {
        this.imageUrl = URL.createObjectURL(file.raw)
      },
      beforeAvatarUpload(file) {
        const isJPG = file.type === 'image/jpeg'
        const isLt2M = file.size / 1024 / 1024 < 2

        if (!isJPG) {
          this.$message.error('上传头像图片只能是 JPG 格式!')
        }
        if (!isLt2M) {
          this.$message.error('上传头像图片大小不能超过 2MB!')
        }
        return isJPG && isLt2M
      }

    }
  }

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
    border-color: #409EFF;
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
