<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="page-wrapper" style="text-align: center;">
	<div class="row">
		<hr width="500" size="2">
		<font size="5"><strong>회원정보</strong></font>
		<hr width="500" size="2">
	</div>
	<script type="text/javascript">
		function update() {
			location.href = "update.do"
		}
	</script>
	<table class="table table-striped table-bordered" border="1"
		width="600" align="center" cellpadding="3" cellspacing="1"
		style="width: 502px;">
		<c:choose>
			<c:when test="${user eq null}">
				<tr><td span='5'>로그인 하시오</td>
				</tr>
			</c:when>
			<c:otherwise>
				<tr>
					<td width='100' align='center'>회원번호</td>
					<td>${user.no}</td>
				</tr>
				<tr>
					<td align='center'>이름</td>
					<td>${user.name}</td>
				</tr>
				<tr>
					<td align='center'>ID</td>
					<td>${user.id}</td>
				</tr>
				<tr>
					<td align='center'>PWD</td>
					<td>${user.pwd}</td>
				</tr>
				<tr>
					<td align='center'>이메일</td>
					<td>${user.email}</td>
				</tr>
				<tr>
					<td align='center'>핸드폰번호</td>
					<td>${user.phone}</td>
				</tr>
				<tr>
					<td align='center'>계좌번호</td>
					<td>${user.accnum}</td>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
	<hr width='500' size='2' noshade>
	<b>
		<button class="btn default" onclick="update()">정보수정</button> |
		<button class="btn default" onclick="history.go(-1)">뒤로가기</button>
	</b>
	<hr width='500' size='2' noshade>
	<b>
		<button class="btn default" onclick="">회원탈퇴</button>
	</b>
</div>

