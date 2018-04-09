<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="./misc_head.jsp"%>
<title>注册-noa</title>
</head>
<body class="simple-page">

	<div class="simple-page-wrap">
		<div class="simple-page-logo">
			<a href="#">
				<span><i class="fa fa-gg"></i></span>
				<span>NOA</span>
			</a>
		</div><!-- logo -->
		
<div class="simple-page-form" id="signup-form">
	<h4 class="form-title m-b-xl text-center">创建新账号</h4>
	<form action="signup" method="post">
		<div class="form-group">
			<input id="sign-up-name" name="username" type="text" class="form-control" placeholder="用户名" value="${employee.username}">
		</div>


		<div class="form-group">
			<input id="sign-up-password" name="password" type="password" class="form-control" placeholder="密码">
		</div>

		<c:if test="${message != null}">
			<div class="form-group">
				<p class="text-danger"><i class="fa fa-warning"></i>  ${message}</p>
			</div>
		</c:if>



		<input type="submit" class="btn btn-primary" value="去完善个人信息 ! ">
	</form>
</div><!-- #login-form -->

<div class="simple-page-footer">
	<p>
		<small>老员工误入 ?</small>
		<a href="login">去登录</a>
	</p>
</div><!-- .simple-page-footer -->


	</div><!-- .simple-page-wrap -->
</body>
</html>