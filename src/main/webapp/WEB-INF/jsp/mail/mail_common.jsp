<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../tag.jsp"%>

<div class="col-md-2">
	<div class="app-action-panel" id="inbox-action-panel">
		<div class="action-panel-toggle" data-toggle="class"
			data-target="#inbox-action-panel" data-class="open">
			<i class="fa fa-chevron-right"></i> <i class="fa fa-chevron-left"></i>
		</div>
		<!-- .app-action-panel -->

		<div class="m-b-lg">
		<c:choose>
			<c:when test="${isInbox == true}"><a href="${basePath}mail/mail_compose" class="btn action-panel-btn btn-default btn-block">发送邮件</a></c:when>
			<c:otherwise><a href="${basePath}mail?view=all" class="btn action-panel-btn btn-default btn-block"><i class="m-r-sm fa fa-mail-reply"></i> 返回邮件一览</a></c:otherwise>
		</c:choose>

		</div>

		<div class="app-actions-list scrollable-container">
			<!-- mail category list -->
			<div class="list-group">
				<h4>筛选</h4>
				<hr class="m-0 m-b-md" style="border-color: #ddd;">
				<a href="${basePath}mail?view=all" class="text-color list-group-item">
				<i
					class="m-r-sm fa fa-envelope"></i>所有邮件</a> 
					<a href="${basePath}mail?view=unread"
					class="text-color list-group-item"><i
					class="m-r-sm fa fa-eye-slash"></i>未读邮件</a> 
					<a
					href="${basePath}mail?view=read" class="text-color list-group-item"><i
					class="m-r-sm fa fa-eye"></i>已读邮件</a> 
						<hr class="m-0 m-b-md" style="border-color: #ddd;">
					<a href="${basePath}mail?view=send"
					class="text-color list-group-item"><i
					class="m-r-sm fa fa-paper-plane"></i>已发送</a>

			</div>
			<!-- .list-group -->

		</div>
		<!-- .app-actions-list -->
	</div>
	<!-- .app-action-panel -->
</div>
<!-- END column -->
