<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Join</title>
	<script type="text/javascript">
		function check()
		{
			if(f.name.value == "")
			{
				alert("이름을 입력해주세요!");
				return false;
			}
			if(f.id.value == "")
			{
				alert("ID를 입력해주세요!");
				return false;
			}
			if(f.pwd.value == "")
			{
				alert("비밀번호를 입력해주세요!");
				return false;
			}if(f.pwd2.value != f.pwd.value)
			{
				alert("비밀번호가 일치하지 않습니다!");
				return false;
			}
			if(f.email.value == "")
			{
				alert("e-mail을 입력해주세요!");
				return false;
			}
			if(f.phone.value == "")
			{
				alert("핸드폰 번호를 입력해주세요!");
				return false;
			}
			if(f.accnum.value == "")
			{
				alert("계좌번호를 입력해주세요!");
				return false;
			}
			if(f.submit()){
				 alert("가입 성공! 로그인후 이용해주세요!")
			 }
		}
		function idCheck(){
			alert("도전!");
		}
	</script>
</head>
<body>
	<hr align="center" width="500" size="2" noshade color="미정">
	<center>
	     <font color="미정" size="5"><strong>회원 가입</strong></font>
	</center>
	<hr align="center" width="500" size="2" noshade color="미정">
		<table align="center">
		<tr>
	 		<th>이름</th>
	 	  	<td>
	 			<input name="name" type="text" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>ID</th>
	 	  	<td>
	 			<input name="id" type="text" size="30" maxlength="30">
	 			&nbsp;
              	<input type="button" value="중복확인" onclick="idCheck()">
            </td>
	 	</tr>
	 	<tr>
	 		<th>PWD</th>
	 	  	<td>
	 			<input name="pwd" type="password" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>PWD 재입력</th>
	 	  	<td>
	 			<input name="pwd2" type="password" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>이메일</th>
	 	  	<td>
	 			<input name="email" type="text"><strong>@</strong><input type="text">&nbsp;
	 			<select>
	 				<option> 선택하세요 	  </option>
	 				<option> naver.com    </option>
	 				<option> daum.net     </option>
	 				<option> google.co.kr </option>
	 			</select>
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>핸드폰번호</th>
	 	  	<td>
	 			<input name="phone" type="radio"/>SKT
             	<input name="phone" type="radio"/>LGU+
             	<input name="phone" type="radio"/>KT
             	<br/>
             	<select>
             		<option> 선택하세요 </option>
             		<option> 010 	</option>
             		<option> 011 	</option>
             		<option> 016 	</option>
             		<option> 018 	</option>
             	</select>
             	- <input type="text" size="6"/> - <input type="text" size="6"/> 
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>계좌번호</th>
	 	  	<td>
	 			<input name="accnum" type="text" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<td align="center">
	 			<input name="" type="button" value="가입" onclick="check()">
		    	<input name="" type="reset" value="다시쓰기">
	 		</td>
	 	</tr>
		</table>
</body>
</html>