package com.fly.erp.sys.service;

import com.fly.erp.sys.domain.Role;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-19
 */
public interface RoleService extends IService<Role> {

    List<Integer> queryRolePermissionIdsByRid(Integer roleId);

    void saveRolePermission(Integer rid, Integer[] ids);

    List<Integer> queryUserRoleIdsByUid(Integer id);
}
