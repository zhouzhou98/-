package com.fly.erp.sys.web.controller;

import com.fly.erp.common.ActiverUser;
import com.fly.erp.common.ResultObj;
import com.fly.erp.common.WebUtils;
import com.fly.erp.sys.domain.Loginfo;
import com.fly.erp.sys.service.LoginfoService;
import com.fly.erp.sys.service.PermissionService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.Date;

@RestController
@RequestMapping("login")
public class LoginController {

    @Autowired

    private LoginfoService loginfoService;
    @RequestMapping("login")
    public ResultObj login(String loginname,String pwd){
        Subject subject = SecurityUtils.getSubject();
        UsernamePasswordToken token=new UsernamePasswordToken(loginname,pwd);
        try {
            subject.login(token);
            ActiverUser activerUser= (ActiverUser) subject.getPrincipal();
            WebUtils.getSession().setAttribute("user",activerUser.getUser());
            //记录登录日志
            Loginfo loginfo=new Loginfo();
            loginfo.setLoginname(activerUser.getUser().getName()+"-"+activerUser.getUser().getLoginname());
            loginfo.setLoginip(WebUtils.getRequest().getRemoteAddr());
            loginfo.setLogintime(new Date());
            loginfoService.save(loginfo);
            return ResultObj.LOGIN_SUCCESS;
        }catch (Exception e){
            e.printStackTrace();
            return  ResultObj.LOGIN_ERROR_CODE;
        }

    }
}
