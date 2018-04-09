<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<c:remove var="pageName"/>
<c:set var="pageName" value="首页" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common_head.jsp"%>
<title>首页-noa</title>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">

	<jsp:include page="../navbar.jsp" />

	<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
  <div class="wrap">
	<section class="app-content">
		<div class="row">

			
			
			<div class="col-md-12">
			
							<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">出勤状况</h4>
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					<div class="widget-body row">
						<div class="col-md-4 col-sm-4 col-sm-offset-1">
								
								
								<h3 class="widget-title text-primary">正常出勤 : <span class="pull-right  fw-500 counter" data-plugin="counterUp">${attendance[0] }</span></h3><hr>
								<h3 class="widget-title text-danger">加班天数 : <span class="pull-right  fw-500 counter" data-plugin="counterUp">${attendance[1] }</span></h3><hr>
								<h3 class="widget-title text-success">迟到早退天数 : <span class="pull-right  fw-500 counter" data-plugin="counterUp">${attendance[2] }</span></h3><hr>
								<h3 class="widget-title text-purple">缺席天数 : <span class="pull-right  fw-500 counter" data-plugin="counterUp">${attendance[3] }</span></h3><hr>
								<h3 class="widget-title">剩余天数 : <span class="pull-right  fw-500 counter" data-plugin="counterUp">${attendance[4] }</span></h3>
								
								
							
						</div>
						<div class="col-md-7 col-sm-7">
					
					
							<div data-plugin="plot" data-options="
 									[
									
										{ label: '正常', data: ${attendance[0] }, color: 'rgb(103, 157, 198)' },
										
										{ label: '加班', data: ${attendance[1] }, color: '#e64a19' },
										{ label: '迟到早退', data: ${attendance[2] }, color: '#4caf50' },
										{ label: '缺席', data: ${attendance[3] }, color: '#303f9f' },
										{ label: '', data: ${attendance[4] }, color: '#edf0f5' }
										
										
									], 
									{
										series: {
											pie: { show: true, innerRadius: .5 }
										},
										legend: { show: true },
										
										tooltip: {
											show: true,
											content: '%s %p.0%',
											defaultTheme: true
										}
									}" style="height: 300px;width: 100%;">
								</div> 
						</div><!-- .col -->
						
					</div><!-- .widget-body -->
				</div><!-- .widget -->
			</div><!-- .col -->
			

			<div class="col-md-12">
				
				<div class="widget">
					<header class="widget-header">
						<h4 class="widget-title">公告
						<c:if test="${activeEmp.positionId >=1  }">
							<!-- 组长以上才能发布 -->
							<a href="#" data-toggle="modal" data-target="#composeModal" class="btn btn-outline  btn-primary pull-right ">发布公告</a>
						</c:if>
						</h4>
						
						
					</header><!-- .widget-header -->
					<hr class="widget-separator">
					
					<div class="widget-body row">
						<!--公告-->
						<!--左边那一列-->
						<div class="col-md-6">
						
							<c:forEach items="${announceList }" var="announce" step="2" >
						<form action="delete_announce.action" method="get">			
									
									<c:choose>
										<c:when test="${announce.targetId == 0 }"><div class="panel panel-info"></c:when>
										<c:when test="${announce.targetId%10 == 0 }"><div class="panel panel-warning"></c:when>
										<c:otherwise><div class="panel panel-danger"></c:otherwise>
									</c:choose>	
								
								<input type="hidden" name="delete_id" value="${announce.id }">				
								<div class="panel-heading">
									<h4 class="panel-title">${announce.targetName}员工 : ${ announce.title}
									<p class="pull-right "><fmt:formatDate value="${announce.time }" pattern="MM-dd HH:mm"/>
									(BY: ${announce.auther.name  })	
 									<shiro:hasPermission name="announce:delete">
 										<!-- 有权限可删除 -->
 										<button type="submit" onclick="alert('删除成功');" class="m-b-xs btn btn-outline btn-defalt"><i class="fa fa-trash"></i></button>
 									</shiro:hasPermission>
 									<shiro:lacksPermission name="announce:delete">
	 									<!-- 本人可删除 -->
										<c:if test="${announce.auther.id == activeEmp.id }">
											<button type="submit" onclick="alert('删除成功');" class="m-b-xs btn btn-outline btn-defalt"><i class="fa fa-trash"></i></button>
										</c:if>
 									</shiro:lacksPermission>

									</p></h4>
								</div>
								
								
								<div class="panel-body">
									<p>${announce.text }</p>
								</div>
							</div>
							</form>
							</c:forEach>
							
						</div><!-- end左边那一列-->
						
						<!--右边那一列-->
						<div class="col-md-6">
							<c:forEach items="${announceList }" var="announce" begin="1" step="2" >
								<form action="delete_announce.action" method="get">			
									
									<c:choose>
										<c:when test="${announce.targetId == 0 }"><div class="panel panel-info"></c:when>
										<c:when test="${announce.targetId%10 == 0 }"><div class="panel panel-warning"></c:when>
										<c:otherwise><div class="panel panel-danger"></c:otherwise>
									</c:choose>	
								
								<input type="hidden" name="delete_id" value="${announce.id }">				
								<div class="panel-heading">
									<h4 class="panel-title">${announce.targetName}员工 : ${ announce.title}
										
									<p class="pull-right "><fmt:formatDate value="${announce.time }" pattern="MM-dd HH:mm"/>
									(BY: ${announce.auther.name  })	
									 <shiro:hasPermission name="announce:delete">
 										<!-- 有权限可删除 -->
 										<button type="submit" onclick="alert('删除成功');" class="m-b-xs btn btn-outline btn-defalt"><i class="fa fa-trash"></i></button>
 									</shiro:hasPermission>
 									<shiro:lacksPermission name="announce:delete">
	 									<!-- 本人可删除 -->
										<c:if test="${announce.auther.id == activeEmp.id }">
											<button type="submit" onclick="alert('删除成功');" class="m-b-xs btn btn-outline btn-defalt"><i class="fa fa-trash"></i></button>
										</c:if>
 									</shiro:lacksPermission>
									
									</p></h4>
									
								</div>
								
								
								<div class="panel-body">
									<p>${announce.text }</p>
								</div>
							</div>
							</form>
							</c:forEach>
						
					</div><!-- .widget-body -->
					
				</div><!-- .widget -->
				
			</div><!-- END column -->

			
		</div><!-- END row -->
	</section><!-- #dash-content -->
</div><!-- .wrap -->


<!-- Compose modal -->
<div class="modal fade" id="composeModal" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">新公告</h4>
			</div>
			<form action="announce.action" method="post">
			<div class="modal-body">
				
						
						<div class="form-group">
						
							<label for="select">对象部门</label>
							<select name=targetId id="select" class="form-control">
								<c:forEach items="${departmentList }" var="department">
									<option value="${department.departmentId }">${department.departmentName }</option>
								</c:forEach>
							</select>

						</div><!-- .form-group -->

					<div class="form-group">
						<input name="title" id="mail_subject_field" type="text" class="form-control" placeholder="主题">
					</div>
					<textarea name="text" id="mail_body_field" cols="30" rows="5" class="form-control" placeholder="正文.."></textarea>
				
			</div>
			<div class="modal-footer">
				<button type="submit"  class="btn btn-primary">发布 <i class="fa fa-send"></i></button>
			</div>
			</form>
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->
</main>
	<!--========== END app main -->

	<%@ include file="../common_body.jsp"%>
</body>
</html>