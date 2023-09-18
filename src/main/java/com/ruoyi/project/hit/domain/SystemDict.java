package com.ruoyi.project.hit.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

/**
 * 
 * @TableName system_dict
 */
@TableName(value ="system_dict")
@Data
public class SystemDict implements Serializable {
    /**
     * 自动增长
     */
    @TableId(type = IdType.AUTO)
    private Integer id;

    /**
     * 类型
     */
    private String dictType;

    /**
     * 数据的标识
     */
    private String dictKey;

    /**
     * 数据
     */
    private String dictValue;

    /**
     * 状态0:正常 1:删除
     */
    private Short delState;

    /**
     * 
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date createTime;

    /**
     * 
     */
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date updateTime;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        SystemDict other = (SystemDict) that;
        return (this.getId() == null ? other.getId() == null : this.getId().equals(other.getId()))
            && (this.getDictType() == null ? other.getDictType() == null : this.getDictType().equals(other.getDictType()))
            && (this.getDictKey() == null ? other.getDictKey() == null : this.getDictKey().equals(other.getDictKey()))
            && (this.getDictValue() == null ? other.getDictValue() == null : this.getDictValue().equals(other.getDictValue()))
            && (this.getDelState() == null ? other.getDelState() == null : this.getDelState().equals(other.getDelState()))
            && (this.getCreateTime() == null ? other.getCreateTime() == null : this.getCreateTime().equals(other.getCreateTime()))
            && (this.getUpdateTime() == null ? other.getUpdateTime() == null : this.getUpdateTime().equals(other.getUpdateTime()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getId() == null) ? 0 : getId().hashCode());
        result = prime * result + ((getDictType() == null) ? 0 : getDictType().hashCode());
        result = prime * result + ((getDictKey() == null) ? 0 : getDictKey().hashCode());
        result = prime * result + ((getDictValue() == null) ? 0 : getDictValue().hashCode());
        result = prime * result + ((getDelState() == null) ? 0 : getDelState().hashCode());
        result = prime * result + ((getCreateTime() == null) ? 0 : getCreateTime().hashCode());
        result = prime * result + ((getUpdateTime() == null) ? 0 : getUpdateTime().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", dictType=").append(dictType);
        sb.append(", dictKey=").append(dictKey);
        sb.append(", dictValue=").append(dictValue);
        sb.append(", delState=").append(delState);
        sb.append(", createTime=").append(createTime);
        sb.append(", updateTime=").append(updateTime);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    public String getLevelName() {
        return dictValue;
    }

//    public void setCreateBy(String username) {
//        this.createBy = createBy;
//    }
}