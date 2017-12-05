<%@ page pageEncoding="UTF-8"%>



<ul class="nav" id="side-menu">
	<li class="sidebar-search">
		<div class="input-group custom-search-form">
			<input type="text" class="form-control" placeholder="Search...">
			<span class="input-group-btn">
				<button class="btn btn-default" type="button">
					<i class="fa fa-search"></i>
				</button>
			</span>
		</div> <!-- /input-group -->
	</li>
	<li><a href="${pageContext.request.contextPath}"><i class="fa fa-dashboard fa-fw"></i> INDEX</a></li>
	<!-- nav fist level 회원 서비스 -->
	<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 회 원<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/member/join.form">&nbsp;-회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/member/login.form">&nbsp;-로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/member/login_check.page">&nbsp;-login_check</a></li>
			<li><a href="${pageContext.request.contextPath}/member/cash.page">&nbsp;-캐쉬충전</a></li>
		</ul> <!-- /.nav-second-level --></li>

	<!-- nav fist level Game 서비스 -->
	<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 상담 서비스<span class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/consulting/consultingboard/list.page">&nbsp;consulting list</a></li>
			<li><a href="${pageContext.request.contextPath}/consulting/anonymousboard/list.page">&nbsp;anony list</a></li>
			<li><a href="${pageContext.request.contextPath}/consulting/helper/list.page">&nbsp;helper list</a></li>

		</ul> <!-- /.nav-second-level --></li>

	<!-- nav fist level Consulting 서비스 -->
	<li><a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> 게 임<span class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/member/join.form">&nbsp;-회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/member/login.form">&nbsp;-로그인</a></li>
			<li><a href="${pageContext.request.contextPath}/member/login_check.page">&nbsp;-login_check</a></li>
			<li><a href="${pageContext.request.contextPath}/member/cash.page">&nbsp;-캐쉬충전</a></li>
		</ul> <!-- /.nav-second-level --></li>
</ul>
