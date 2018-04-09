<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="../tag.jsp" %>
<%@taglib uri="http://shiro.apache.org/tags" prefix="shiro" %>

<div class="col-md-2">
	<div class="app-action-panel" id="inbox-action-panel">
		<div class="action-panel-toggle" data-toggle="class"
			data-target="#inbox-action-panel" data-class="open">
			<i class="fa fa-chevron-right"></i> <i class="fa fa-chevron-left"></i>
		</div>
		<!-- .app-action-panel -->

					<div class="m-b-lg">
					<c:choose>
						<c:when test="${isInbox == true}">
							<c:if test="${ activeEmp.positionId >= 1 }">
								<a href="${basePath}mission/mission_compose" class="btn action-panel-btn btn-default btn-block">布置任务</a>
							</c:if>
						</c:when>
						<c:otherwise><a href="${basePath}mission?view=all" class="btn action-panel-btn btn-default btn-block"><i class="m-r-sm fa fa-mail-reply"></i> 返回任务一览</a></c:otherwise>
					</c:choose>
						
					</div>

					<div class="app-actions-list scrollable-container">
						<!-- mail category list -->

						<div class="list-group">
							<h4>筛选</h4>
							<hr class="m-0 m-b-md" style="border-color: #ddd;">
							<a href="${basePath }mission?view=all" class="list-group-item"><i class="m-r-sm fa fa-circle text-inverse"></i><span>所有任务</span></a>
							<a href="${basePath }mission?view=overall" class="list-group-item"><i class="m-r-sm fa fa-circle text-info"></i><span>总体</span></a>
							<a href="${basePath }mission?view=main" class="list-group-item"><i class="m-r-sm fa fa-circle text-warning"></i><span>大部门</span></a>
							<a href="${basePath }mission?view=sub" class="list-group-item"><i class="m-r-sm fa fa-circle text-danger"></i><span>子部门</span></a>
						</div><!-- .list-group -->


					</div><!-- .app-actions-list -->
	</div>
	<!-- .app-action-panel -->
</div>
<!-- END column -->
