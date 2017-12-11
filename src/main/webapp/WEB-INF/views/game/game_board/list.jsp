<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
					class="btn btn-outline btn-primary btn-xs"
					href='${pageContext.request.contextPath}'>인덱스</a> &nbsp; <a
					class="btn btn-outline btn-primary btn-xs"
					href='nextseq.seq.insert'>글쓰기</a> <br />
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
									<label>Show <select name="pageSize" onChange="submit()"
										class="form-control input-sm" style="width: auto">
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
									<label>Search: <select name="col" style="width: 70px;"
										class="form-control input-sm">
											<option value='SUBJECT'>제목</option>
											<option value='CONTENT'>내용</option>
											<option value='NAME'>글쓴이</option>
											<option value='SEQ'>글번호</option>
									</select> <input name="keyWord" type="search" placeholder="검색"
										style="width: auto;" class="form-control input-sm">

										<button class="btn btn-outline btn-primary btn-sm"
											action="check_keyword()" value="true" method="POST"
											name="searchMode">검색</button> <c:if test="${page.searchMode}">
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
											<td style="text-align: center; vertical-align: middle;">${dto.SEQ}</td>
											<td style="text-align: center; vertical-align: middle;">${dto.NAME}</td>

											<td style="vertical-align: middle;"><c:forEach begin='2'
													end='${dto.REPLY_LEVEL}'>·</c:forEach> <c:if
													test='${dto.REPLY_LEVEL ne 1}'>
													<i class="glyphicon glyphicon-hand-right" />
												</c:if><a href="item.item.item?seq=${dto.SEQ}"> ${dto.SUBJECT}</a></td>
											<td style="text-align: center; vertical-align: middle;">${dto.CDATE}</td>
											<td style="text-align: center; vertical-align: middle;">${dto.RDATE}</td>
											<td style="text-align: center; vertical-align: middle;">${dto.COUNT}(${dto.LIKE_COUNT})</td>
											<c:if test="${user.no eq 1}">
												<td style="text-align: center; vertical-align: middle;">${dto.PARENT_SEQ}</td>
												<td style="text-align: center; vertical-align: middle;">${dto.REPLY_LEVEL}</td>
												<td style="text-align: center; vertical-align: middle;">
													<span style="float: center;"
													class="glyphicon glyphicon-remove"
													onclick="location.href='/spring/board/delete.do?seq=${dto.SEQ}'" />
												</td>
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
						<div class="col-sm-6">
							<div class="dataTables_info" id="dataTables-example_info"
								role="status" aria-live="polite">Showing ${page.begin} to
								${page.end} of ${page.totalNum} entries</div>
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