package com.fly.erp.bus.service;

import com.fly.erp.bus.domain.Provider;
import com.baomidou.mybatisplus.extension.service.IService;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;

import java.io.Serializable;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-23
 */
public interface ProviderService extends IService<Provider> {
//    @Override
//    @CachePut(cacheNames="com.fly.erp.bus.service.impl.ProviderServiceImpl",key = "#result.id")
    public Provider saveProvider(Provider entity);
//    @Override
//    @CachePut(cacheNames="com.fly.erp.bus.service.impl.ProviderServiceImpl",key = "#entity.id")
    public Provider updateProviderById(Provider entity);


//    @Override
//    @Cacheable(cacheNames="com.fly.erp.bus.service.impl.ProviderServiceImpl",key = "#result.id")
    public Provider getProviderById(Serializable id);

}
