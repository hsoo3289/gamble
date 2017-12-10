<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html lang="en">
<head>
  <title>Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">




	<c:if test="${empty view}">
		<tr>
	 		<td align='center' colspan="5">음...?</td>
		</tr>
	</c:if>
	<c:forEach items="${view}" var="board">
<center>
	<br/>
</center>                                           <!-- nextseq.seq.insert  -->
	<head>
   	  <title>게시판${board.seq}"번글 수정</title>
			<meta charset='utf-8'>
 	</head>
 		<body onload='input.name.focus()'>
<center>
		  <h2>게시판 수정하기</h2>
		  <br/>
	   
			<form name='input' method='post' action='item.seq.update'>
			
			<input type='hidden' name='seq' value='${board.SEQ}'>
			
			<input type='hidden' name='writer_seq' value='${board.WRITER_SEQ}'>
		 
		 <table border='1' width='600' align='center'  cellpadding='3' cellspacing='1'>
	  		   <tr>
				 <td width='30%' align='center'>작성자</td>
				
				 <td align='center'><input type='text' name='writer_seq' value='${board.WRITER_SEQ}' size='60' disabled ></td>
	    	  </tr>
		   	 
			  <tr>
				 <td align='center'>글제목</td>
				 
				 <td align='center'><input type='text' name='subject' value='${board.SUBJECT}' size='60'></td>
			  </tr>
			
			  <tr>
				 <td align='center'>글내용</td>
				 <td align='center'><textarea name='content' rows='5' cols='53'>${board.CONTENT}
				 </textarea></td>
			  </tr>
			 
	
	
	          <tr>
				 <td colspan='2' align='center'>
					<input type='submit' value='수정완료'>
					<input type='reset' value='다시입력'>
				 </td>
			  </tr>
		   </table>
		   <br>
		   <hr width='600' size='2' noshade>
		   <a href='/spring01/consulting/consultingboard/list.page' style="text-decoration:none">글목록</a>
		   <hr width='600' size='2' noshade>
		</form>
</center>
 	</body>
</c:forEach>