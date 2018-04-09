<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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



			<div class="table-responsive">
				<table class="table mail-list">
					<tr>
						<td>
							<!-- mission块 --> <c:forEach items="${missionList }"
								var="mission">
								
								<a href="mission/mission_view?mission_id=${mission.id }">
									<div class="mail-item">
										<table class="mail-container">
											<tr>
												<td class="mail-left">
													<div class="avatar avatar-lg avatar-circle">
														<img src="/pic/employee/${mission.auther.pic }" alt="sender photo">
														
													</div>
												</td>

												<td class="mail-center ">
													<div class="mail-item-header title-color ">
														<h4 class="mail-item-title ">${mission.title }</h4>
														<c:choose>
															<c:when test="${mission.targetId == 0 }">
																<span class="label label-info">${mission.targetName }</span>
															</c:when>
															<c:when test="${mission.targetId % 10 == 0  }">
																<span class="label label-warning">${mission.targetName }</span>
															</c:when>
															<c:when test="${mission.targetId % 10 != 0  }">
																<span class="label label-danger">${mission.targetName }</span>
															</c:when>
														</c:choose>
													</div>
													<p class="mail-item-excerpt text-color">
														BY: ${mission.auther.name }
														(${mission.auther.departmentName }
														<c:if test="${mission.auther.positionId != 0}"> ${mission.auther.positionName }</c:if>
														)
													</p>
												</td>

												<td class="title-color col-sm-3 ">
													<div class="progress">
													
												<!-- 进度条 -->
												<c:choose>
												<c:when test="${mission.targetId == 0 }">
												<div class="progress-bar progress-bar-info"
															role="progressbar" aria-valuenow="${mission.progress }" aria-valuemin="0"
															aria-valuemax="100" style="width: ${mission.progress }%;">
															<span class="sr-only"></span>
														</div></c:when>
													<c:when test="${mission.targetId % 10 == 0 }"><div class="progress-bar progress-bar-warning"
															role="progressbar" aria-valuenow="${mission.progress }" aria-valuemin="0"
															aria-valuemax="100" style="width: ${mission.progress }%;">
															<span class="sr-only"></span>
														</div></c:when>
													<c:when test="${mission.targetId % 10 != 0 }"><div class="progress-bar progress-bar-danger"
															role="progressbar" aria-valuenow="${mission.progress }" aria-valuemin="0"
															aria-valuemax="100" style="width: ${mission.progress }%;">
															<span class="sr-only"></span>
														</div></c:when> 
													</c:choose>

													</div>
													<p class="mail-item-excerpt pull-right ">
														<fmt:formatDate value="${mission.time }"
															pattern="MM-dd HH:mm" />
													</p>
												</td>
											</tr>
										</table>
									</div>
									<!-- END 测试块 -->
								</a>
								
							</c:forEach>





						</td>
					</tr>
				</table>
			</div>
		</div>
		<!-- END column -->
	</div>
	<!-- .row --> </section><!-- .app-content -->
	</div>
	<!-- .wrap --> </main>
	<!--========== END app main -->

	<%@ include file="../common_body.jsp"%>
</body>
</html>