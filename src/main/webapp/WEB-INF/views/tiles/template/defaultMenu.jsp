<%@ page pageEncoding="UTF-8"%>
<nav>
    <ul id="menu">
       <li><a href="${pageContext.request.contextPath}/">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/board/consultingboard/list.do">Board List</a></li>
       <li><a href="${pageContext.request.contextPath}/board/board/boardList.do">Board List</a></li>
       
       <li><a>Member</a></li>
       <li><a href="${pageContext.request.contextPath}/member/join.form">&nbsp;-회원가입</a></li>
       <li><a href="${pageContext.request.contextPath}/member/login.form">&nbsp;-로그인</a></li>
       <li><a href="${pageContext.request.contextPath}/member/login_check.page">&nbsp;-login_check</a></li>
       <li><a href="${pageContext.request.contextPath}/member/cash.page">&nbsp;-캐쉬충전</a></li>
       <br>
       <li><a>Consulting</a></li>
       <li><a href="${pageContext.request.contextPath}/consulting/consultingboard/list.page">&nbsp;consulting list</a></li>
       <li><a href="${pageContext.request.contextPath}/consulting/anonymousboard/list.page">&nbsp;anony list</a></li>
       <li><a href="${pageContext.request.contextPath}/consulting/helper/list.page">&nbsp;helper list</a></li>
       
       
    </ul>
</nav>
