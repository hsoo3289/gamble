<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<body>
	<center>

		<div class="row">
			<hr width='700' size='2' noshade>
			<h2>충전 리스트</h2>
			<hr width='700' size='2' noshade>
		</div>
		<table class="table table-striped table-bordered" border="1"
			width="600" align="center" cellpadding="3" cellspacing="1"
			style="width: 702px;">
			<tr>
				<th style='text-align: center' width='15%'>충전금액</th>
				<th style='text-align: center' width='20%'>충전날짜</th>
				<th style='text-align: center' width='10%'>승인상태</th>
			</tr>
			<c:if test="${empty list}">
				<tr>
					<td align="center" colspan="5">데이터가 없음</td>
				</tr>
			</c:if>
			<c:forEach items="${list}" var="cash">
				<tr>
					<td align="center">${cash.CHARING}</td>
					<td align="center">${cash.CHARDATE}</td>
				<c:choose>
					<c:when test="${cash.APPROVE eq 1}">	
						<td align="center"><b class="text-danger">미승인</b></td>
					</c:when>
						<c:otherwise>
							<td align="center"><b class="text-success">승인</b></td>
						</c:otherwise>
				</c:choose>
				</tr>
			</c:forEach>
		</table>
	</center>
</body>
