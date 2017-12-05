<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<html>
<meta charset='utf-8'>

<head>

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>Board Item</title>

<!-- Bootstrap Core CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">

<!-- Timeline CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/dist/css/timeline.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/dist/css/sb-admin-2.css"
	rel="stylesheet">

<!-- Morris Charts CSS -->
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/morrisjs/morris.css"
	rel="stylesheet">

<!-- Custom Fonts -->
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript">

	function delete_reply(seq) {
		console.log("delete_reply");
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/board/reply/delete.void",
			data : {
				"seq" : seq,
				"parent_seq" : '${item.seq}'
			},

			contentType : "html",
			success : function(reply) {
				//			console.log(reply);
				$("#reply_div").html(reply);
			}
		});
	}

	function insert_reply() {
		console.log("insert_reply");
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/board/reply/insert.void",
			data : {
				"writer_seq" : "${user.no}",
				"parent_seq" : "${item.seq}",
				"reply" : $("#reply_input").val()
			},

			contentType : "html",
			success : function(reply) {
				//				console.log(reply);
				$("#reply_div").html(reply);
			}
		});
		$("#reply_input").val("");
	}
	function init(seq) {
		viewcount(seq);
		replylist(seq);
		filelist(seq);
	}
	
	function filelist(seq){
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/board/file/list.list",
			data : {
				"parent_seq" : seq
			},

			contentType : "html",
			success : function(response) {
				console.log(response);
				$(response).removeClass("glyphicon glyphicon-remove");
				console.log(response);
				$("#attachmentarea").html(response);
			}
		});

	}

	function viewcount(seq) {
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/board/board/count.count",
			data : {
				"seq" : seq
			},

			contentType : "html",
			success : function(reply) {
				var html = "ARTICLE NO : ${item.seq}&nbsp;&nbsp;VIEWS : "+reply;
				console.log(html);
				$("#viewcount").html(html);
			}
		});
	}

	function replylist(seq) {
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/board/reply/list.list",
			data : {
				"parent_seq" : seq
			},

			contentType : "html",
			success : function(reply) {
				//				console.log(reply);
				$("#reply_div").html(reply);
			}
		});
	}

	function board_like_count(seq) {
		console.log(seq);
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/board/board/like_count.count",
			data : {
				"seq" : seq
			},
			contentType : "",
			success : function(reply) {
				console.log(reply);
				$("#board_like_button").html("&nbsp;" + reply);
			}
		});
		console.log("aaa");
	}

	function reply_like_count(seq) {
		var xhttp;

		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var id = "reply_like_button_" + seq;
				document.getElementById(id).innerHTML = "&nbsp;" + this.responseText;
			}
		};
		var url = "../reply/like_count.count?seq=" + seq;
		xhttp.open("GET", url, true);
		xhttp.send();

	}

	function reply_hate_count(seq) {
		var xhttp;
		xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var id = "reply_hate_button_" + seq;
				document.getElementById(id).innerHTML = "&nbsp;" + this.responseText;
			}
		};
		var url = "../reply/hate_count.count?seq=" + seq;
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	function updateform() {
		location.href = "update.void?seq=${item.seq}&subject=${item.subject}&content=${item.content}";
	}
</script>

</head>

<body onload="init(${item.seq})">
	<div id="page-wrapper" style="min-height: 828px; align: center;">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">ARTICLE</h1>

			</div>
		</div>

		<div class="panel panel-default">

			<div class="panel-heading">
				작성자: ${item.name}&nbsp; <a
					class="btn btn-outline btn-primary btn-xs"
					href=${pageContext.request.contextPath}>INDEX</a> &nbsp; <a
					class="btn btn-outline btn-primary btn-xs" href='insert.void'>글쓰기</a>&nbsp;
				<a class="btn btn-outline btn-primary btn-xs"
					href='javascript:history.back()'>이전</a> <small
					class="pull-right text-muted"> 작성일:${item.cdate}&nbsp;<c:if
						test="${item.rdate ne null}">
						<br />수정일:${item.rdate}</c:if>
				</small>
			</div>
			<div class="panel-body">

				<label>SUBJECT</label>
				<div class="panel panel-default">
					<div style="margin: 5px; margin-left: 15px">${item.subject}</div>
				</div>

				<label>CONTENT</label>
				<div class="panel panel-default">
					<div style="margin: 5px; margin-left: 15px; min-height: 100px;">${item.content}</div>
				</div>

				<label>ATTACHMENT</label>
				<div id="attachmentarea"></div>
				<p id="viewcount" class="text-muted">ARTICLE NO : ${item.seq}&nbsp;&nbsp;VIEWS
					: ${item.count}</p>
			</div>
		</div>



		<div class="row" style="float: center;">
			<div style="margin: 5px; margin-left: 5px; text-align: center;">
				<form id="deleteform" action="delete.void?seq=${item.seq}"
					method="post"></form>
				<c:choose>
					<c:when test="${item.writer_seq eq user.no}">

						<a class="btn btn-outline btn-default btn-sm"
							style="margin-right: 5px; margin-right: 5px;" href="javascript:;"
							onclick="updateform()">수정</a>

						<a style="margin-left: 5px; margin-right: 5px;"
							class="btn btn-outline btn-default btn-sm" href="javascript:;"
							onclick="document.getElementById('deleteform').submit();">삭제</a>


					</c:when>
					<c:otherwise>
						<a class="btn btn-outline btn-default btn-sm disabled"
							style="margin-right: 5px; margin-right: 5px;">수정</a>
						<a style="margin-left: 5px; margin-right: 5px;"
							class="btn btn-outline btn-default btn-sm disabled">삭제</a>
					</c:otherwise>
				</c:choose>


				<a style="margin-left: 5px; margin-right: 5px;"
					class="btn btn-outline btn-default btn-sm" href='list.list'>목록</a>
				<a style="margin-left: 5px; margin-right: 5px;"
					class="btn btn-outline btn-default btn-sm"
					href='insert.void?parent_seq=${item.seq}'>답변</a> <a
					style="margin-left: 5px; margin-right: 5px;"
					class="btn btn-outline btn-danger btn-sm"
					onclick='board_like_count(${item.seq})'> <i
					id="board_like_button" class="fa fa-heart">&nbsp;${item.like_count}</i>
				</a>

			</div>
		</div>
		</b>

		<hr width='600' size='2' noshade>

		<form method="post" name='f1' style="text-align: right;">
			<input class="btn btn-outline btn-default btn-sm" type="text"
				id="reply_input" name="reply" style="text-align: left;width=60%">
			<input type="button" value="REPLY"
				class="btn btn-outline btn-default btn-sm" onclick="insert_reply()">
		</form>

		<!-- /.panel -->
		<div class="chat-panel panel panel-default">
			<div class="panel-heading">
				<i class="fa fa-comments fa-fw"></i> Reply
			</div>
			<!-- /.panel-heading -->


			<div class="panel-body">
				<ul class="chat">
					<div id="reply_div" name="id" value="aaa"></div>
				</ul>
			</div>
		</div>
	</div>
	</div>
	</div>
	<!-- /#wrapper -->

	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>

	<!-- Morris Charts JavaScript-->
	<!--
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/raphael/raphael-min.js"></script>
		 
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/morrisjs/morris.min.js"></script>
		 
	<script
		src="${pageContext.request.contextPath}/bootstrap/js/morris-data.js"></script>
		-->

	<!-- Custom Theme JavaScript -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/dist/js/sb-admin-2.js"></script>
</body>
</html>


