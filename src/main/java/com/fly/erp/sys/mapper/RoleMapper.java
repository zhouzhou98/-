package com.fly.erp.sys.mapper;

import com.fly.erp.sys.domain.Role;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Param;

import java.io.Serializable;
import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-19
 */
public interface RoleMapper extends BaseMapper<Role> {

    void deleteRolePermissionByRid(Serializable id);

    void deleteRoleUserByRid(Serializable id);

    List<Integer> queryRolePermissionIdsByRid(Integer roleId);

    void saveRolePermission(@Param("rid") Integer rid,@Param("pid") Integer pid);

    void deleteRoleUserByUid(Serializable id);

    void insertUserRole(@Param("uid") Integer uid,@Param("rid") Integer rid);

    List<Integer> queryUserRoleIdsByUid(Integer id);
}
