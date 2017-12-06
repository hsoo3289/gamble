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
	<li><a href="${pageContext.request.contextPath}"><i
			class="fa fa-dashboard fa-fw"></i> INDEX</a></li>
	<!-- nav fist level 회원 서비스 -->
	<li><a href="#"><i class="fa fa-user fa-fw"></i> 회 원<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/member/join.form"><i class="fa fa-pencil-square-o"></i> 회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/member/info.page"><i class="fa fa-info-circle"></i> 회원정보</a></li>
		</ul> <!-- /.nav-second-level --></li>

	<!-- nav fist level cash 서비스 -->
	<li><a href="#"><i class="fa fa-won fa-fw "></i>CASH<span class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/member/cash.page"><i class="fa fa-money"></i> cash 충전</a></li>
			<li><a href="${pageContext.request.contextPath}/member/cash_list.page"><i class="glyphicon glyphicon-th-list"></i> 충전 이력</a></li>
			<li><a href="${pageContext.request.contextPath}/member/cash_approve.page"><i class="fa fa-check-square-o"></i> 관리자 승인</a></li>
		</ul> <!-- /.nav-second-level --></li>
		
	<!-- nav fist level Game 서비스 -->
	<li><a href="#"><i class="fa fa-coffee fa-fw"></i> 상담 서비스<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/consulting/consultingboard/list.page"><i class="fa fa-smile-o"></i> CONSULTING BOARD</a></li>
			<li><a href="${pageContext.request.contextPath}/consulting/anonymousboard/list.page"><i class="fa fa-comments-o"></i> ANONYMOUS BOARD</a></li>
			<li><a href="${pageContext.request.contextPath}/consulting/helper/list.page"><i class="fa fa-heart"></i> HELPER</a></li>
		</ul> <!-- /.nav-second-level --></li>

	<!-- nav fist level Consulting 서비스 -->
	<li><a href="#"><i class="fa fa-desktop fa-fw"></i> 게 임<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/game/game/play.page"><i class="fa fa-gamepad fa-fw"></i> GAME
					PLAY</a></li>
			<li><a href="${pageContext.request.contextPath}/game/game_result/game_result.page"><i class="fa fa-bar-chart-o fa-fw"></i> RESULT
					CHECK</a></li>
			<li><a
				href="${pageContext.request.contextPath}/game/gameboard/list.page"><i class="glyphicon glyphicon-list-alt"></i> GAME
					BOARD</a></li>
		</ul> <!-- /.nav-second-level --></li>
</ul>
