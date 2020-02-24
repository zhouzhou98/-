package com.fly.erp.sys.service.impl;

import com.fly.erp.sys.domain.Loginfo;
import com.fly.erp.sys.mapper.LoginfoMapper;
import com.fly.erp.sys.service.LoginfoService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-18
 */
@Service
@Transactional
public class LoginfoServiceImpl extends ServiceImpl<LoginfoMapper, Loginfo> implements LoginfoService {

}
