<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">

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
			<li><a href="${pageContext.request.contextPath}/member/member/join.page"><i class="fa fa-pencil-square-o"></i> 회원가입</a></li>
			<li><a href="${pageContext.request.contextPath}/member/member/item.item.info?no=${user.no}"><i class="fa fa-info-circle"></i> 회원정보</a></li>
		</ul> <!-- /.nav-second-level --></li>

	<!-- nav fist level cash 서비스 -->
	<li><a href="#"><i class="fa fa-won fa-fw "></i>CASH<span class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/member/cash/cash.page"><i class="fa fa-money"></i> cash 충전</a></li>
			<li><a href="${pageContext.request.contextPath}/member/cash/list.list.cash_list?member_seq=${user.no}"><i class="glyphicon glyphicon-th-list"></i> 충전 이력</a></li>
			<li><a href="${pageContext.request.contextPath}/member/cash/approve_list.list.cash_approve"><i class="fa fa-check-square-o"></i> 관리자 승인</a></li>	
				
		</ul> <!-- /.nav-second-level --></li>
		
	<!-- nav fist level Game 서비스 -->
	<li><a href="#"><i class="fa fa-coffee fa-fw"></i> 상담 서비스<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/consulting/consulting_board/paginglist.list.list.paging"><i class="fa fa-smile-o"></i> CONSULTING BOARD</a></li>
			<li><a href="${pageContext.request.contextPath}/consulting/anonymous_board/paginglist.list.list.paging"><i class="fa fa-comments-o"></i> ANONYMOUS BOARD</a></li>
			<li><a href="${pageContext.request.contextPath}/consulting/helper/list.list.list"><i class="fa fa-heart"></i> HELPER</a></li>
		</ul> <!-- /.nav-second-level --></li>

	<!-- nav fist level Consulting 서비스 -->
	<li><a href="#"><i class="fa fa-desktop fa-fw"></i> 게 임<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="${pageContext.request.contextPath}/game/game/play.page"><i class="fa fa-gamepad fa-fw"></i> GAME
					PLAY</a></li>
			<li><a href="${pageContext.request.contextPath}/game/game/game_result.page"><i class="fa fa-bar-chart-o fa-fw"></i> RESULT
					CHECK</a></li>
			<li><a
				href="${pageContext.request.contextPath}/game/game_board/pagingcount.paginglist.list.list.paging"><i class="glyphicon glyphicon-list-alt"></i> GAME
					BOARD</a></li>
		</ul> <!-- /.nav-second-level --></li>
	<!-- nav fist level 홈페이지 서비스 -->
	<li><a href="#"><i class="fa  fa-plus-square fa-fw"></i>도박 중독 방지 사이트<span
			class="fa arrow"></span></a>
		<ul class="nav nav-second-level">
			<li><a href="#" onclick="window.open('https://www.kcgp.or.kr/main.do','한국도박문제관리센터','width=1800, height=900, toolbar=no, menubar=no, scrollbars=no, resizable=yes');return false"><i class="fa fa-hospital-o fa-fw"></i> 한국도박문제관리센터</a></li>
		</ul> <!-- /.nav-second-level --></li>	
		
</ul>

<div class="wrapper">
<img src="${pageContext.request.contextPath}/img/maxresdefault.jpg" width=250>
</div>
<div class="wrapper">
<img src="${pageContext.request.contextPath}/img/breath.jpg" width=250>
</div>
<div class="wrapper">
<img src="${pageContext.request.contextPath}/img/leg.jpg" width=250>
</div>

