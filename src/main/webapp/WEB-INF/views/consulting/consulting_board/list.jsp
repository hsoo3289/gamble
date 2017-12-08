<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <html lang="en">
  <head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
	<center>
		<br/>
		<h1>상담 게시판ver.1</h1>
		
		<a href='write.do' style="text-decoration:none">글쓰기</a>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<a href='../' style="text-decoration:none">처음으로</a>	
		<br/><br/>
		
		
		
		<table border='1' width='1000' align='center'>
		
		
		
		
		
		<th>글번호</th>
		<th>제목</th>
		<th>내용</th>
		<th>작성자</th>
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
			<td align ='center'>${dto.seq}</td>          <!-- 글번호  -->  
			 
			<td align ='center'>${dto.subject}</td>      <!-- 제목  -->
			
			<td align ='center'> 
			
			<a href='view.do?seq=${dto.seq}'>${dto.content}</a>  <!-- 내용및 클릭시 상세보기  -->
			</td>  
			
			<td align ='center'>${dto.writer_seq}</td>    <!-- 글쓴이  -->
				
			</td>
			
			<td align ='center'>${dto.view_count}</td> <!-- 조회수  -->
			
			<td align ='center'>${dto.like_count}</td> <!-- 추천수  -->
			
			<td align ='center'>${dto.cdate}</td> <!-- 작성일  -->
			
		</tr>
	</c:forEach> 
	</table>
</center>