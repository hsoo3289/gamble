<%@page contentType="text/html;charset=utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script>
	function loadpage(){
		$("#game_area").load("${pageContext.request.contextPath}/game/ladder.html");
	}

</script>
<body onload="loadpage()">
	<div id="game_area"></div>
</body>