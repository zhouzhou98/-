package com.fly.erp.sys.vo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fly.erp.sys.domain.Permission;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-17
 */
@Data
@EqualsAndHashCode(callSuper = false)

public class PermissionVo extends Permission {
    private Integer page=1;
    private Integer limit=10;
}
