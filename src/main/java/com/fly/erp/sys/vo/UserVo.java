package com.fly.erp.sys.vo;

import com.fly.erp.sys.domain.User;
import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper = false)
public class UserVo extends User {
    private Integer page=1;
    private Integer limit=10;
}
