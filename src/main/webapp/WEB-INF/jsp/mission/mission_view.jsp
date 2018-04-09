<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>
<c:remove var="pageName"/>
<c:set var="pageName" value="任务" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common_head.jsp"%>
<title>任务-noa</title>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary">

<jsp:include page="../navbar.jsp"/>

<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
  <div class="wrap">
	<section class="app-content">
		<div class="row">
		<%@ include file="mission_common.jsp"%>

			<div class="col-md-10">
		<c:set var="missionInfo" value="${mission.missionDetail }"></c:set>
				<div class="mail-view">
					<form action="delete_mission.action" method="get">
					<input type="hidden" name="delete_id" value="${missionInfo.id }">
					<h3 class="m-0">${missionInfo.title }

						<shiro:hasPermission name="mission:delete">
							<!-- 有权限可删除 -->
							<button type="submit" onclick="alert('成功删除任务');" class="btn btn-outline btn-info pull-right">删除该任务</button>
						</shiro:hasPermission>
						<shiro:lacksPermission name="announce:delete">
							<!-- 本人可删除 -->
						<c:if test="${missionInfo.auther.id == activeEmp.id }">
							<button type="submit" onclick="alert('成功删除任务');" class="btn btn-outline btn-info pull-right">删除该任务</button>
						</c:if>
						</shiro:lacksPermission>
					</h3>
					</form>
					<div class="divid"></div>
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-lg avatar-circle">
								<img class="img-responsive" src="/pic/employee/${missionInfo.auther.pic }" alt="avatar"/>
							
							</div><!-- .avatar -->
						</div>

						<div class="media-body">
							<div class="m-b-sm">
								<h4 class="m-0 inline-block m-r-lg">
									<p class="title-color">${missionInfo.auther.name }</>
								</h4>
								
							</div>
							<p>${missionInfo.auther.departmentName }
								<c:if test="${missionInfo.auther.positionId != 0}"> ${missionInfo.auther.positionName }</c:if>
							</p>

						</div>
						<div class="media-body">
							<div class="progress">
								
								
								<c:choose>
								<c:when test="${missionInfo.targetId == 0 }">
								<div class="progress-bar progress-bar-info"
											role="progressbar" aria-valuenow="${missionInfo.progress }" aria-valuemin="0"
											aria-valuemax="100" style="width: ${missionInfo.progress }%;">
											
										</div></c:when>
									<c:when test="${missionInfo.targetId % 10 == 0 }"><div class="progress-bar progress-bar-warning"
											role="progressbar" aria-valuenow="${missionInfo.progress }" aria-valuemin="0"
											aria-valuemax="100" style="width: ${missionInfo.progress }%;">
											
										</div></c:when>
									<c:when test="${missionInfo.targetId % 10 != 0 }"><div class="progress-bar progress-bar-danger"
											role="progressbar" aria-valuenow="${missionInfo.progress }" aria-valuemin="0"
											aria-valuemax="100" style="width: ${missionInfo.progress }%;">
											
										</div></c:when> 
								</c:choose>

							</div>
							
							<form action="mission_view" method="get">
							<input type="hidden" name="mission_id" value="${missionInfo.id }">
							<div class="pull-right">
								<input type="submit" class="btn btn-info " value="修改并更新">
							</div>
							
							<div class="col-xs-3 pull-right">
									<input name="updateProgress" type="text" data-plugin="TouchSpin" data-options="{ verticalbuttons: true, initval: ${ missionInfo.progress}, postfix: '%',buttondown_class: 'btn btn-info', buttonup_class: 'btn btn-info' }">
							</div>

							</form>
						</div>
					</div>
					<div class="divid"></div>

					<div class="row">
						<div class="col-md-12">
							<div class="m-h-lg lh-xl">
								<p>${missionInfo.text }</p>
								<p><c:if test="${missionInfo.pic!=null }"><img src="/pic/mission/${missionInfo.pic }" width="300" height="300"></c:if></p>
							</div>
						</div>
					</div>
				</div>

				<div class="row">
					<div class="col-md-12">

					
						<div id="profile-tabs" class="nav-tabs-horizontal white m-b-lg">
							<div class="widget-header p-h-md p-v-md">
								<h4 class="widget-title">评论</h4>
							</div>
							<hr class="widget-separator m-0">
					<c:choose>
						<c:when test="${mission.employeeCommentMap != null}">

							  <c:forEach items="${mission.employeeCommentMap }" var="map">
							  	<!--一条评论-->
							  	
								<div class="media stream-post">
								<form action="delete_comment.action" method="post">	
										<input type="hidden" name="mission_id" value="${missionInfo.id }">
										<input type="hidden" name="comment_emp" value="${map.key.id }">
										<input type="hidden" name="comment" value="${map.value }">
										<input type="hidden" name="all_comment" value="${missionInfo.comment}">
									<div class="media-left">
										<div class="avatar avatar-lg avatar-circle">
											
											<img src="/pic/employee/${map.key.pic  }" >
										</div>
									</div>
									
									<div class="media-body">
										<h4 class="media-heading m-t-xs">
											${map.key.name }
											<small class="text-muted">
														(${map.key.departmentName }
														<c:if test="${map.key.positionId != 0}"> ${map.key.positionName }</c:if>
														)</small>
										<!-- 本人,作者可删除评论 -->
										<c:if test="${missionInfo.auther.id == activeEmp.id || map.key.id == activeEmp.id }">
										<button type="submit" onclick="alert('删除成功');" class="pull-right btn btn-defalt" >删除</button>
										</c:if>

										</h4>
									
										<!-- m-h-lg lh-xl -->
										<div class="m-t-xs">
											<p>${map.value }</p>
										</div>
										
									</div>
									</form>
								</div><!--一条评论结束-->
							  </c:forEach>
						</c:when>
						<c:otherwise>
							<!--一条评论-->
							<div class="media stream-post">

								<div class="media-body">
									<h4 class="media-heading m-t-xs text-center">
										还没有人发表评论
									</h4>
								</div>
							</div><!--一条评论结束-->
						</c:otherwise>
					</c:choose>	 

							
							
						</div>

						<div class="panel panel-default new-message">
							<form action="mission_view" method="post">
								<input type="hidden" name="mission_id" value="${missionInfo.id }">
								<input type="hidden" name="oldComment" value="${missionInfo.comment }"> 
								<div class="panel-body p-0">
									<textarea name="newComment" id="new-message-body" placeholder="请输入评论.."></textarea>
								</div>
								<div class="panel-footer pull-right">
									<button type="submit" class="btn btn-danger">发表评论 <i class="fa fa-comment"></i></button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div><!-- END column -->
		</div><!-- .row -->
	</section><!-- .app-content -->
</div><!-- .wrap -->
</main>
<!--========== END app main -->

<%@ include file="../common_body.jsp"%>
</body>
</html>