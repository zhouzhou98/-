package com.fly.erp.sys.web.controller;


import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.fly.erp.common.DataGridView;
import com.fly.erp.common.ResultObj;
import com.fly.erp.common.WebUtils;
import com.fly.erp.sys.domain.Notice;
import com.fly.erp.sys.domain.User;
import com.fly.erp.sys.service.NoticeService;
import com.fly.erp.sys.vo.LoginfoVo;
import com.fly.erp.sys.vo.NoticeVo;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;

import org.springframework.web.bind.annotation.RestController;

import java.util.Arrays;
import java.util.Date;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author zhouzhou
 * @since 2020-02-18
 */
@RestController
@RequestMapping("notice")
public class NoticeController {
    @Autowired
    private NoticeService noticeService;
    /**
     *
     */
    @RequestMapping("loadAllNotice")
    public DataGridView loadAllNotice(NoticeVo noticeVo){
        IPage<Notice> page=new Page<>(noticeVo.getPage(),noticeVo.getLimit());
        QueryWrapper<Notice> wrapper=new QueryWrapper<>();
        wrapper.like(StringUtils.isNotBlank(noticeVo.getTitle()), "title", noticeVo.getTitle());
        wrapper.like(StringUtils.isNotBlank(noticeVo.getOpername()), "opername", noticeVo.getOpername());
        wrapper.ge(noticeVo.getStartTime()!=null, "createtime", noticeVo.getStartTime());
        wrapper.le(noticeVo.getEndTime()!=null, "createtime", noticeVo.getEndTime());
        wrapper.orderByDesc("createtime");
        noticeService.page(page,wrapper);
        return new DataGridView(page.getTotal(),page.getRecords());
    }


    /**
     * 添加
     * @param id
     * @return
     */
    @RequestMapping("addNotice")
    public ResultObj addNotice(NoticeVo noticeVo){
        try {
            noticeVo.setCreatetime(new Date());
            User user= (User) WebUtils.getSession().getAttribute("user");
            noticeVo.setOpername(user.getName());
            this.noticeService.save(noticeVo);
            return ResultObj.ADD_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.ADD_ERROR;
        }
    }


    /**
     * 更新
     * @param notice
     * @return
     */
    @RequestMapping("updateNotice")
    public ResultObj updateNotice(NoticeVo noticeVo){
        try {

            this.noticeService.updateById(noticeVo);
            return ResultObj.UPDATE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.UPDATE_ERROR;
        }
    }




    /**
     * 删除
     */
    @RequestMapping("deleteNotice")
    public ResultObj deleteLoginfo(Integer id){
        try {
            this.noticeService.removeById(id);
            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }

    /**
     * 批量删除
     */
    @RequestMapping("batchDeleteNotice")
    public ResultObj BatchDeleteLoginfo(NoticeVo noticeVo){
        try {
//            System.out.println(loginfoVo.getIds().length+"    "+111111);
            this.noticeService.removeByIds(Arrays.asList(noticeVo.getIds()));

            return ResultObj.DELETE_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return ResultObj.DELETE_ERROR;
        }
    }
}

