<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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



				<div class="table-responsive">
					<table class="table mail-list">
						<tr>
							<td>


								<c:forEach items="${mailList }" var="mail">

								
								
								<!-- TODO:还需要传是否是server -->
								<a href="mail/mail_view?mail_id=${mail.id}&otherside_id=${mail.otherside.id}&isSend=${isSend}">

									
									<div class="mail-item " <c:if test="${mail.read == 1 && isSend!=true}">style="background-color:#cccccc57"</c:if>>
										<table class="mail-container">
											<tr>
												<td class="mail-left">
													<div class="avatar avatar-lg avatar-circle">
														<img src="/pic/employee/${mail.otherside.pic }" alt="sender photo">
														
													</div>
												</td>
												<td class="mail-center">
													<p class="mail-item-excerpt text-color">${mail.otherside.name }</p>
													<div class="mail-item-header title-color">
														<h4 class="mail-item-title">${mail.title }</h4>
													</div>
												</td>
												
	
												
												<td class="mail-right">
													<p class="mail-item-date">
													<fmt:formatDate value="${mail.sendtime }" pattern="MM-dd HH:mm"/>
													</p>
												</td>
											</tr>
										</table>
	
									</div><!-- END mail-item -->
									</a>
								
								</c:forEach>



							</td>
						</tr>
					</table>
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