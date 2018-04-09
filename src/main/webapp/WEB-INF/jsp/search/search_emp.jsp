<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="../tag.jsp" %>

<c:remove var="pageName"/>
<c:set var="pageName" value="搜索" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ include file="../common_head.jsp"%>

<title>搜索-noa</title>
<script type="text/javascript">

	window.onload = function defaltChoose(){
 		
	 	var radios = document.getElementsByName("state");
 		var flag = false;
		for (var i = 1; i < radios.length; i++){
			if (radios[i].value == '${state}'){
				
				
				radios[i].checked = true;
				flag = true;
				break;
			} 
		}
		if(!flag){
			radios[0].checked = true;
		}
		
		var options = $("#depSelect").find("option"); //获取select下拉框的所有值
		for (var j = 1; j < options.length; j++) {
			if ($(options[j]).val() == '${depId}') {
				// 把之前选的拿到最上面来	

				//在前面添加
				
				$("#depSelect").prepend("<option value='"+$(options[j]).val()+"' selected=selected >"+$(options[j]).text()+"</option>");
				
			}
		} 

	}

</script>
</head>
<body class="menubar-left menubar-unfold menubar-light theme-primary" >

<jsp:include page="../navbar.jsp"/>

<!-- APP MAIN ==========-->
<main id="app-main" class="app-main">
  <div class="promo">
	<div class="promo-body">
		<form action="search_emp" method="get">
			<div class="row">
				<div class="col-xs-12 col-sm-3 col-sm-offset-1">
					<input name="name" class="form-control" value="${name }" placeholder="员工姓名">
				</div>
				<div class="col-xs-12 col-sm-3">
					
					
					<select id="depSelect"  name="depId" class="form-control" data-plugin="select2">
						
						<option value="" >全体</option>
						<c:forEach items="${allDepartment }" var="department" begin="1">
							<option value="${department.departmentId }">${department.departmentName }</option>
						</c:forEach>

					</select>

				</div>
				
				<div class="col-xs-12 col-sm-1">
					<div class="radio radio-primary">
						<input name="state" value="" type="radio" id="checkbox-demo-3" ><label>所有状态</label></input>
					</div>
					<div class="radio radio-success">
						<input name="state" value="1" type="radio" id="checkbox-demo-3"><label><i class="status status-online"></i> 在线</label></input>
					</div>
				</div>
				<div class="col-xs-12 col-sm-1">
					<div class="radio radio-warning">
						<input name="state" value="2" type="radio" id="checkbox-demo-3"><label><i class="status status-away"></i> 离开</label></input>
					</div>
					<div class="radio radio-danger">
						<input name="state" value="0" type="radio" id="checkbox-demo-3"><label><i class="status status-offline"></i> 离线</label></input>
					</div>
				</div>
				<div class="col-xs-12 col-sm-2">
					<input type="submit" class="btn btn-primary btn-block promo-search-submit" value="搜索 !">
				</div>

			</div>
		</form>
	</div>
</div>
<div class="wrap">
	<section class="app-content">
		<!-- search results -->
		<div class="panel panel-default">
			<div class="panel-heading bg-white">
				<p class="panel-title text-muted">搜索到 ${employeeList.size() }名员工</p>
			</div>
			<div class="panel-body">
				<div class="row m-b-lg">
				
				
				<c:forEach items="${employeeList }" var="emp">
					<div class="col-md-4 col-sm-6">
						<div class="user-card contact-item">
							<div class="media">
								<div class="media-left">
									<div class="avatar avatar-lg avatar-circle">
										<img src="${emp.pic }.jpg" alt="">
										<c:choose>
											<c:when test="${emp.workingState == 0 }"><i class="status status-offline"></i></c:when>
											<c:when test="${emp.workingState == 1 }"><i class="status status-online"></i></c:when>
											<c:when test="${emp.workingState == 2 }"><i class="status status-away"></i></c:when>
										</c:choose>
										
									</div>
								</div>
								<div class="media-body">
									<h4 class="media-heading title-color">${emp.name }</h4>
									<small class="media-meta">${emp.departmentName }<c:if test="${emp.positionId != 0}"> ${emp.positionName }</c:if></small>
								</div>
							</div>
							<div class="contact-item-actions">
								<a href="mail/mail_compose?receiver=${emp.id }" class="btn btn-success" ><i class="fa fa-envelope"></i></a>
							</div><!-- .contact-item-actions -->
						</div><!-- search-result -->
					</div>
				</c:forEach>




	
			
				</div>
			</div>
		</div>
	</section><!-- #dash-content -->
</div><!-- .wrap -->

</main>
<!--========== END app main -->

<%@ include file="../common_body.jsp"%>
</body>
</html>