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
				f.name.focus();
				return false;
			}
			if(f.id.value == "")
			{
				alert("ID를 입력해주세요!");
				f.id.focus();
				return false;
			}
			if(f.pwd.value == "")
			{
				alert("비밀번호를 입력해주세요!");
				f.pwd.focus();
				return false;
			}if(f.pwd2.value != f.pwd.value)
			{
				alert("비밀번호가 일치하지 않습니다!");
				f.pwd2.focus();
				return false;
			}
			if(f.email.value == "")
			{
				alert("e-mail을 입력해주세요!");
				f.email.focus();
				return false;
			}
			if(f.agency.value == "")
			{
				alert("통신사를 선택해주세요!");
				return false;
			}
			if(f.phone.value == "")
			{
				alert("핸드폰 번호를 입력해주세요!");
				f.phone.focus();
				return false;
			}
			if(f.accnum.value == "")
			{
				alert("계좌번호를 입력해주세요!");
				f.accnum.focus();
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
	<center style="margin-top: 15px;">
	<hr width="500" size="2" noshade color="black">
	     <font color="미정" size="5"><strong>회원 가입</strong></font>
	<hr width="500" size="2" noshade color="black">
	<form name="f" method="post" action="join.do">
		<table>
		<tr>
	 		<th>이름</th>
	 	  	<td>
	 			<input class="form-control" name="name" type="text" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>ID</th>
	 	  	<td>
	 			<input class="form-control" name="id" type="text" size="30" maxlength="30">
	 			&nbsp;
	 			
              	<input type="button" value="중복확인" onclick="idCheck()">
            </td>
	 	</tr>
	 	<tr>
	 		<th>PWD</th>
	 	  	<td>
	 			<input class="form-control" name="pwd" type="password" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>PWD 재입력</th>
	 	  	<td>
	 			<input class="form-control" name="pwd2" type="password" size="30" maxlength="30">
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>이메일</th>
	 	  	<td>
	 			<input class="form-control" name="email" type="text" style= "width: 135px;">&nbsp;
	 			<strong>@</strong>
	 			&nbsp;<input type="text" style= "width: 135px;">&nbsp;
	 			<select style="height: 24px;">
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
	 			<input name= "agency" type="radio"/>SKT
             	<input name= "agency" type="radio"/>LGU+
             	<input name= "agency" type="radio"/>KT
             	<br/>
             	<select>
             		<option> 010 </option>
             		<option> 011 </option>
             		<option> 016 </option>
             		<option> 018 </option>
             	</select>
             	- <input class="form-control" name="phone" type="text" size="5" style= "width: 50px;"/> 
             	- <input class="form-control" name="phone" type="text" size="5" style= "width: 50px;"/> 
	 		</td>
	 	</tr>
	 	<tr>
	 		<th>계좌번호</th>
	 	  	<td>
	 			<input class="form-control" name="accnum" type="text" size="30" maxlength="30">-를 뺀 숫자만 입력해주세요.
	 		</td>
	 	</tr>
	 	<tr>
	 		<td colspan="2"><div align="center"><br/>
	 			<input name="" type="button" value="가입" onclick="check()">
		    	<input name="" type="reset" value="다시쓰기">
	 		</div></td>
	 	</tr>
		</table>
	</form>	
	</center>
</body>
</html>