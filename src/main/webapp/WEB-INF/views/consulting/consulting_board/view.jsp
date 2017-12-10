<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
	

<html lang="en">
<head>
  <title>Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


<c:if  test= "${empty item}">
	 <tr>
		 <td align='center' color="#07D4F8" colspan="4">데이터가 없음</td>
		 </tr>
	 
	 </c:if> 		

<meta charset='utf-8'>
<center>
	<br/>
	<h2>게시판 글내용</h2>
	<br/>
	
		<table border='1' width='600' align='center' cellpadding='3'>
			<tr>
				<td width='100' align='center'>글번호</td>
				<td align='center'>${item.SEQ}</td>
			</tr>
			<tr>
				<td align='center'>작성자</td>
				<td align='center'>${item.WRITER_SEQ}</td>
			</tr>
			<tr>
				<td align='center'>글제목</td>
				<td align='center'>${item.SUBJECT}</td>
			</tr>
			<tr>
				<td align='center'>글내용</td>
				<td align='center'>${item.CONTENT}</td>
			</tr>
			<tr>

		
		</table>
		<br/>
		<hr width='600'  size='2' noshade>
		<b>
			<a href='item.seq.update?seq=${item.SEQ}' style="text-decoration:none">수정</a>
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<a href='delete.item.list?seq=${item.SEQ}' style="text-decoration:none">삭제</a>			
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<a href='/spring01/consulting/consulting_board/list.list.list' style="text-decoration:none">목록</a>			
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			<a href='/spring01'style="text-decoration:none">처음으로</a>			
			&nbsp;&nbsp;&nbsp;&nbsp;
			
			
			<a href='nextseq.seq.insert' style="text-decoration:none">글쓰기</a>
		</b>
		<hr width='600' size='2' noshade>
		</center>
	
	</head>
</html>
