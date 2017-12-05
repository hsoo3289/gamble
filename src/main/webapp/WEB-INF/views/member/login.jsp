<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
  <head>
  	<meta charset="utf-8">
    <title>login</title>
	<style type="text/css">
	   table{text-align: center} 
	</style>
	<script language="javascript">
	   function check()
	   {
	      if(f.id.value == "")
		  {
		      alert("아이디를 입력하시오.");
			  f.id.focus();
			  return false;
		  }
		  if(f.pwd.value == "")
		  {
		      alert("비밀번호를 입력하시오.");
			  f.pwd.focus();
			  return false;
		  }
		 f.submit();
	   }
	   function rewrite()
	   {
	      f.id.focus();
	   }
	</script>
  </head>
  <body onload="f.id.focus();">
     <form name="f" action="login.do" method="post">
	    <input type="hidden" name="fp" value="member">
	    <table align="center" cellpadding="3" cellspacing="1" 
		                          border="1" bordercolor="Maroon">
           <tr>
		     <td colspan="2" align="center">
			   <font size="4"><B>로그인</B></font>
			 </td>
		   </tr>
		   <tr>
		     <td>아이디</td>
			 <td><input type="text" name="id" size="20"></td>
		   </tr>
		   <tr>
		     <td>비밀번호</td>
			 <td><input type="password" name="pwd" size="20"></td>
		   </tr>
		   <tr>
		     <td colspan="2" align="center"> 
			    <input type="button" value="로그인" onclick="check()">
				<input type="reset" value="재입력" onclick="rewrite()">
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="button" value="닫기" onclick="self.close()">
			 </td>
		   </tr>
		   <b><c:if test="${msg ne null}">${msg}</c:if>
		   </b>
		</table>
	 </form>
  </body>
</html> 