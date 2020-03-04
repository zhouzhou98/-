package com.fly.erp.bus.service.impl;

import com.fly.erp.bus.domain.Provider;
import com.fly.erp.bus.mapper.ProviderMapper;
import com.fly.erp.bus.service.ProviderService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.BeanUtils;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import java.io.Serializable;
import java.util.Collection;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-23
 */
@Service
public class ProviderServiceImpl extends ServiceImpl<ProviderMapper, Provider> implements ProviderService {


    @Override
    @CacheEvict(cacheNames = "provider",key = "#id")
    public boolean removeById(Serializable id) {
        return super.removeById(id);
    }


    @Override
    public boolean removeByIds(Collection<? extends Serializable> idList) {
        return super.removeByIds(idList);
    }

    @Override
    @CachePut(cacheNames = "provider",key = "#result.id")
    public Provider saveProvider(Provider entity) {
        Provider provider=new Provider();
        super.save(entity);
        BeanUtils.copyProperties(entity,provider);
        return provider;
    }

    @Override
    @CachePut(cacheNames = "provider",key = "#entity.id")
    public Provider updateProviderById(Provider entity) {
        Provider provider=new Provider();
        super.updateById(entity);
        BeanUtils.copyProperties(entity,provider);
        return provider;
    }

    @Override
    @Cacheable(cacheNames = "provider",key = "#id")
    public Provider getProviderById(Serializable id) {
        return null;
    }


    @Override
    @Cacheable(cacheNames = "provider",key = "#id")
    public Provider getById(Serializable id) {
        return super.getById(id);
    }
}
