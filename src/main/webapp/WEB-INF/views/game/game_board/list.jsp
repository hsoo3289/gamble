<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>SB Admin 2 - Bootstrap Admin Theme</title>
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/bootstrap/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/metisMenu/dist/metisMenu.min.css"
	rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css"
	rel="stylesheet">
<!-- 
<link
	href="/bootstrap/bower_components/datatables-responsive/css/dataTables.responsive.css"
	rel="stylesheet">
	-->
<link href="${pageContext.request.contextPath}/bootstrap/dist/css/sb-admin-2.css" rel="stylesheet">
<link
	href="${pageContext.request.contextPath}/bootstrap/bower_components/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<div id="page-wrapper">
		<div class="row">
			<div class="col-lg-12">
				<h1 class="page-header">BOARD</h1>
			</div>
			<!-- /.col-lg-12 -->
		</div>
		<div class="row">
			<div class="col-lg-12">
				<div class="panel panel-default">
					<div class="panel-heading">
						SIMPLE BOARD WITH SPRING &nbsp; <a
							class="btn btn-outline btn-primary btn-xs" href='${pageContext.request.contextPath}'>인덱스</a>
						&nbsp; <a class="btn btn-outline btn-primary btn-xs"
							href='insert.void'>글쓰기</a> <br />
					</div>
					<!-- /.panel-heading -->
					<div class="panel-body">
						<div class="dataTable_wrapper"></div>
						<div id="dataTables-example_wrapper"
							class="dataTables_wrapper form-inline dt-bootstrap no-footer">
							<div class="row">
								<div class="col-sm-6">
									<div class="dataTables_length" id="dataTables-example_length">
										<form name="input" method="post" action="list.list">
											<label>Show <select name="pageSize"
												onChange="submit()" class="form-control input-sm"
												style="width: auto">
													<c:forEach begin='5' end='20' step='5' var='i'>
														<c:choose>
															<c:when test='${page.pageSize ne i}'>
																<option value='${i}'>페이지 SIZE ${i}</option>
															</c:when>
															<c:otherwise>
																<option value='${i}' selected>페이지 SIZE ${i}</option>
															</c:otherwise>
														</c:choose>
													</c:forEach>
											</select>
											</label>
										</form>
									</div>
								</div>

								<div class="col-sm-6">
									<div class="dataTables_length" id="dataTables-example_length"
										style="float: right;">
										<form name="input" method="post" action="list.list">
											<label>Search: <select name="col"
												style="width: 70px;" class="form-control input-sm">
													<option value='SUBJECT'>제목</option>
													<option value='CONTENT'>내용</option>
													<option value='NAME'>글쓴이</option>
													<option value='SEQ'>글번호</option>
											</select> <input name="keyWord" type="search" placeholder="검색"
												style="width: auto;" class="form-control input-sm">

												<button class="btn btn-outline btn-primary btn-sm"
													action="check_keyword()" value="true" method="POST"
													name="searchMode">검색</button> <c:if
													test="${page.searchMode}">
													<button class="btn btn-outline btn-primary btn-sm"
														action="list.list" value="false" method="POST"
														name="searchMode">취소</button>
												</c:if>

											</label>

										</form>
									</div>
								</div>
							</div>
							<div class="row">

								<div class="col-sm-12">
									<table
										class="table table-striped table-bordered table-hover dataTable no-footer"
										id="dataTables-example" role="grid"
										aria-describedby="dataTables-example_info">
										<thead>
											<tr role="row">
												<th tabindex="0" rowspan="1" colspan="1"
													style="width: 50px; text-align: center; vertical-align: middle; padding: 5px;">번호</th>
												<th tabindex="0" rowspan="1" colspan="1"
													style="width: 201px; text-align: center; vertical-align: middle; padding: 5px;">글쓴이</th>

												<th tabindex="0" rowspan="1" colspan="1"
													style="width: 1000px; text-align: center; vertical-align: middle; padding: 5px;">제목</th>
												<th tabindex="0" rowspan="1" colspan="1"
													style="width: 201px; text-align: center; vertical-align: middle; padding: 5px;">작성일</th>
												<th tabindex="0" rowspan="1" colspan="1"
													style="width: 201px; text-align: center; vertical-align: middle; padding: 5px;">수정일</th>
												<th tabindex="0" rowspan="1" colspan="1"
													style="width: 201px; text-align: center; vertical-align: middle; padding: 5px;">조회수<br />(추천)
												</th>
												<c:if test="${user.no eq 1}">
													<th tabindex="0" rowspan="1" colspan="1"
														style="width: 201px; text-align: center; vertical-align: middle; padding: 5px;">첨부</th>
													<th tabindex="0" rowspan="1" colspan="1"
														style="width: 50px; text-align: center; vertical-align: middle; padding: 5px;">원글</th>
													<th tabindex="0" rowspan="1" colspan="1"
														style="width: 50px; text-align: center; vertical-align: middle; padding: 5px;">레벨</th>
													<th tabindex="0" rowspan="1" colspan="1"
														style="width: 201px; text-align: center; vertical-align: middle; padding: 5px;">삭제</th>
												</c:if>
											</tr>
										</thead>
										<tbody>

											<c:if test="${empty list}">
												<tr class="gradeA odd" role="row">
													<td align='center' colspan="4">데이터가 없음</td>
												</tr>
											</c:if>
											<c:forEach items='${list}' var='dto'>
												<tr class="gradeA odd" role="row">
													<td style="text-align: center; vertical-align: middle;">${dto.seq}</td>
													<td style="text-align: center; vertical-align: middle;">${dto.name}</td>

													<td style="vertical-align: middle;"><c:forEach
															begin='2' end='${dto.level}'>·</c:forEach> <c:if
															test='${dto.level ne 1}'>
															<i class="glyphicon glyphicon-hand-right" />
														</c:if><a href="/spring/board/board/item.item?seq=${dto.seq}">
															${dto.subject}</a></td>
													<td style="text-align: center; vertical-align: middle;">${dto.cdate}</td>
													<td style="text-align: center; vertical-align: middle;">${dto.rdate}</td>
													<td style="text-align: center; vertical-align: middle;">${dto.count}(${dto.like_count})</td>
													<c:if test="${user.no eq 1}">
														<td style="text-align: center; vertical-align: middle;">${dto.f_name}</td>
														<td style="text-align: center; vertical-align: middle;">${dto.parent_seq}</td>
														<td style="text-align: center; vertical-align: middle;">${dto.level}</td>
														<td style="text-align: center; vertical-align: middle;">
															<span style="float: center;"
															class="glyphicon glyphicon-remove"
															onclick="location.href='/spring/board/delete.do?seq=${dto.seq}'" />
														</td>
													</c:if>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="col-sm-6">
									<div class="dataTables_info" id="dataTables-example_info"
										role="status" aria-live="polite">Showing ${page.begin}
										to ${page.end} of ${page.totalNum} entries</div>
								</div>

								<div class="col-sm-6">
									<div class="dataTables_paginate paging_simple_numbers"
										id="dataTables-example_paginate">
										<ul class="pagination">
											<c:choose>
												<c:when test='${page.page eq 1}'>
													<li class="paginate_button previous disabled"
														aria-controls="dataTables-example" tabindex="0"
														id="dataTables-example_previous"><a href="#">Previous</a>
													</li>
												</c:when>
												<c:otherwise>
													<li class="paginate_button previous"
														aria-controls="dataTables-example" tabindex="0"
														id="dataTables-example_previous"><a
														href="list.list?page=${page.page-1}">Previous</a></li>
												</c:otherwise>
											</c:choose>

											<c:forEach begin='1' end='${page.pages}' var='i'>
												<c:choose>
													<c:when test='${page.page eq i}'>
														<li class="paginate_button active" tabindex="0"><a
															href="list.list?page=${i}">${i}</a></li>
													</c:when>
													<c:otherwise>
														<li class="paginate_button" tabindex="0"><a
															href="list.list?page=${i}">${i}</a></li>
													</c:otherwise>
												</c:choose>
											</c:forEach>

											<c:choose>
												<c:when test='${page.page eq page.pages}'>
													<li class="paginate_button next disabled"
														aria-controls="dataTables-example" tabindex="0"
														id="dataTables-example_next"><a href="#">Next</a></li>
												</c:when>
												<c:otherwise>
													<li class="paginate_button next"
														aria-controls="dataTables-example" tabindex="0"
														id="dataTables-example_next"><a
														href="list.list?page=${page.page+1}">Next</a></li>
												</c:otherwise>
											</c:choose>
										</ul>

									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- jQuery -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/jquery/dist/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<!-- Metis Menu Plugin JavaScript -->
	<script
		src="${pageContext.request.contextPath}/bootstrap/bower_components/metisMenu/dist/metisMenu.min.js"></script>
	<!-- DataTables JavaScript -->
	<!-- 
				<script
					src="/bootstrap/bower_components/datatables/media/js/jquery.dataTables.min.js"></script>
					 
	<script
		src="/bootstrap/bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>
		-->
	<!-- Custom Theme JavaScript -->
	<script src="${pageContext.request.contextPath}/bootstrap/dist/js/sb-admin-2.js"></script>
	<!-- Page-Level Demo Scripts 
	<script>
		$(document).ready(function() {
			$('#dataTables-example').DataTable({
				responsive : true
			});
		});
	</script>
	- Tables - Use for reference -->
</body>