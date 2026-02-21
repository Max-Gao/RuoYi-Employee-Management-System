<template>
  <div class="app-container">
    <el-form :model="queryParams" ref="queryForm" :inline="true" v-show="showSearch" label-width="68px">
      <el-form-item label="用户名" prop="userName">
        <el-input
          v-model="queryParams.userName"
          placeholder="请输入用户名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="姓名" prop="realname">
        <el-input
          v-model="queryParams.realname"
          placeholder="请输入姓名"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="身份证号" prop="idCard">
        <el-input
          v-model="queryParams.idCard"
          placeholder="请输入身份证号"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="手机号码" prop="phone">
        <el-input
          v-model="queryParams.phone"
          placeholder="请输入手机号码"
          clearable
          size="small"
          @keyup.enter.native="handleQuery"
        />
      </el-form-item>
      <el-form-item label="等级" prop="level">
        <el-select v-model="queryParams.level" placeholder="请选择等级" clearable size="small">
          <el-option
            v-for="(dict,index) in levelDict"
            :key="index"
            :label="dict.dictValue"
            :value="dict.dictKey"
          />
        </el-select>
      </el-form-item>
      <el-form-item label="注册时间" prop="startTime">
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
      <right-toolbar :showSearch.sync="showSearch" @queryTable="getList"></right-toolbar>
    </el-row>

    <el-table v-loading="loading" :data="postList">
      <!--      <el-table-column type="selection" width="55" align="center"/>-->
      <el-table-column label="用户名" align="center" prop="userName"/>
      <el-table-column label="头像" align="center" prop="pic">
        <template slot-scope="scope">
          <img :src="scope.row.pic" min-width="70" height="70"/>
        </template>
      </el-table-column>
      <el-table-column label="姓名" align="center" prop="realname"/>
      <el-table-column label="身份证号" align="center" prop="idCard"/>
      <el-table-column label="手机号" align="center" prop="phone"/>
      <el-table-column label="等级" align="center" prop="level">
        <template slot-scope="scope">
          <span>{{getLevelNick(scope.row.level)}}</span>
        </template>
      </el-table-column>
      <el-table-column label="注册时间" align="center" prop="createTime" width="180">
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
      @pagination="getList"
    />

    <!-- 添加或修改岗位对话框 -->
    <el-dialog :title="title" :visible.sync="open" width="500px" append-to-body>
      <el-form ref="form" :model="form" :rules="rules" label-width="80px">
        <el-form-item label="用户名" prop="userName">
          <el-input v-model="form.userName" placeholder="请输入用户名"/>
        </el-form-item>
        <el-form-item label="密码" prop="userPass">
          <el-input type="password" v-model="form.userPass" placeholder="请输入密码"/>
        </el-form-item>
        <el-form-item label="头像" prop="pic">
          <!--          <input type="file" accept="image/*" ref="inputer" id="fileupload">-->
          <el-upload
            class="avatar-uploader"
            action="#"
            :show-file-list="false"
            :http-request="handleAvatarSuccess"
            :before-upload="beforeAvatarUpload">
            <img v-if="imageUrl" :src="imageUrl" class="avatar">
            <i v-else class="el-icon-plus avatar-uploader-icon"></i>
          </el-upload>
        </el-form-item>
        <el-form-item label="姓名" prop="realname">
          <el-input v-model="form.realname" placeholder="请输入真实姓名"/>
        </el-form-item>
        <el-form-item label="身份证号" prop="idCard">
          <el-input v-model="form.idCard" placeholder="请输入身份证号"/>
        </el-form-item>
        <el-form-item label="手机号" prop="phone">
          <el-input v-model="form.phone" placeholder="请输入手机号"/>
        </el-form-item>
        <el-form-item label="等级" prop="level">
          <el-select v-model="form.level" placeholder="等级" clearable size="small">
            <el-option
              v-for="(dict,index) in levelDict"
              :key="index"
              :label="dict.dictValue"
              :value="dict.dictKey*1"
            />
          </el-select>
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
  import store from '@/store'
  import { levelPost, listPost, getPost, delPost, addPost, updatePost, exportPost } from '@/api/hit/card'
  import { uploadAvatar } from '@/api/hit/upload'
  import { logout } from '../../../api/login'

  export default {
    name: 'Card',
    data() {
      return {
        // 遮罩层
        loading: true,
        //头像
        imageUrl: '',
        // 选中数组
        ids: [],
        // 非单个禁用
        single: true,
        // 非多个禁用
        multiple: true,
        // 显示搜索条件
        showSearch: true,
        //日期范围
        dateRange:[],
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
        dictType: { dictType: 'userlevel' },
        // 查询参数
        queryParams: {
          pageNum: 1,
          pageSize: 10,
          userName: undefined,
          realname: undefined,
          idCard: undefined,
          phone: undefined,
          level: undefined,
          startTime: undefined,
          endTime: undefined
        },
        options: {
          img: store.getters.avatar
        },
        // 表单参数
        form: {},
        // 表单校验
        rules: {
          userName: [
            { required: true, message: '用户名不能为空', trigger: 'blur' }
          ],
          userPass: [
            { required: true, min: 3, max: 10, message: '密码不能为空且为3~10位', trigger: 'blur' }
          ],
          realname: [
            { required: true, message: '真实姓名不能为空', trigger: 'blur' }
          ],
          idCard: [
            { required: true, message: '身份证号不能为空', trigger: 'blur' }
          ],
          phone: [
            { required: true, message: '手机号码不能为空', trigger: 'blur' },
            {
              pattern: /^1[3|4|5|6|7|8|9][0-9]\d{8}$/,
              message: '请输入正确的手机号码',
              trigger: 'blur'
            }
          ],
          level: [
            { required: true, message: '等级不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    created() {
      this.reset()
      this.getLevel()
      this.getList()

    },

    methods: {

      /** 获取等级字典 */
      getLevel() {
        levelPost(this.dictType).then(response => {
          // console.log(response.data)
          this.levelDict = response.rows
        })
      },
      getLevelNick(level) {
        for (const levelName of this.levelDict) {
          // console.log(levelName.dictKey,level)
          if (levelName.dictKey == level) {
            // console.log(levelName.dictValue);
            return levelName.dictValue
          }
        }
      },

      /** 查询岗位列表 */
      getList() {
        this.loading = true
        // console.log(this.myAddDateRange(this.queryParams,this.dateRange));
        listPost(this.myAddDateRange(this.queryParams,this.dateRange,"Time")).then(response => {
          // console.log(response)
          this.postList = response.rows
          this.total = response.total
          this.loading = false
        })
      },

      // 取消按钮
      cancel() {
        this.open = false
        this.imageUrl = ""
        this.reset()
      },
      // 表单重置
      reset() {
        this.form = {
          id: undefined,
          userName: undefined,
          userPass: undefined,
          pic: undefined,
          realname: undefined,
          idCard: undefined,
          phone: undefined,
          level: undefined,
          delState: 0,
        }
        this.resetForm('form')
      },
      /** 搜索按钮操作 */
      handleQuery() {
        this.queryParams.pageNum = 1
        this.getList()
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
        this.title = '添加会员'
      },
      /** 修改按钮操作 */
      handleUpdate(row) {
        this.reset()
        const postId = row.id || this.ids
        getPost(postId).then(response => {
          if (response.data != null) {
            // console.log(response.data)
            this.form=response.data
            this.imageUrl = response.data.pic
            this.open = true
            this.title = '修改会员'
          } else {
            this.msgError('该数据不存在,无法修改!')
            this.getList()
          }
        })
      },
      // 上传预处理

      /** 提交按钮 */
      submitForm: function() {
        this.$refs['form'].validate(valid => {
          if (valid) {
            if (this.form.id != undefined) {
              this.addOrUpdate(false)
            } else {
              this.addOrUpdate(true)
            }
          }
        })
      },
      addOrUpdate(state) {

        if (state) {

          addPost(this.form).then(response => {
            this.msgSuccess('新增成功')
            this.imageUrl = ''
            this.open = false
            this.getList()
          })

        } else {
          updatePost(this.form).then(response => {
            this.msgSuccess('修改成功')
            this.open = false
            this.imageUrl = ''
            this.getList()
          })
        }

      },
      /** 删除按钮操作 */
      handleDelete(row) {
        const id = row.id || this.ids
        this.$confirm('是否确认删除岗位编号为"' + id + '"的数据项?', '警告', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(function() {
          return delPost(id)
        }).then(() => {
          this.getList()
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
      handleAvatarSuccess(data) {
        let file = data.file
        let formData = new FormData()
        formData.append('mypic', file)
        uploadAvatar(formData).then(response => {
          // console.log(response)
          this.form.pic = response.data
          this.imageUrl = response.data
        })
      },
      beforeAvatarUpload(file) {
        // console.log(file.type)
        const isImg = file.type === 'image/jpg' || file.type === 'image/jpeg' || file.type === 'image/png'
        const isLt10M = file.size / 1024 / 1024 < 10

        if (!isImg) {
          this.$message.error('上传头像图片只能是 jpg/jpeg/png 格式!')
        }
        if (!isLt10M) {
          this.$message.error('上传头像图片大小不能超过 10MB!')
        }
        return isImg && isLt10M
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
