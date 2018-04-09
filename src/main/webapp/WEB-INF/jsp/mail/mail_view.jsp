<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tag.jsp" %>
<c:remove var="pageName"/>
<c:set var="pageName" value="邮件" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common_head.jsp"%>
<title>邮件-noa</title>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">

<jsp:include page="../navbar.jsp"/>

<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
  <div class="wrap">
	<section class="app-content">
		<div class="row">
		<%@ include file="mail_common.jsp"%>

			<div class="col-md-10">

				<div class="mail-view">
					<h3 class="m-0">${mail.title }</h3>
					<div class="divid"></div>
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-lg avatar-circle">
								<!-- 头像 -->
								<img class="img-responsive" src="/pic/employee/${mail.otherside.pic }" alt="avatar"/>
								
							</div><!-- .avatar -->
						</div>

						<div class="media-body">
							<div class="m-b-sm">
								<h4 class="m-0 inline-block m-r-lg">
									<a href="#" class="title-color">${mail.otherside.name }</a>
								</h4>
							</div>
							<!-- 部门名,职位 -->
							
							<p>${mail.otherside.departmentName }<c:if test="${mail.otherside.positionId != null && mail.otherside.positionId != 0}"> ${mail.otherside.positionName}</c:if></p>
						</div>
					</div>
					<div class="divid"></div>

					<div class="row">
						<div class="col-md-12">
							<div class="m-h-lg lh-xl">
								<!-- 文字内容 -->
								<p><c:if test="${mail.text != null}">${mail.text }</c:if></p>
								<!-- 图片附件 -->
								<p><c:if test="${mail.pic != null}"><img src="/pic/mail/${mail.pic }" width="300" height="300"></c:if></p>
							</div>
						</div>
					</div>
				</div>
				
				<!-- 回复框 , 不是显示自己发送的邮件时显示-->
				<c:if test="${isSend == false }">
				<div class="row">
					<div class="col-md-12">
						<div class="panel panel-default new-message">
							<!-- 应该要个弹框..提交处理后重定向到mail?view=all -->
							<form action="send_mail.action" method="post">
								<input type="hidden" name="recieverId" value="${mail.otherside.id }">
								<input type="hidden" name="serverId" value="${activeEmp.id }">
								<div class="panel-heading">
									<input type="text" name="title" value="Re : ${mail.title }">
								</div>								
								<div class="panel-body p-0">
									<textarea name="text" id="new-message-body" placeholder="正文.."></textarea>
								</div>
								<!-- TODO : 传附件 -->
								<div class="panel-footer pull-right">
	
									<button type="submit" onclick="alert('发送成功')" class="btn btn-success">回复 <i class="fa fa-mail-forward"></i></button>
	
								</div>
							</form>
						</div>
					</div>
				</div><!-- end 回复框 -->
				</c:if>
				
			</div><!-- END column -->
		</div><!-- .row -->		
	</section><!-- .app-content -->
</div><!-- .wrap -->
</main>
<!--========== END app main -->

<%@ include file="../common_body.jsp"%>
</body>
</html>