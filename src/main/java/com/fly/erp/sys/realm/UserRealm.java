package com.fly.erp.sys.realm;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.fly.erp.common.ActiverUser;
import com.fly.erp.common.Constast;
import com.fly.erp.sys.domain.Permission;
import com.fly.erp.sys.domain.User;
import com.fly.erp.sys.service.PermissionService;
import com.fly.erp.sys.service.RoleService;
import com.fly.erp.sys.service.UserService;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

public class UserRealm extends AuthorizingRealm {
    @Autowired
    @Lazy
    private UserService userService;
    @Autowired
    @Lazy
    private PermissionService permissionService;
    @Autowired
    @Lazy
    private RoleService roleService;
    @Override
    public String getName() {
        return "UserRealm";
    }

    //授权
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        SimpleAuthorizationInfo info=new SimpleAuthorizationInfo();
        ActiverUser activerUser= (ActiverUser) principalCollection.getPrimaryPrincipal();
        List<String>permissions=activerUser.getPermissions();
        User user=activerUser.getUser();
        if(user.getType()==Constast.USER_TYPE_SUPER){
            info.addStringPermission("*:*");
        }else{
            if(permissions!=null&&permissions.size()>0){
                info.addStringPermissions(permissions);
            }

        }
        return info;
    }

    //认证
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        //获取用户
        QueryWrapper<User> wrapper=new QueryWrapper<>();
        wrapper.eq("loginname",authenticationToken.getPrincipal().toString());
        User user = userService.getOne(wrapper);

        if(user!=null){
            ActiverUser activerUser=new ActiverUser();
            activerUser.setUser(user);
            //根据用户id查询percode
            //查询所有菜单
            QueryWrapper<Permission> qw=new QueryWrapper<>();
            //设置只能查询菜单
            qw.eq("type", Constast.TYPE_PERMISSION);
            qw.eq("available", Constast.AVAILABLE_TRUE);
//根据用户ID+角色+权限去查询
            Integer userId=user.getId();
            //根据用户ID查询角色
            List<Integer> currentUserRoleIds = roleService.queryUserRoleIdsByUid(userId);
            //根据角色ID取到权限和菜单ID
            Set<Integer> pids=new HashSet<>();
            for (Integer rid : currentUserRoleIds) {
                List<Integer> permissionIds = roleService.queryRolePermissionIdsByRid(rid);
                pids.addAll(permissionIds);
            }
            List<Permission> list=new ArrayList<>();
            //根据角色ID查询权限
            if(pids.size()>0) {
                qw.in("id", pids);
                list=permissionService.list(qw);
            }
            List<String> percodes=new ArrayList<>();
            for (Permission permission : list) {
                percodes.add(permission.getPercode());
            }
            //放到
            activerUser.setPermissions(percodes);
            ByteSource crendentialsSalt=ByteSource.Util.bytes(user.getSalt());
            SimpleAuthenticationInfo  info=new SimpleAuthenticationInfo(activerUser,user.getPwd(),crendentialsSalt,getName());
            return  info;
        }
        return null;
    }
}
