<%@page contentType="text/html;charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:forEach items="${list}" var="reply_dto">
	<li class="left clearfix"><span class="chat-img pull-left">
			<img src="http://placehold.it/50/55C1E7/fff" alt="User Avatar"
			class="img-circle" />
	</span>
		<div class="chat-body clearfix">
			<div class="header">
				<strong class="primary-font">${reply_dto.NAME}</strong> <small
					class="pull-right text-muted" style="text-align: right;"> <i
					class="fa fa-clock-o fa-fw"></i>${reply_dto.CDATE} <br /> <span
					style="float: right;" class="glyphicon glyphicon-thumbs-down"
					id="reply_hate_button_${reply_dto.SEQ}"
					onclick="reply_hate_count(${reply_dto.SEQ})">&nbsp;${reply_dto.HATE_COUNT}</span>

					<span id="reply_like_button_${reply_dto.SEQ}"
					style="float: right; margin-right: 15px;"
					class="glyphicon glyphicon-thumbs-up"
					onclick="reply_like_count(${reply_dto.SEQ})">&nbsp;${reply_dto.LIKE_COUNT}</span>

					<c:if test="${user eq null || user.NO eq reply_dto.WRITER_SEQ}">
						<span style="float: right; margin-right: 15px;"
							class="glyphicon glyphicon-remove"
							onclick="delete_reply(${reply_dto.SEQ})" />
					</c:if>

				</small>

			</div>
			<p>${reply_dto.REPLY_CONTENT}</p>

		</div></li>
</c:forEach>