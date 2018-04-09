<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="./tag.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="zh-CN">
<head>

<title>navbar</title>
<%@ include file="common_head.jsp"%>

</head>

<body class="menubar-left menubar-unfold menubar-light theme-primary">
	<!--============= start main area -->

	<!-- APP NAVBAR ==========-->
	<nav id="app-navbar"
		class="navbar navbar-inverse navbar-fixed-top primary"> <!-- navbar header -->
	<div class="navbar-header">
		<a href="${basePath }home" class="navbar-brand"> <span
			class="brand-icon"><i class="fa fa-gg"></i></span> <span
			class="brand-name">NOA</span>
		</a>
	</div>
	<!-- .navbar-header -->

	<div class="navbar-container container-fluid">
		<div class="collapse navbar-collapse" id="app-navbar-collapse">

			<ul class="nav navbar-toolbar navbar-toolbar-left navbar-left">
				<li>
					<h5 class="page-title hidden-menubar-top hidden-float">${pageName }</h5>
				</li>

			</ul>

			<ul class="nav navbar-toolbar navbar-toolbar-right navbar-right">


				<li class="dropdown">
				<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<c:if test="${activeEmp.workingState == 0}"><i class="status status-online"></i> 离线</c:if>
					<c:if test="${activeEmp.workingState == 1}"><i class="status status-online"></i> 在线</c:if>
					<c:if test="${activeEmp.workingState == 2}"><i class="status status-online"></i> 离开</c:if>
					
				</a>
					<ul class="dropdown-menu animated flipInY">
                <li>
                  <a class="text-color" href="#">
                    <span class="m-r-xs"><i class="status status-online"></i></span>
                    <span>在线</span>
                  </a>
                </li>
                <li>
                  <a class="text-color" href="#">
                    <span class="m-r-xs"><i class="status status-away"></i></span>
                    <span>离开</span>
                  </a>
                </li>
          </ul></li>

				<li class="dropdown"><a href="javascript:void(0)"
					class="side-panel-toggle" data-toggle="class"
					data-target="#side-panel" data-class="open" role="button"> <i
						class="zmdi zmdi-hc-lg zmdi-nature-people"></i> 团队
				</a></li>
			</ul>
		</div>
	</div>
	<!-- navbar-container --> </nav>
	<!--========== END app navbar -->

	<!-- APP ASIDE ==========-->
	<aside id="menubar" class="menubar light">
	<div class="app-user">
		<div class="media">
			<div class="media-left">
				<div class="avatar avatar-md avatar-circle">

					<img src="/pic/employee/${activeEmp.pic }" alt="" />

				</div>
				<!-- .avatar -->
			</div>
			<div class="media-body">
				<div class="foldable">

					<h5 class="username">${activeEmp.name }</h5>
					<small>${activeEmp.departmentName } <c:if test="${activeEmp.positionId != 0 }">${activeEmp.positionName}</c:if></small>
					
				</div>
			</div>
			<!-- .media-body -->
		</div>
		<!-- .media -->
	</div>
	<!-- .app-user -->

	<div class="menubar-scroll">
		<div class="menubar-scroll-inner">
			<ul class="app-menu">
				<li><a href="${basePath }home"> <i
						class="menu-icon zmdi zmdi-view-dashboard zmdi-hc-lg"></i> <span
						class="menu-text">首页</span>
				</a></li>
				<li><a href="${basePath }mission?view=all"> <i
						class="menu-icon zmdi zmdi-check zmdi-hc-lg"></i> <span
						class="menu-text">任务</span> <span
						class="label label-warning menu-label">2</span>
				</a></li>
				<li><a href="${basePath }mail?view=all"> <i
						class="menu-icon zmdi zmdi-inbox zmdi-hc-lg"></i> <span
						class="menu-text">邮件</span> <span
						class="label label-info menu-label">2</span>
				</a></li>
				<li><a href="${basePath }search_emp"> <i
						class="menu-icon zmdi zmdi-search zmdi-hc-lg"></i> <span
						class="menu-text">查找员工</span>
				</a></li>


				<li class="menu-separator"><hr></li>

				<li><a href="#"> <i
						class="menu-icon zmdi zmdi-settings zmdi-hc-lg"></i> <span
						class="menu-text">编辑个人资料</span>
				</a></li>

				<li><a href="#" data-toggle="modal" data-target="#confirmModal"> <i
						class="menu-icon zmdi zmdi-power-off zmdi-hc-lg"></i> <span
						class="menu-text">退勤</span>
				</a></li>

			</ul>
			<!-- .app-menu -->

		</div>
		<!-- .menubar-scroll-inner -->
	</div>
	<!-- .menubar-scroll --> 
	</aside>
	<!--========== END app aside -->

	

	<!-- APP MAIN ==========-->
	<!--========== END app main -->
<!-- delete item Modal -->
<div id="confirmModal" class="modal fade" tabindex="-1" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
				<h4 class="modal-title">退勤</h4>
			</div>
			<div class="modal-body">
				<h5>您确定要注销吗 ?</h5>
			</div><!-- .modal-body -->
			<div class="modal-footer">
				<a href="${basePath }logout" class="btn btn-danger" >注销</a>
			</div><!-- .modal-footer -->
		</div><!-- /.modal-content -->
	</div><!-- /.modal-dialog -->
</div><!-- /.modal -->	
</body>
</html>