<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <html lang="en">
  <head>
  <title>Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<center>
	
	<script src="../js/jquery-3.1.1.min.js"></script>
	<script src="../js/bootstrap.min.js"></script>
  	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>

	
</head>


<meta name="viewport" content="width=device-width, initial-scale=1">
<body align='right' style="background:url('/test/images/cat.jpg') no-repeat center center fixed;">
	<div class="page-wrapper" style="width: 700px">
	<br/>
	
		
		
		<c:choose>
		<c:when test="${user ne null && user.no ne -1}"><h3>${user.name} 님께서 상담게시판을 이용중입니다</h3><br />
				
			</c:when>
			
			<c:otherwise>
				<tr>
					<th><h3>Guest님 접속중</h3></th>
				</tr>
		
		</c:otherwise>
	
		</c:choose>
		&nbsp;&nbsp;
		<a href='nextseq.seq.insert' style="text-decoration:none">글쓰기</a>
		&nbsp;&nbsp;&nbsp;
		
		<script>
			function myFunction() {
				if ('${user}' == null || '${user.no}' == -1) {
					alert("로그인후 이용 가능합니다!");
					return false;
				//location.href="/board/list.do";
				} else {
					location.href = "login.do"
				}
			}
			function mylogin() {
				var myWindow = window.open("../member/login.do", "MsgWindow",
					"top=500,left=500,width=400,height=150");
			}
		</script>
		
		
		<a href='/spring01' style="text-decoration:none">처음으로</a>	
		<br/>
		<div class="row" style="margin: 20px 0 20px 0">
			<div class="col-xs-6" align='left' style="padding-left: 0px;">
				<select class='btn btn-primary' id='listCount' name='listCount'
					onchange='listCnt();' >
					
					<option value='5'>5</option>
					<option value='10'>10</option>
					<option value='15'>15</option>
					<option value='20'>20</option>
				</select>
			</div>
			
			
			
		
		<table class="table table-striped table-bordered">
			<tr>
				<th align='center' width='10%'>글번호</th>
				<th align='center' width='10%'>제목</th>
				<th align='center' width='20%'>작성자</th>
				<th align='center' width='30%'>내용</th>
				
				<th align='center' width='10%'>조회수</th>
				<th align='center' width='10%'>추천수</th>
				<th align='center' width='10%'>작성일</th>
			
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td align="center" colspan="5">데이터가 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="dto">
	
			
				<tr>
					<td align="center">${dto.SEQ}</td>
					<td align="center">${dto.SUBJECT}</td>
					<td align="center">${dto.WRITER_SEQ}</td>
					<td align="center"><a href='item.item.view?seq=${dto.SEQ}'>${dto.CONTENT}
								</a></td>
					
					
					
					<td align="center">${dto.VIEW_COUNT}</td>
					<td align="center">${dto.LIKE_COUNT}</td>
					<td align="center">${dto.CDATE}</td>
				</tr>
			</c:forEach>
		</table>
		<ul class="pagination">
			<c:if test="${p.pageStartNum ne 1}">
				<!--맨 첫페이지 이동 -->
				<li><a onclick='pagePre(${p.pageCnt+1},${p.pageCnt});'>&laquo;</a></li>
				<!--이전 페이지 이동 -->
				<li><a onclick='pagePre(${p.pageStartNum},${p.pageCnt});'>&lsaquo;</a></li>
			</c:if>

			<!--페이지번호 -->
			<c:forEach var='i' begin="${p.pageStartNum}" end="${p.pageLastNum}"
				step="1">
				<li class='pageIndex${i}'><a onclick='pageIndex(${i});'>${i}</a></li>
			</c:forEach>

			<c:if test="${p.lastChk}">
				<!--다음 페이지 이동 -->
				<li><a
					onclick='pageNext(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&rsaquo;</a></li>
				<!--마지막 페이지 이동 -->
				<li><a
					onclick='pageLast(${p.pageStartNum},${p.total},${p.listCnt},${p.pageCnt});'>&raquo;</a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>
</center>