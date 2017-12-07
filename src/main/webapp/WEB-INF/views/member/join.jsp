<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<script type="text/javascript">
	function check() {
		if (f.name.value == "") {
			alert("이름을 입력해주세요!");
			f.name.focus();
			return false;
		}
		if (f.id.value == "") {
			alert("ID를 입력해주세요!");
			f.id.focus();
			return false;
		}
		if (f.pwd.value == "") {
			alert("비밀번호를 입력해주세요!");
			f.pwd.focus();
			return false;
		}
		if (f.pwd2.value != f.pwd.value) {
			alert("비밀번호가 일치하지 않습니다!");
			f.pwd2.focus();
			return false;
		}
		if (f.email.value == "") {
			alert("e-mail을 입력해주세요!");
			f.email.focus();
			return false;
		}
		if (f.phone.value == "") {
			alert("핸드폰 번호를 입력해주세요!");
			f.phone.focus();
			return false;
		}
		if (f.accnum.value == "") {
			alert("계좌번호를 입력해주세요!");
			f.accnum.focus();
			return false;
		}
		if('${user}' != null){
			f.action="update.do"
		}
		if (f.submit()) {
			alert("회원가입 성공!");
		}
	}
	function move_focus(id) {
		if (event.keyCode == 13) document.getElementById(id).focus();
		return;
	}
</script>

		<body onload="f.name.focus()">
	
<div class="page-wrapper" style="text-align: center;">
	<div class="row">
		<hr width="500" size="2">
		<c:choose>
			<c:when test="${user eq null}">
				<font size="5"><strong>회원 가입</strong></font>
			</c:when>
		 	<c:otherwise>
		 		<font size="5"><strong>정보 수정</strong></font>
		 	</c:otherwise>
		</c:choose>
		<hr width="500" size="2">
	</div>
	
	<form name="f" method="post" action="join.do">
		<table class="table table-striped table-bordered" border="1"
			width="600" align="center" cellpadding="3" cellspacing="1"
			style="width: 502px;">
			<tr>
				<th>이름</th>
				<td>
			<c:choose>
				<c:when test="${user.name eq null}">
					<input class="form-control" id="name" name="name"
					  placeholder="한글만 입력해주세요" type="text" size="30" maxlength="30"
						style="width: 206px;" onkeypress="move_focus('id')">
				</c:when>
					<c:otherwise>
							<input class="form-control" id="name" name="name"
								value="${user.name}" type="text" size="30" maxlength="30"
								style="width: 206px;" disabled>
					</c:otherwise>
			</c:choose>
				</td>
			</tr>
			<tr>
				<th>ID</th>
				<td>
				<c:choose>
						<c:when test="${user.id eq null}">
							<input class="form-control" id="id" name="id"
								placeholder="ID를 입력해주세요" onkeyup="idCheck(this.value)" type="text" size="30" maxlength="30"
								style="width: 206px;" onkeypress="move_focus('pwd')">
						</c:when>
						<c:otherwise>
							<input class="form-control" id="id" name="id" value="${user.id}"
								type="text" size="30" maxlength="30" style="width: 206px;"
								disabled>
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>PWD</th>
				<td><c:choose>
						<c:when test="${user.pwd eq null}">
							<input class="form-control" id="pwd" name="pwd"
								placeholder="PWD를 입력해주세요" type="password" size="30"
								maxlength="30" style="width: 206px;"
								onkeypress="move_focus('pwd2')">
						</c:when>
						<c:otherwise>
							<input class="form-control" id="pwd" name="pwd" value="${user.pwd}"
								type="password" size="30" maxlength="30" style="width: 206px;"
								onkeypress="move_focus('pwd2')">
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>PWD 재입력</th>
				<td><c:choose>
						<c:when test="${user.pwd eq null}">
							<input class="form-control" id="pwd2" name="pwd2"
								placeholder="PWD를 재입력해주세요" type="password" size="30"
								maxlength="30" style="width: 206px;"
								onkeypress="move_focus('email')">
						</c:when>
						<c:otherwise>
							<input class="form-control" id="pwd2" name="pwd2" value="${user.pwd}"
								type="password" size="30" maxlength="30" style="width: 206px;"
								onkeypress="move_focus('email')">
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>이메일</th>
				<td><c:choose>
						<c:when test="${user.email eq null}">
							<input class="form-control" id="email" name="email"
								placeholder="E-mail을 입력해주세요" type="text" size="30"
								maxlength="30" style="width: 206px;"
								onkeypress="move_focus('phone')">
						</c:when>
						<c:otherwise>
							<input class="form-control" id="email" name="email"
								value="${user.email}" type="text" size="30" maxlength="30"
								style="width: 206px;" onkeypress="move_focus('phone')">
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>핸드폰번호</th>
				<td><c:choose>
						<c:when test="${user.phone eq null}">
							<input class="form-control" id="phone" name="phone"
								placeholder="핸드폰 번호를 입력해주세요" type="text" size="30"
								maxlength="30" style="width: 206px;"
								onkeypress="move_focus('accnum')">
						</c:when>
						<c:otherwise>
							<input class="form-control" id="phone" name="phone"
								value="${user.phone}" type="text" size="30" maxlength="30"
								style="width: 206px;" onkeypress="move_focus('accnum')">
						</c:otherwise>
					</c:choose></td>
			</tr>
			<tr>
				<th>계좌번호</th>
				<td>
				<c:choose>
						<c:when test="${user.accnum eq null}">
							<input class="form-control" id="accnum" name="accnum"
								placeholder="-를 뺀 숫자만 입력해주세요" type="text" size="30"
								maxlength="30" style="width: 206px;"
								onkeypress="move_focus('join')">
						</c:when>
						<c:otherwise>
							<input class="form-control" id="accnum" name="accnum"
								value="${user.accnum}" type="text" size="30" maxlength="30"
								style="width: 206px;" onkeypress="move_focus('join')">
						</c:otherwise>
					</c:choose></td>
			</tr>
				<tr>
					<td colspan="2">
					<div align="center">
				 		<br/>
						<input id="join" class="btn default" name="" type="button" value="가입" onclick="submit()">
						<input class="btn default" name="" type="reset" value="다시쓰기">
				 	</div>
					</td>
				</tr>
			</table>
		</form>
	
</div>