<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.team.domain.DiaryVO"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<script type="text/javascript">
function alertYou() {
	alert('삭제되었습니다.');
}
</script>
<body>
<jsp:include page="../top.jsp"/>
	<main class="container p-5">
		<%!public String css() {
		HashMap<Integer, String> map = new HashMap<>();
		map.put(1, "bg-light");
		map.put(2, "bg-info");
		map.put(3, "bg-primary");
		map.put(4, "bg-secondary");
		map.put(5, "bg-warning");
		map.put(6, "bg-danger");

		Integer i = (int) (Math.random() * 6) + 1;
		String css = map.get(i);
		return css;
	}%>
		<%!public String cssButton() {
		HashMap<Integer, String> map = new HashMap<>();
		map.put(1, "btn btn-outline-success");
		map.put(2, "btn btn-outline-info");
		map.put(3, "btn btn-outline-primary");
		map.put(4, "btn btn-outline-secondary");
		map.put(5, "btn btn-outline-warning");
		map.put(6, "btn btn-outline-danger");

		Integer i = (int) (Math.random() * 6) + 1;
		String css = map.get(i);
		return css;
	}%>
		<div class="p-5 mb-4 <%=css()%> rounded-3" style="--bs-bg-opacity: .5">
			<div class="container-fluid py-2">
				<h1 class="text-center text-dark fw-bold">
					<c:out value="${view.title}" />
				</h1>
				<p class="text-end text-dark fw-light">
					<fmt:formatDate value="${view.reg_date}"
						pattern="yyyy-MM-dd HH:mm:ss" />
				</p>
			</div>
		</div>

		<div class="p-5 mb-4 <%=css()%> rounded-3" style='--bs-bg-opacity: .5'>
			<div class="container-fluid py-5">
				<small class="text-muted fw-bold"> <c:out value="${view.no}" />번째
					기록 ✏
				</small>
				<p class="text-dark text-break lh-sm">
					<c:out value="${view.content}" />
				</p>
			</div>
		</div>
		<a class="<%=cssButton()%>" role="button"
			href='list?userId=<c:out value="${view.user_id}"></c:out>'>📑 돌아가기</a>
		<%
		DiaryVO vo = (DiaryVO) request.getAttribute("view");
		Date today = new Date();

		DateFormat format = new SimpleDateFormat("yyyy/MM/dd");
		pageContext.setAttribute("today", format.format(today));
		pageContext.setAttribute("thatday", format.format(vo.getReg_date()));
		%>
		<c:if test="${today == thatday}">
			<a class="<%=cssButton()%>" role="button"
				href='updateDiary?no=<c:out value="${view.no}"></c:out>'>📝 수정하기</a>
		</c:if>
		<a class="<%=cssButton()%>" role="button" href="deleteDiary?no=${view.no}&userId=${view.user_id}" onclick="alertYou()">🗑 지우기</a>
	</main>
</body>
</html>