<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script type="text/javascript">

	function delete_reply(seq) {
		console.log("delete_reply");
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/game/game_board_reply/delete.list.list.reply_list/ajax_view",
			data : {
				"seq" : seq,
				"parent_seq" : '${item.SEQ}'
			},
			success : function(reply) {
				$("#reply_div").html(reply);
			}
		});
	}

	function insert_reply() {
		console.log("insert_reply");
		var writer_seq = '${user}' == "" ? '-1' : '${user.no}';
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/game/game_board_reply/insert.list.list.reply_list/ajax_view",
			data : {
				"writer_seq" : writer_seq,
				"parent_seq" : "${item.SEQ}",
				"reply_content" : $("#reply_input").val()
			},

			success : function(reply) {
				console.log("aaa");
				console.log(reply);
				$("#reply_div").html(reply);
			}
		});
		$("#reply_input").val("");
	}
	function init(seq) {
		//viewcount(seq);
		replylist(seq);
	//filelist(seq);
	}

	function filelist(seq) {
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/game/game_board_reply/list.list.ajax",
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
			url : "view_count.count.count",
			data : {
				"seq" : seq
			},

			success : function(reply) {
				console.log(reply);
				$("#viewcount").html(reply);
			}
		});
	}

	function replylist(seq) {
		$.ajax({
			type : "GET",
			url : "../game_board_reply/list.list.reply_list/ajax_view",
			data : {
				"parent_seq" : seq
			},

			success : function(reply) {
				console.log(reply);
				$("#reply_div").html(reply);

			}
		});
	}

	function board_like_count(seq) {
		console.log(seq);
		$.ajax({
			type : "get",
			url : "like_count.count.count",
			data : {
				"seq" : seq
			},
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
		var url = "../game_board_reply/like_count.get_like_count.count.ajax?seq=" + seq;
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
</script>
<body onload="init(${item.SEQ})">
	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">ARTICLE</h1>
		</div>
	</div>

	<div class="panel panel-default">

		<div class="panel-heading">
			작성자: ${item.name}&nbsp; <a class="btn btn-outline btn-primary btn-xs"
				href=${pageContext.request.contextPath}>INDEX</a> &nbsp; <a
				class="btn btn-outline btn-primary btn-xs" href='nextseq.seq.insert'>글쓰기</a>&nbsp;
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
				<div style="margin: 5px; margin-left: 15px">${item.SUBJECT}</div>
			</div>

			<label>CONTENT</label>
			<div class="panel panel-default">
				<div style="margin: 5px; margin-left: 15px; min-height: 100px;">${item.CONTENT}</div>
			</div>

			<label>ATTACHMENT</label>
			<div id="attachmentarea"></div>
			<p id="viewcount" class="text-muted">ARTICLE NO :
				${item.SEQ}&nbsp;&nbsp;VIEWS : ${item.VIEW_COUNT}</p>
		</div>
	</div>



	<div class="row" style="float: center;">
		<div style="margin: 5px; margin-left: 5px; text-align: center;">
			<form id="deleteform" action="delete.list.list.list?seq=${item.SEQ}"
				method="post"></form>
			<c:choose>
				<c:when test="${item.WRITER_SEQ eq user.no || user eq null}">

					<a class="btn btn-outline btn-default btn-sm"
						style="margin-right: 5px; margin-right: 5px;"
						href="item.item.insert?seq=${item.SEQ}">수정</a>

					<a style="margin-left: 5px; margin-right: 5px;"
						class="btn btn-outline btn-default btn-sm"
						href="delete.list.list.list?seq=${item.SEQ}"}>삭제</a>


				</c:when>
				<c:otherwise>
					<a class="btn btn-outline btn-default btn-sm disabled"
						style="margin-right: 5px; margin-right: 5px;">수정</a>
					<a style="margin-left: 5px; margin-right: 5px;"
						class="btn btn-outline btn-default btn-sm disabled">삭제</a>
				</c:otherwise>
			</c:choose>


			<a style="margin-left: 5px; margin-right: 5px;"
				class="btn btn-outline btn-default btn-sm" href='list.list.list'>목록</a>
			<a style="margin-left: 5px; margin-right: 5px;"
				class="btn btn-outline btn-default btn-sm"
				href='nextseq.seq.insert?parent_seq=${item.SEQ}'>답변</a> <a
				style="margin-left: 5px; margin-right: 5px;"
				class="btn btn-outline btn-danger btn-sm"
				onclick='board_like_count(${item.SEQ})'> <i
				id="board_like_button" class="fa fa-heart">&nbsp;${item.LIKE_COUNT}</i>
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
</body>