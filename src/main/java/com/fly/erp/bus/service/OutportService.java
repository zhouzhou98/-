package com.fly.erp.bus.service;

import com.fly.erp.bus.domain.Outport;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-24
 */
public interface OutportService extends IService<Outport> {
    /**
     * 退货
     * @param id  进货单ID
     * @param number  退货数量
     * @param remark  备注
     */
    void addOutPort(Integer id, Integer number, String remark);
}
