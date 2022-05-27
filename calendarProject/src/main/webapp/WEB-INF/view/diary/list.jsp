<%@page import="java.util.List"%>
<%@page import="com.team.domain.DiaryVO"%>
<%@page import="com.team.domain.Criteria"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<body>
	<%!public String css(int a) {
		HashMap<Integer, String> map = new HashMap<>();
		map.put(1, "light");
		map.put(2, "info");
		map.put(3, "primary");
		map.put(4, "secondary");
		map.put(5, "warning");
		map.put(6, "danger");

		Integer i = (int) (Math.random() * 6) + 1 + a;
		String css = map.get(i);
		return css;
	}%>
	<jsp:include page="../top.jsp"/>
	<div class="container">
	<jsp:include page="nav.jsp"/>
		<div class="card my-4 text-bg-<%=css(0)%>">
			<div class="card-header">📆 지난 오늘 기록한 이야기</div>
			<div class="card-body">
				<div class="row">
					<h1 class="card-title col-4 fs-5">
						<c:set var="now" value="<%=new java.util.Date()%>" />
						⏳
						<fmt:formatDate value="${now}" pattern="MM-dd" />
					</h1>
					<div class="col-8 text-break">
						<c:choose>
							<c:when test="${empty oldOne.user_id}">
								<p>앗! 이 날의 기록이 없네요.</p>
								<p>오늘 기록해서 다음에 만나요!</p>
							</c:when>
							<c:otherwise>
								<p class="px-2">${oldOne.content}</p>
								<a class="btn btn-outline-<%=css(1)%> btn-sm" href='readView?no=<c:out value="${oldOne.no}"></c:out>'>자세히 보기 &gt;&gt;</a>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
			</div>
		</div>
		<table class="table">
			<caption></caption>
			<thead>
				<tr>
					<th scope="col">📃 번호</th>
					<th scope="col">📆 날짜</th>
					<th scope="col">✏ 제목</th>
				</tr>
			</thead>

			<tbody>
				<c:forEach items="${list}" var="list">

					<tr class="table-<%=css(0)%>">
						<th scope="row"><c:out value="${list.no}" /></th>
						<td><fmt:formatDate value="${list.reg_date}"
								pattern="yy-MM-dd" /></td>
						<td><a class="text-decoration-none fw-bold text-dark"
							href='readView?no=<c:out value="${list.no}"></c:out>'><c:out
									value="${list.title}" /></a></td>
					</tr>
				</c:forEach>
			</tbody>

		</table>
		<div class="row">
			<div class="col-4">
				<a class="btn btn-outline-warning"
					href='writeDiary?userId=${list[0].user_id}'>글쓰기</a>
			</div>
			<div class="col-4"></div>
			<div class="col-4 text-end">
				<div class="btn-group" role="group">
					<%!int total;
					Criteria criteria;
					List<DiaryVO> list;
					int pageNum;
					int amount;
					int lastPage;

					public int getLastPage(int pageNum, int amount) {
						if (total % amount != 0) {
							lastPage = (int) total / amount + 1;
							return lastPage;
						} else {
							lastPage = (int) total / amount;
							return lastPage;
						}
					}%>
					<%
					total = (int) request.getAttribute("total");
					criteria = (Criteria) request.getAttribute("cri");
					list = (List<DiaryVO>) request.getAttribute("list");

					pageNum = criteria.getPageNum();
					amount = criteria.getAmount();

					pageContext.setAttribute("lastPage", getLastPage(pageNum, amount));
					%>
					<c:if test="${lastPage >= 3  && cri.pageNum != 1}">
						<a
							href='list?userId=${list[0].user_id}&pageNum=1&amount=${cri.amount}'
							class="btn btn-outline-primary"><i class="bi bi-chevron-double-left"></i></a>
					</c:if>
					<%
					total = (int) request.getAttribute("total");
					criteria = (Criteria) request.getAttribute("cri");
					list = (List<DiaryVO>) request.getAttribute("list");

					pageNum = criteria.getPageNum();
					amount = criteria.getAmount();

					String userId = (String) list.get(0).getUser_id();

					for (int i = 1; i <= getLastPage(pageNum, amount); i++) {
						if (pageNum == i) {
							out.println("<a href='list?userId=" + userId + "&pageNum=" + i + "&amount=" + amount
							+ "' class='btn btn-outline-secondary active'>" + i + "</a>");
						} else {
							out.println("<a href='list?userId=" + userId + "&pageNum=" + i + "&amount=" + amount
							+ "' class='btn btn-outline-secondary'>" + i + "</a>");
						}
					}
					%>
					<c:if test="${lastPage >= 3  && cri.pageNum != lastPage}">
						<a
							href='list?userId=${list[0].user_id}&pageNum=${lastPage}&amount=${cri.amount}'
							class="btn btn-outline-primary"><i class="bi bi-chevron-double-right"></i></a>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="modal.jsp" />
</body>
</html>