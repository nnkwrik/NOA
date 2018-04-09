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

	<jsp:include page="../navbar.jsp" />

	<!-- APP MAIN ==========-->
	<main id="app-main" class="app-main">
	<div class="wrap">
		<section class="app-content">
		<div class="row">
			<%@ include file="mail_common.jsp"%>

			<div class="col-md-10">
				<div class="panel panel-default new-message">
					<form action="send_mail.action" method="post" enctype="multipart/form-data">
						<input type="hidden" name="recieverId" value="${receiver.id }">
						<input type="hidden" name="serverId" value="${activeEmp.id }">
						<div class="panel-body">
							<div class="form-group">
							<c:choose>
								<c:when test="${receiver!=null }">
									<h4>To : ${receiver.name } ( ${receiver.departmentName }<c:if test="${receiver.positionId != 0}"> ${receiver.positionName }</c:if> )  
									<a href="${basePath }search_emp" type="button" class=" btn-outline btn btn-sm btn-primary"><i class="fa fa-search"></i> 更改</a></h4>
								</c:when>
								<c:otherwise>
								<a href="${basePath }search_emp" class="btn action-panel-btn btn-default btn-block"><i
									class="fa fa-search"></i> 查找员工 </a>
								</c:otherwise>
							</c:choose>
								
							</div>
							<!-- .form-group -->

							<div class="form-group">
								<input name="title" type="text" class="form-control" placeholder="主题">
							</div>
							<!-- .form-group -->
							<div class="form-group">
								上传附件 : <input name="mail_pic" type="file">
							</div>
							<!-- .form-group -->
							<textarea name="text"
								class="form-control full-wysiwyg" placeholder="正文..."></textarea>
						</div>
						<!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								<button type="submit"  onclick="alert('发送成功')"  class="btn btn-primary">
									发送 <i class="fa fa-send"></i>
								</button>
							</div>
						</div>
						<!-- .panel-footer -->
					</form>
				</div>
				<!-- .panel -->
			</div>
			<!-- END column -->
		</div>
		<!-- .row --> </section>
		<!-- .app-content -->
	</div>
	<!-- .wrap --> </main>
	<!--========== END app main -->

	<%@ include file="../common_body.jsp"%>
</body>
</html>