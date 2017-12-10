<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

  <html lang="en">
  <head>
  <title>Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">



<title>게시판(Spring)</title>
	<meta charset='utf-8'>
	<script language="javascript">
	   function check()
	   {
	       for(var i=0; i<document.input.elements.length; i++)
		   {
		      if(document.input.elements[i].value == "")
			  {
			     alert("모든 값을 입력 하셔야 합니다. ");
				 return false;
			  }
		   }
		   document.input.submit();
       }
	</script>
  </head>
  <body onload="input.name.focus()">
    <center>
	      <br/>
	      <h2> 상담게시판 문의하기 </h2>
		  
	    
	</center>
	<br/>
	<form name="input" method="post" action="nextseq.seq.insert">   
	   <table border="1" width="600" align="center"  cellpadding="3" cellspacing="1">
	   
	     
	     <tr>
	      	<td align="center">작성자</td>
	      	<td align="center"><input type="text" name="writer_seq" size="60"></td>
	      </tr>
	     
	     
	      <tr>
		     <td align="center">글제목</td>
			 <td align="center"><input type="text" name="subject" size="60"></td>
		  </tr>
		  
		  
		  <tr>	  
		     <td align="center">글내용</td>
			 <td align="center"><textarea name="content" rows="5" cols="61"></textarea></td>
		  </tr>	
	         
	     
	      
		  




			     <td colspan="2" align="center">
			    <input type="button" value="전송" onclick="check()">
				<input type="reset" value="다시입력">
				</td>
				</table>
			<style>
			.fileDrop {
			    width: 600px;
			    height: 70px;
			    border: 2px dotted gray;
			    background-color: gray;
			}
			</style>
			
			<div>

				<hr width='600' size='2' noshade>
				<center><a href='/spring01/consulting/anonymous_board/list.list.list' style="text-decoration:none">목록</a></center>
				<hr width='600' size='2' noshade>
				
	   <br>
	</form>
  </body>
</html>