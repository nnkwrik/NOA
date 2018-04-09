<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./misc_head.jsp"%>
<title>登录-noa</title>
</head>
<body class="simple-page">

	<div class="simple-page-wrap">
		<div class="simple-page-logo ">
			<a href="#">
				<span><i class="fa fa-gg"></i></span>
				<span>NOA</span>
			</a>
		</div><!-- logo -->
		<div class="simple-page-form  " id="login-form">
	<h4 class="form-title m-b-xl text-center">请输入用户名和密码</h4>
	<form action="login" method="post">
		<div class="form-group">
			<input type="text" name="username" class="form-control" placeholder="用户名" value="${employee.username}">
		</div>

		<div class="form-group">
			<input type="password" name="password" class="form-control" placeholder="密码" >
		</div>

		<div class="form-group m-b-xl">
			<div class="checkbox checkbox-primary">
				<input name="remenberme" value="remenberme" type="checkbox" id="keep_me_logged_in"/>
				<label for="keep_me_logged_in">记住我</label>
			</div>
		</div>

		<c:if test="${message != null}">
			<div class="form-group">
				<p class="text-danger"><i class="fa fa-warning"></i>  ${message}</p>
			</div>
		</c:if>
		<input type="submit" class="btn btn-primary" value="登录 !">
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p>
		<small>新员工 ?</small>
		<a href="signup">创建账号</a>
	</p>
</div><!-- .simple-page-footer -->


	</div><!-- .simple-page-wrap -->
</body>
</html>