package com.fly.erp.sys.vo;

import com.fly.erp.sys.domain.Role;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class RoleVo extends Role {
    private Integer page=1;
    private Integer limit=10;
}
