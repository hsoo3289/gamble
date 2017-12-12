<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach items="${list}" var="fileDTO">
	<a
		href='${pageContext.request.contextPath}/file/${path.serviceName}/${path.dbName}/download.do?seq=${fileDTO.SEQ}'>${fileDTO.OFNAME}</a>
	
		<a style="float: right; margin-right: 15px;"
			class="glyphicon glyphicon-remove"
			onclick="deletefile(${fileDTO.SEQ})" ></a>
	
	
	<br />
</c:forEach>