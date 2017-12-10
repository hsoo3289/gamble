<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <html lang="en">
  <head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

 
	<center>
		<br/>
		<h1>익명 게시판</h1>
		
		<a href='nextseq.seq.insert' style="text-decoration:none">글쓰기</a>
		
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href='/spring01' style="text-decoration:none">처음으로</a>	
		<br/><br/>
		
		
		
		<table border='1' width='1000' align='center'>
		
		
		
		
		
		<th>글번호</th>
		<th>작성자</th>
		<th>제목</th>
		<th>내용</th>
		<th>조회수</th>
		<th>추천수</th>
		<th>작성일</th>
	
	
	
	</tr>
	<c:if test="${empty list}">    
		<tr>
			<td align ='center' colspan="6">데이터가 없음.</td>
		</tr> 
	</c:if> 
	<c:forEach items="${list}" var="dto">
		<tr>
			<td align ='center'>${dto.SEQ}</td>          <!-- 글번호  -->  
			 
			<td align ='center'>${dto.NAME}</td>      <!-- 작성자  --> 
			
			<td align ='center'>${dto.SUBJECT}</td>    <!-- 제목  -->
			
			<td align ='center'> 
			<a href='view.do?seq=${dto.SEQ}'>${dto.CONTENT}</a>  <!-- 내용및 클릭시 상세보기  -->
			</td>
			</td>
		
			<td align ='center'>${dto.VIEW_COUNT}</td> <!-- 조회수  -->
			
			<td align ='center'>${dto.LIKE_COUNT}</td> <!-- 추천수  -->
			
			<td align ='center'>${dto.CDATE}</td>  <!-- 작성일  -->
			
			
			
		</tr>
	</c:forEach> 
	</table>
</center>