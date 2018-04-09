<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>	
<%@include file="./tag.jsp" %>




	<div class="wrap p-t-0">
    <footer class="app-footer">
      <div class="clearfix">
<!--                <ul class="footer-menu pull-right">
          <li class="dropup">
          <a href="javascript:void(0)">
          <i class="m-r-sm fa fa-comments-o"></i>Wechat : nnkwrik</a></li>
        </ul>
        <div class="copyright pull-right">Copyright Rik 2018 &copy;</div> -->
        
<ul class="footer-menu pull-right">
				<li class="dropup">
				<a href="javascript:void(0)" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
					<i class="m-r-sm fa fa-comments-o"></i>Wechat : nnkwrik
				
					
				</a>
					<ul class="dropdown-menu animated flipInY">
		                <li>
		                 
		                   <img alt="" src="${basePath}resource/img/qr.png">
		            
		                </li>

         		 </ul></li></ul>
		<div class="copyright pull-right">Copyright Rik 2018 &copy;</div>
      </div>
    </footer>
  </div>
  
 <!-- SIDE PANEL -->
	<div id="side-panel" class="side-panel">
		<div class="panel-header">
			<h4 class="panel-title">团队</h4>
		</div>
		
		<div class="scrollable-container">
			<div class="media-group">
			
<%-- 				<a href="javascript:void(0)" class="media-group-item">
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-xs avatar-circle">
								<img src="${basePath}assets/images/221.jpg" alt="">
							</div>
						</div>
						<div class="media-body">
							<h5 class="media-heading"><i class="m-r-xs fa fa-circle text-success"></i>John Doe</h5>
							<small class="media-meta">active now</small>
						</div>
					</div>
				</a><!-- .media-group-item -->
				
				<a href="javascript:void(0)" class="media-group-item">
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-xs avatar-circle">
								<img src="${basePath}assets/images/221.jpg" alt="">
								
							</div>
						</div>
						<div class="media-body">
							<h5 class="media-heading"><i class="m-r-xs fa fa-circle text-success"></i>John Doe</h5>
							<small class="media-meta">active now</small>
						</div>
					</div>
				</a><!-- .media-group-item --> --%>
				
				<c:forEach items="${team }" var="menber">
				<a href="javascript:void(0)" class="media-group-item">
					<div class="media">
						<div class="media-left">
							<div class="avatar avatar-xs avatar-circle">
								<img src="/pic/employee/${menber.pic }" alt="" />
							</div>
						</div>
						<div class="media-body">
							<h5 class="media-heading">
					<c:if test="${activeEmp.workingState == 0}"><i class="m-r-xs fa fa-circle text-inverse"></i></c:if>
					<c:if test="${activeEmp.workingState == 1}"><i class="m-r-xs fa fa-circle text-success"></i></c:if>
					<c:if test="${activeEmp.workingState == 2}"><i class="m-r-xs fa fa-circle text-pink"></i></c:if>
					<c:if test="${activeEmp.workingState == 3}"><i class="m-r-xs fa fa-circle text-warning"></i></c:if>
							
							${menber.name }</h5>
							<small class="media-meta">
								${menber.departmentName }<c:if test="${menber.positionId != 0 }"> ${menber.positionId}</c:if>
							</small>
						</div>
					</div>
				</a><!-- .media-group-item -->
				</c:forEach>
				

			</div>
		</div><!-- .scrollable-container -->
	</div><!-- /#side-panel -->
	
	<!-- build:js ${basePath}resource/assets/js/core.min.js -->
	<script src="${basePath}resource/libs/bower/jquery/dist/jquery.js"></script>
	<script src="${basePath}resource/libs/bower/jquery-ui/jquery-ui.min.js"></script>
	<script src="${basePath}resource/libs/bower/jQuery-Storage-API/jquery.storageapi.min.js"></script>
	<script src="${basePath}resource/libs/bower/bootstrap-sass/assets/javascripts/bootstrap.js"></script>
	<script src="${basePath}resource/libs/bower/jquery-slimscroll/jquery.slimscroll.js"></script>
	<script src="${basePath}resource/libs/bower/perfect-scrollbar/js/perfect-scrollbar.jquery.js"></script>
	<script src="${basePath}resource/libs/bower/PACE/pace.min.js"></script>
	<!-- endbuild -->

	<!-- build:js ${basePath}resource/assets/js/app.min.js -->
	<script src="${basePath}resource/assets/js/library.js"></script>
	<script src="${basePath}resource/assets/js/plugins.js"></script>
	<script src="${basePath}resource/assets/js/app.js"></script>
	<!-- endbuild -->
	<script src="${basePath}resource/libs/bower/moment/moment.js"></script>
	<script src="${basePath}resource/libs/bower/fullcalendar/dist/fullcalendar.min.js"></script>
	<script src="${basePath}resource/assets/js/fullcalendar.js"></script>