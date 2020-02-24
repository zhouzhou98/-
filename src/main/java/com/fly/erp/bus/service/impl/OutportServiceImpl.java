package com.fly.erp.bus.service.impl;

import com.fly.erp.bus.domain.Goods;
import com.fly.erp.bus.domain.Inport;
import com.fly.erp.bus.domain.Outport;
import com.fly.erp.bus.mapper.GoodsMapper;
import com.fly.erp.bus.mapper.InportMapper;
import com.fly.erp.bus.mapper.OutportMapper;
import com.fly.erp.bus.service.OutportService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.fly.erp.common.WebUtils;
import com.fly.erp.sys.domain.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-24
 */
@Service
public class OutportServiceImpl extends ServiceImpl<OutportMapper, Outport> implements OutportService {
    @Autowired
    private InportMapper inportMapper;

    @Autowired
    private GoodsMapper goodsMapper;

    @Override
    public void addOutPort(Integer id, Integer number, String remark) {
        //1,根据进货单ID查询进货单信息
        Inport inport = this.inportMapper.selectById(id);
        //2,根据商品ID查询商品信息
        Goods goods = this.goodsMapper.selectById(inport.getGoodsid());
        goods.setNumber(goods.getNumber()-number);
        this.goodsMapper.updateById(goods);
        //3,添加退货单信息
        Outport entity=new Outport();
        entity.setGoodsid(inport.getGoodsid());
        entity.setNumber(number);
        User user=(User) WebUtils.getSession().getAttribute("user");
        entity.setOperateperson(user.getName());
        entity.setOutportprice(inport.getInportprice());
        entity.setOutputtime(new Date());
        entity.setPaytype(inport.getPaytype());
        entity.setProviderid(inport.getProviderid());
        entity.setRemark(remark);
        this.getBaseMapper().insert(entity);
    }
}
