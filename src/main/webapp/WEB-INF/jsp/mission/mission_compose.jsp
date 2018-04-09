<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:remove var="pageName"/>
<c:set var="pageName" value="任务" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common_head.jsp"%>
<title>任务-noa</title>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">

	<jsp:include page="../navbar.jsp" />

	<!-- APP MAIN ==========-->
	<main id="app-main" class="app-main">
	<div class="wrap">
		<section class="app-content">
		<div class="row">
			<%@ include file="mission_common.jsp"%>

						<div class="col-md-10">
				<div class="panel panel-default new-message">						
					<form action="post_mission.action" method="post"enctype="multipart/form-data">
						<div class="panel-body">
							<div class="form-group">

								
								<label for="select2-demo-1" class="col-xs-1 control-label">对象部门 : </label>
								<div class="col-sm-7">
									<select name="targetId" class="form-control" data-plugin="select2">
										<c:forEach items="${departmentList }" var="department">
											<option value="${department.departmentId }">${department.departmentName }</option>
										</c:forEach>
									</select>
								</div><!-- END column -->
								<div >
									<label for="touchspin-demo-5" class="col-xs-1 control-label">当前进度 : </label>
									<input name="progress" id="touchspin-demo-5" type="text" data-plugin="TouchSpin" data-options="{ verticalbuttons: true, initval: 0, postfix: '%',buttondown_class: 'btn btn-info', buttonup_class: 'btn btn-info' }">
								</div>
									
							</div><!-- .form-group -->
							<div class="form-group">
								<input name="title" type="text" class="form-control" placeholder="主题">
							</div><!-- .form-group -->
							<div class="form-group form-control">
									<label for="touchspin-demo-5" class="col-xs-1 control-label">上传附件 : </label>
									 <input name="mission_pic" id="file-upload form-control"  type="file">
							</div><!-- .form-group -->
							<textarea name="text" class="form-control full-wysiwyg" placeholder="正文..."></textarea>
						</div><!-- .panel-body -->

						<div class="panel-footer clearfix">
							<div class="pull-right">
								<button type="submit" class="btn btn-primary">布置任务 <i class="fa fa-send"></i></button>
							</div>
						</div><!-- .panel-footer -->
					</form>
				</div><!-- .panel -->
			</div><!-- END column -->
		</div>
		<!-- .row --> </section>
		<!-- .app-content -->
	</div>
	<!-- .wrap --> </main>
	<!--========== END app main -->

	<%@ include file="../common_body.jsp"%>
</body>
</html>