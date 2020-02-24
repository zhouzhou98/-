package com.fly.erp.sys.vo;

import com.fly.erp.sys.domain.Dept;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class DeptVo extends Dept {
    private Integer page=1;
    private Integer limit=10;
}
