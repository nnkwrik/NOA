package com.noa.shiro;

import java.util.List;

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

import com.noa.po.Employee;
import com.noa.po.EmployeeCustom;
import com.noa.service.EmployeeService;
import com.noa.service.SysService;

public class CustomRealm extends AuthorizingRealm {

	@Autowired
	EmployeeService employeeService;

	@Autowired
	SysService sysService;

	@Override
	public void setName(String name) {
		super.setName("customRealm");
	}

	@Override // 认证, 认证失败返回null,
	protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {

		// 取出身份信息
		String username = (String) token.getPrincipal();
		Employee authenticateInfo = null;
		try {
			authenticateInfo = employeeService.findAccountByUsername(username);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 不存在该username的account时,返回null
		if (authenticateInfo == null) {
			return null;
		}

		EmployeeCustom activeEmp = null;
		try {
			activeEmp = employeeService.findEmployeeById(authenticateInfo.getId());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		// 存在用户时返回SimpleAuthenticationInfo

		SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(activeEmp,
				authenticateInfo.getPassword(), ByteSource.Util.bytes(authenticateInfo.getSalt()), this.getName());

		// 接下来由authenticator通过 散列算法(xml中设置) 和盐(第三个参数)和输入的password(token中)
		// 与正确的密码匹配(第二个参数)
		return simpleAuthenticationInfo;
	}

	@Override // 授权
	protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {

		EmployeeCustom activeEmp = (EmployeeCustom) principals.getPrimaryPrincipal();
		List<String> permissionList = null;
		try {
			permissionList = sysService.getPermissionByEmpId(activeEmp.getId());
		} catch (Exception e) {
			e.printStackTrace();
		}

		SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
		simpleAuthorizationInfo.addStringPermissions(permissionList);

		return simpleAuthorizationInfo;
	}

}
