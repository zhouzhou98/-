package com.fly.erp.bus.service.impl;

import com.fly.erp.bus.domain.Goods;
import com.fly.erp.bus.mapper.GoodsMapper;
import com.fly.erp.bus.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import java.io.Serializable;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-23
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {

    @Override
    public boolean save(Goods entity) {
        // TODO Auto-generated method stub
        return super.save(entity);
    }

    @Override
    public boolean updateById(Goods entity) {
        // TODO Auto-generated method stub
        return super.updateById(entity);
    }

    @Override
    public boolean removeById(Serializable id) {
        // TODO Auto-generated method stub
        return super.removeById(id);
    }

    @Override
    public Goods getById(Serializable id) {
        // TODO Auto-generated method stub
        return super.getById(id);
    }
}
