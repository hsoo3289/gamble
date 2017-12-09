<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<html>
<head>
<title>간단한 게시판</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
	var flag = false;
	function check() {
		if (register_form.name.value == "") {
			alert("이름을 입력해 주세요..");
			return false;
		}
		if (register_form.id.value == "") {
			alert("아이디를 입력해 주세요..");
			return false;
		}
		if (register_form.pwd.value == "") {
			alert("비밀번호를 입력해 주세요..");
			return false;
		}

		if (register_form.email.value == "") {
			alert("이메일을 입력해 주세요..");
			return false;
		}
		if (!flag) {
			alert("아이디 중복 확인 하세요.");
			return false;
		}

		if (!pwdflag) {
			alert("패스워드가 일치하지 않습니다.");
			return false;
		}
		register_form.submit();
	}
	function pwdCheck() {
		if (register_form.pwd.value != register_form.pwd2.value) {
			pwdflag = false;
			document.getElementById("pwdcheckmsg").innerHTML = "<p class='text-danger'>pwd 불일치</p>";
		} else if (register_form.pwd.value.length < 4 || register_form.pwd.value.length < 4) {
			pwdflag = false;
			document.getElementById("pwdcheckmsg").innerHTML = "<p class='text-danger'>패스워드가 4자 미만</p>";
		} else {
			pwdflag = true;
			document.getElementById("pwdcheckmsg").innerHTML = "<p class='text-success'>pwd 일치</p>";
		}
	}

	function idCheck(id){
		$.ajax({
			type: 'GET',
			url : "",
			data : {"id":id},
			success: function(data){
				if(data){
					alert("사용할수 없는 아이디 입니다.");
				}else{
					alert("사용 가능한 아이디 입니다.");
				}
			}
		});
	}
	function move_focus(id){
		if(event.keyCode == 13) document.getElementById(id).focus();
		return;
	}
	
	
</script>
<meta charset='utf-8'>
</head>
<body onload="id.focus()">
	
	<div id="page-wrapper" style="min-height: 480px; margin: 0 20% 2% 20%; align:center; ">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">REGISTER</h1>
			</div>
		</div>

		<div class="panel panel-default">

			<div class="panel-heading">REGISTER FORM</div>
			<div class="panel-body">

				<div class="row">

					<div class="col-lg-12">
						<form name="register_form" method="post" action="register.do"
							style="width: full">
							<div class="form-group">

								<label>ID</label> <input id="id" name="id" class="form-control"
									onkeyup="idCheck(this.value)" onkeypress="move_focus('nick')">
								<div id="idcheck">
									<p class="text-muted">ID는 4자 이상</p>
								</div>
							</div>
							<div class="form-group">
								<label>NICK</label> <input id="nick" name="nick" class="form-control" onkeypress="move_focus('pwd')">
							</div>
							<div class="form-group">
								<label>PASSWORD</label> <input id="pwd" name="pwd" type="password" onkeypress="move_focus('pwd2')"
									class="form-control" onkeyup="pwdCheck()">
							</div>
							<div class="form-group">
								<label>PASSWORD CHECK</label> <input id="pwd2" name="pwd2" type="password" onkeypress="move_focus('name')"
									class="form-control" onkeyup="pwdCheck()">
								<div id="pwdcheckmsg">
									<p class="text-muted">패스워드는 4자 이상으로 작성</p>
								</div>
							</div>

							<div class="form-group">
								<label>NAME</label> <input name="name" id="name" class="form-control" onkeypress="move_focus('ssn')">
							</div>

							<div class="form-group">
								<label>SOCIAL SECURITY NUMBER</label> <input name="ssn" id="ssn" onkeypress="move_focus('email')"
									class="form-control">
							</div>

							<div class="form-group">
								<label>E-MAIL</label> <input name="email" id="email" class="form-control" onkeypress="move_focus('phone')">
							</div>

							<div class="form-group">
								<label>CONTACT</label> <input name="phone" id="phone" class="form-control" onkeypress="move_focus('submit_button')">
							</div>

							<div class="form-group" style="text-align: center;">

								<input type="button" id="submit_button" class="btn btn-outline btn-success"
									style="margin: 10px" value="전송하기" onclick="check(this)">
								&nbsp;&nbsp;&nbsp; <input type="reset"
									class="btn btn-outline btn-warning" style="margin: 10px"
									value="다시입력">
							</div>
					</div>

					<div>
						<c:choose>
							<c:when test="${parent_seq eq null}">
								<input type="hidden" value="-1" name="parent_seq">
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${parent_seq}" name="parent_seq">
							</c:otherwise>
						</c:choose>
						<input type="hidden" value="${user.no}" name="writer_seq">
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>