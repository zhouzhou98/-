package com.fly.erp.sys.service.impl;

import com.fly.erp.sys.domain.Permission;
import com.fly.erp.sys.mapper.PermissionMapper;
import com.fly.erp.sys.service.PermissionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.io.Serializable;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-17
 */
@Service
@Transactional
public class PermissionServiceImpl extends ServiceImpl<PermissionMapper, Permission> implements PermissionService {
    @Override
    public boolean removeById(Serializable id) {
        ////根据权限或菜单ID删除权限表各和角色的关系表里面的数据
        PermissionMapper permissionMapper = this.getBaseMapper();

        permissionMapper.deleteRolePermissionByPid(id);
        return super.removeById(id);
    }
}
