<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<script src="https://code.jquery.com/jquery-latest.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/json3/3.3.2/json3.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/map.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/stringBuffer.js"></script>

<script type="text/javascript">
	//폼에 데이터를 추가하기 위해 (파일을 전송하기 전 정보 유지
	var fd = new FormData();
	//파일 중복 업로드 방지용 맵을 선언한다.
	var map = new Map();
	//submit 버튼을 눌렀을 때 
	function submitFile() {
		console.log("submitFile()");
		//추가적으로 보낼 파라미터가 있으면 formData에 넣어준다. 
		//예를들어 , 게시판의 경우 게시글 제목 , 게시글 내용 등등
		checkValue(); 
		//		var json = fd.serializeObject();

		//		console.log(json);
		//ajax로 이루어진 파일 전송 함수를 수행시킨다.
		//insertBoard();
		sendFileToServer();
		$("#inputForm").submit();

	}
	//파일 전송 함수이다.
	var insertBoard = function() {
		//		console.log(json);
		var json = $("#inputForm").serializeObject();
		$.ajax({
			type : "post",
			url : '${pageContext.request.contextPath}/game/game_board/insert.paginglist.list.list', //Upload URL
			data : json,
		});
	}



	var sendFileToServer = function() {
		fd.append("parent_seq", ("${item.SEQ}"=="")? "${seq}":"${item.SEQ}");
		console.log("sendFileToServer fd:" + fd);
		$.ajax({
			type : "post",
			url : "${pageContext.request.contextPath}/file/game/game_board_file/upload.do", //Upload URL
			data : fd,

			contentType : false,
			processData : false,
			cache : false
		});
	}
	function handleFileUpload(files) {
		//파일의 길이만큼 반복하며 formData에 셋팅해준다.
		var megaByte = 1024 * 1024;
		for (var i = 0; i < files.length; i++) {
			if (map.containsValue(files[i].name) == false && (files[i].size / megaByte) <= 20) {
				fd.append("uploadfile", files[i]);
				//파일 중복 업로드를 방지하기 위한 설정
				map.put(files[i].name, files[i].name);
				// 파일 이름과 정보를 추가해준다.
				var tag = createFile(files[i].name, files[i].size);
				$('#fileTable').append(tag);
			} else {
				//중복되는 정보 확인 위해 콘솔에 찍음
				if ((files[i].size / megaByte) > 20) {
					alert(files[i].name + "은(는) \n 20메가 보다 커서 업로드가 할 수 없습니다.");
				} else {
					alert('파일 중복 : ' + files[i].name);
				}
			}
		}
	}
	// 태그 생성
	function createFile(fileName, fileSize) {
		var file = {
			name : fileName,
			size : fileSize,
			format : function() {
				var sizeKB = this.size / 1024;
				if (parseInt(sizeKB) > 1024) {
					var sizeMB = sizeKB / 1024;
					this.size = sizeMB.toFixed(2) + " MB";
				} else {
					this.size = sizeKB.toFixed(2) + " KB";
				}
				//파일이름이 너무 길면 화면에 표시해주는 이름을 변경해준다.
				if (name.length > 70) {
					this.name = this.name.substr(0, 68) + "...";
				}
				return this;
			},
			tag : function() {
				var tag = new StringBuffer();
				//				tag.append('<tr>');
				//				tag.append('<td>' + this.name + '</td>');
				//				tag.append('<td>' + this.size + '</td>');
				//				tag.append("<td><button id='" + this.name + "' onclick='delFile(this)'>취소</button></td>");
				//				tag.append('</tr>');
				tag.append('<b>');
				tag.append(this.name + "&nbsp;");
				tag.append('<a style="float: right; margin-right: 15px;" class="glyphicon glyphicon-remove" onclick="delFile(this)" id=' + this.name + '></a><br/>');
				tag.append('</b>');

				return tag.toString();
			}
		}
		return file.format().tag();
	}
	//업로드 할 파일을 제거할 때 수행되는 함수
	function delFile(e) {
		//선택한 창의 아이디가 파일의 form name이므로 아이디를 받아온다.
		var formName = e.id;

		//form에서 데이터를 삭제한다.
		fd.delete(formName);

		//맵에서도 올린 파일의 정보를 삭제한다.
		map.remove(formName);
		// tr을 삭제하기 위해
		$(e).parents('b').remove();
	//alert('삭제 완료!');
	}
	$(document).ready(function() {
		var objDragDrop = $(".dragDropDiv");
		// div 영역으로 드래그 이벤트호출
		$(".dragDropDiv").on("dragover", function(e) {
			e.stopPropagation();
			e.preventDefault();
			$(this).css('border', '2px solid red');
		});
		// 해당 파일 드랍시 호출 이벤트
		$(".dragDropDiv").on("drop", function(e) {
			$(this).css('border', '2px solid green');
			//브라우저로 이동되는 이벤트를 방지하고 드랍 이벤트를 우선시 한다.
			e.preventDefault();
			//DROP 되는 위치에 들어온 파일 정보를 배열 형태로 받아온다.
			var files = e.originalEvent.dataTransfer.files;
			//DIV에 DROP 이벤트가 발생 했을 때 다음을 호출한다.
			handleFileUpload(files);
		});
		// div 영역빼고 나머지 영역에 드래그 원래색변경
		$(document).on('dragover', function(e) {
			e.stopPropagation();
			e.preventDefault();
			objDragDrop.css('border', '2px solid green');
		});
	});

	$.fn.serializeObject = function() {
		var o = {};
		var a = this.serializeArray();
		$.each(a, function() {
			if (o[this.name] !== undefined) {
				if (!o[this.name].push) {
					o[this.name] = [ o[this.name] ];
				}
				o[this.name].push(this.value || '');
			} else {
				o[this.name] = this.value || '';
			}
		});
		return o;
	};


	function checkValue() {
		if (document.inputForm.subject.value == "") {
			alert("제목이 입력 되지 않았습니다.");
			document.input.subject.focus();
			return false;
		}
		if (document.inputForm.subject.value == "") {
			alert("제목이 입력 되지 않았습니다.");
			document.input.subject.focus();
			return false;
		}
		if (document.inputForm.subject.value == "") {
			alert("제목이 입력 되지 않았습니다.");
			document.input.subject.focus();
			return false;
		}
		if (document.inputForm.content.value == "") {
			alert("내용이 없습니다.");
			document.input.content.focus();
			return false;
		}
	}

	function deletefile(seq) {
		console.log("delete");
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/file/game/game_board_file/delete.do",
			data : {
				"seq" : seq,
			},
			contentType : "html",
			success : function(response) {
				console.log(response);
				filelist(${item.SEQ});
			}
		});

	}

	function filelist(seq) {
		console.log("filelist");
		$.ajax({
			type : "GET",
			url : "${pageContext.request.contextPath}/file/game/game_board_file/list.list.file_list/ajax_view",
			data : {
				"parent_seq" : seq
			},

			contentType : "html",
			success : function(response) {
				console.log(response);
				console.log(response);
				$("#attachmentarea").html(response);
			}
		});

	}
</script>

<body onload="filelist(${item.SEQ})">
	<center>
		<hr width="600" size="2" noshade>
		<h2>Simple Board with Model2</h2>
		<a class="btn btn-default btn-xs"
			href='${pageContext.request.contextPath}'>INDEX</a>
		<hr width="600" size="2" noshade>
	</center>

	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">WRITE ARTICLE</h1>
		</div>
	</div>

	<div class="panel panel-default">

		<div class="panel-heading">
			<p>
				WRITE
			</p>
		</div>

		<div class="panel-body">

			<div class="row">

				<div class="col-lg-12">
					<c:choose>
						<c:when
							test="${item ne null && item.SEQ ne null && item.SEQ ne ''}">
							<form id="inputForm" name="inputForm" method="post"
								action="update.list.list.list" enctype="multipart/form-data"
								style="width: full">
						</c:when>
						<c:otherwise>
							<form id="inputForm" name="inputForm" method="post"
								action="insert.list.list.list" enctype="multipart/form-data"
								style="width: full">
						</c:otherwise>
					</c:choose>



					<div class="form-group">
						<label>NAME</label> <input type="text" name="id"
							id="id" value="${item.NAME}" size="60"
							class="form-control">
						<p class="help-block">이름을 입력 하세요.</p>
					</div>
					
					<div class="form-group">
						<label>PASSWORD</label> <input type="password" name="password"
							id="password" value="" size="60"
							class="form-control">
						<p class="help-block">비번을 입력 하세요.</p>
					</div>

					<div class="form-group">
						<label>SUBJECT</label> <input type="text" name="subject"
							id="subject" value="${item.SUBJECT}" size="60"
							class="form-control">
						<p class="help-block">제목을 입력 하세요.</p>
					</div>
					<div class="form-group">
						<label>CONTENT</label>
						<textarea name="content" id="content"
							class="form-control dragDropDiv" rows="5" style="width: full">${item.CONTENT}</textarea>
					</div>
					<div class="form-group">
						<div id="attachmentarea"></div>
						<div id='fileTable'></div>

					</div>

					<div class="form-group" align="center">
						<input type="button" class="btn btn-outline btn-success"
							name="submit_button" value="전송하기" onclick="submitFile()">
						&nbsp;&nbsp;&nbsp; <input type="button"
							class="btn btn-outline btn-primary" name="submit_button"
							value="글목록" onclick="location.href='list.list.list'">
						&nbsp;&nbsp;&nbsp; <input type="reset"
							class="btn btn-outline btn-warning" value="다시입력">

					</div>

					<div>

						<c:choose>
							<c:when test="${seq ne null}">
								<input type="hidden" value="${seq}" name="seq">
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${item.SEQ}" name="seq">
							</c:otherwise>
						</c:choose>


						<c:choose>
							<c:when test="${pre_param.parent_seq eq null}">
								<input type="hidden" value="-1" name="parent_seq"
									id="parent_seq">
							</c:when>
							<c:otherwise>
								<input type="hidden" value="${pre_param.parent_seq}"
									name="parent_seq" id="parent_seq">
							</c:otherwise>
						</c:choose>

					</div>
					</form>

					<button onclick="sendFileToServer()">파일전송</button>
				</div>
			</div>
		</div>
	</div>

</body>
</html>