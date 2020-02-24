package com.fly.erp.sys.domain;

import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import java.time.LocalDateTime;
import java.io.Serializable;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-18
 */
@Data
@EqualsAndHashCode(callSuper = false)
@Accessors(chain = true)
@TableName("sys_dept")
public class Dept implements Serializable {

    private static final long serialVersionUID=1L;

    /**
     * 部门编号
     */
    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    /**
     * 父级部门编号
     */
    private Integer pid;

    private String title;

    private Integer open;

    /**
     * 备注
     */
    private String remark;

    /**
     * 地址
     */
    private String address;

    /**
     * 状态【0不可用，1可用】
     */
    private Integer available;

    /**
     * 排序码
     */
    private Integer ordernum;

    private Date createtime;


}
