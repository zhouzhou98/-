package com.fly.erp.sys.web.controller;


import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fly.erp.common.DataGridView;
import com.fly.erp.common.ResultObj;
import com.fly.erp.sys.domain.Loginfo;
import com.fly.erp.sys.service.LoginfoService;
import com.fly.erp.sys.vo.LoginfoVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-18
 */
@RestController
@RequestMapping("loginfo")
public class LoginfoController {
    @Autowired
    private LoginfoService loginfoService;
    /**
     * 全查询
     */
    @RequestMapping("loadAllLoginfo")
    public DataGridView loadAllLoginfo(LoginfoVo loginfoVo){
        IPage<Loginfo> page=new Page<>(loginfoVo.getPage(),loginfoVo.getLimit());
        QueryWrapper<Loginfo>wrapper=new QueryWrapper<>();
        wrapper.like(StringUtils.isNotBlank(loginfoVo.getLoginname()),"loginname",loginfoVo.getLoginname());
        wrapper.like(StringUtils.isNotBlank(loginfoVo.getLoginip()),"loginip",loginfoVo.getLoginip());
        wrapper.ge(loginfoVo.getStartTime()!=null,"logintime",loginfoVo.getStartTime());
        wrapper.le(loginfoVo.getEndTime()!=null,"logintime",loginfoVo.getEndTime());
        wrapper.orderByDesc("logintime");
        this.loginfoService.page(page,wrapper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }

    /**
     * 删除
     */
    @RequestMapping("deleteLoginfo")
    public ResultObj deleteLoginfo(Integer id){
        try {
            this.loginfoService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除
     */
    @RequestMapping("BatchDeleteLoginfo")
    public ResultObj BatchDeleteLoginfo(LoginfoVo loginfoVo){
        try {
//            System.out.println(loginfoVo.getIds().length+"    "+111111);
            this.loginfoService.removeByIds(Arrays.asList(loginfoVo.getIds()));

            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}

