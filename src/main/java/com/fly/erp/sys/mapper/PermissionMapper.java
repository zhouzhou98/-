package com.fly.erp.sys.mapper;

import com.fly.erp.sys.domain.Permission;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;

import java.io.Serializable;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-17
 */
public interface PermissionMapper extends BaseMapper<Permission> {
    /**
     *  //根据权限或菜单ID删除权限表各和角色的关系表里面的数据
     * @param id
     */
    void deleteRolePermissionByPid(Serializable id);
}
