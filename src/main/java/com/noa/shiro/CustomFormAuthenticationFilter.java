package com.noa.shiro;

import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.apache.shiro.web.filter.authc.FormAuthenticationFilter;
import org.apache.shiro.web.util.WebUtils;

public class CustomFormAuthenticationFilter extends FormAuthenticationFilter {
	// 自定义表单认证成功后的页面跳转
	@Override
	protected void issueSuccessRedirect(ServletRequest request, ServletResponse response) throws Exception {

		WebUtils.issueRedirect(request, response, "/home", null, true);
	}

}
