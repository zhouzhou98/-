package com.fly.erp.sys.service;

import com.fly.erp.sys.domain.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-17
 */
public interface UserService extends IService<User> {
    /**
     * 保存用户和角色之间的关系
     * @param uid
     * @param ids
     */
    void saveUserRole(Integer uid, Integer[] ids);
}
