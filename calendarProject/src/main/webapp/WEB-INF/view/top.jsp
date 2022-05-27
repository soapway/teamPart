<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<title>Insert title here</title>
</head>
<body>

	<%
	session = request.getSession();

	pageContext.setAttribute("member", session.getAttribute("member"));
	%>

	<div class="container" style="padding-top: 25px;">
		<nav class="navbar navbar-expand-lg navbar-light bg-light">
			<div class="container-fluid">
				<a class="navbar-brand" href="main">캘린더</a>
				<ul class="nav navbar-nav navbar-right">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${member == null }">
						<li class="nav-item"><a class="nav-link" href="login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="join">회원가입</a></li>
					</c:if>
					<!-- 로그인한 상태 -->
	                <c:if test="${ member != null }">
	            		<span class="navbar-text">${member.userName}님  |</span>
						<li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="ㅁㄴㅇ">회원수정</a></li>
	                </c:if>
				</ul>
			</div>
		</nav>
	</div>
</body>
</html>