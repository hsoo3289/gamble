<%@ page pageEncoding="UTF-8"%>
<nav>
    <ul id="menu">
       <li><a href="${pageContext.request.contextPath}/">Home</a></li>
       <li><a href="${pageContext.request.contextPath}/board/consultingboard/list.do">Board List</a></li>
       <li><a href="${pageContext.request.contextPath}/board/board/boardList.do">Board List</a></li>
       
       <li><a>Member</a></li>
       <li><a href="${pageContext.request.contextPath}/member/register.form">&nbsp;-회원가입</a></li>
       <li><a href="${pageContext.request.contextPath}/member/login.form">&nbsp;-로그인</a></li>
       <li><a href="${pageContext.request.contextPath}/member/member.item">&nbsp;-정보조회</a></li>
       <li><a href="${pageContext.request.contextPath}/member/cash.void">&nbsp;-캐쉬충전</a></li>
       
       
    </ul>
</nav>
