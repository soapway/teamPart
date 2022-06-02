<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<%
	session = request.getSession();

	application.setAttribute("member", session.getAttribute("member"));
	%>
		<nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top p-2">
			<div class="container-fluid">
				<a class="navbar-brand" href="../member/main">캘린더</a>
				<ul class="nav navbar-nav navbar-right">
					<!-- 로그인 하지 않은 상태 -->
					<c:if test="${member == null }">
						<li class="nav-item"><a class="nav-link" href="../member/login">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="../member/join">회원가입</a></li>
					</c:if>
					<!-- 로그인한 상태 -->
	                <c:if test="${ member != null }">
	            		<span class="navbar-text">${member.userName}님  |</span>
						<li class="nav-item"><a class="nav-link" href="logout.do">로그아웃</a></li>
						<li class="nav-item"><a class="nav-link" href="../member/info">회원수정</a></li>
						<li class="nav-item"><a class="nav-link" href="../diary/list?userId=${member.userId}">리스트</a></li>
	                </c:if>
				</ul>
			</div>
		</nav>