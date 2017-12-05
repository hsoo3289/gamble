<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="fileDTO">
	<a
		href='${pageContext.request.contextPath}/board/file/download.void?seq=${fileDTO.seq}'>${fileDTO.ofname}</a>
	
		<a style="float: right; margin-right: 15px;"
			class="glyphicon glyphicon-remove"
			onclick="deletefile(${fileDTO.seq})" ></a>
	
	
	<br />
</c:forEach>