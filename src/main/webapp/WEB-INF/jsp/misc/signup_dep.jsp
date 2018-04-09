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
	<h4 class="form-title m-b-xl text-center">完善性息</h4>
	<form action="formal_signup" method="post">
		<input type="hidden" name="username" value="${employee.username}">
		<input type="hidden" name="password" value="${employee.password}">
		<input type="hidden" name="name" value="${employee.name}">
		<input type="hidden" name="sex" value="${employee.sex}">
		<input type="hidden" name="pic" value="${employee.pic}">
		<input type="hidden" name="positionId" value="${employee.positionId}">


		<!-- 部门 -->
		<div class="form-group">
				<lable for="select" >部门</option>
				<select id="select" name="departmentId" class="form-control" data-plugin="select2">
					
					<c:forEach items="${departmentList }" var="department">
						<option value="${department.departmentId }">${department.departmentName }</option>
					</c:forEach>
				</select>

		</div>

		
		<div class="form-group">
 			<c:if test="${message != null}">
				<div class="form-group">
					<p class="text-danger"><i class="fa fa-warning"></i>  ${message}</p>
				</div>
			</c:if>

		</div>

		<input type="submit" class="btn btn-primary" value="正式注册 ! ">
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