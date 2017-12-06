<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<title>info</title>
<body>
	<center style="margin-top: 15px;">
	<hr width="500" size="2" >
	     <font size="5"><strong>회원정보</strong></font>
	<hr width="500" size="2" >
	  <table class="table table-striped table-bordered" border="1" width="600" align="center"  cellpadding="3" cellspacing="1" style="width: 502px;">
	  		<tr>
	  			<td  width='100' align='center'>회원번호</td>
	  			<td>${member.seq}</td>
	  		</tr>
	  		<tr>
	  			<td align='center'>이름</td>
	  			<td>${member.name}</td>
	  		</tr>
	  		<tr>
	  			<td align='center'>ID</td>
	  			<td>${member.id}</td>
	  		</tr>
	  		<tr>
	  			<td align='center'>PWD</td>
	  			<td>${member.pwd}</td>
	  		</tr>
	  		<tr>
	  			<td align='center'>이메일</td>
	  			<td>${member.email}</td>
	  		</tr>
	  		<tr>
	  			<td align='center'>핸드폰번호</td>
	  			<td>${member.phone}</td>
	  		</tr>
	  		<tr>
	  			<td align='center'>계좌번호</td>
	  			<td>${member.accnum}</td>
	  		</tr>
	  </table>
	  <hr width='500' size='2' noshade>
		<b>
			<button  class="btn default" onclick="">정보수정</button> | 
			<button  class="btn default" onclick="history.go(-1)">뒤로가기</button>
		</b>
	  <hr width='500' size='2' noshade>
	  	<b>
	  		<button  class="btn default" onclick="">회원탈퇴</button>
	  	</b>
	</center>
</body>
</html>

