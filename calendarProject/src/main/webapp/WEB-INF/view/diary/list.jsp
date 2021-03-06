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
	<jsp:include page="../other/top.jsp"/>
	<div class="container my-4 py-4">
	<jsp:include page="nav.jsp"/>
		<div class="card mb-4 text-bg-<%=css(0)%>">
			<div class="card-header">π μ§λ μ€λ κΈ°λ‘ν μ΄μΌκΈ°</div>
			<div class="card-body">
				<div class="row">
					<h1 class="card-title col-4 fs-5">
						<c:set var="now" value="<%=new java.util.Date()%>" />
						β³
						<fmt:formatDate value="${now}" pattern="MM-dd" />
					</h1>
					<div class="col-8 text-break">
						<c:choose>
							<c:when test="${empty oldOne.user_id}">
								<p>μ! μ΄ λ μ κΈ°λ‘μ΄ μλ€μ.</p>
								<p>μ€λ κΈ°λ‘ν΄μ λ€μμ λ§λμ!</p>
							</c:when>
							<c:otherwise>
								<p class="px-2">${oldOne.content}</p>
								<a class="btn btn-outline-<%=css(1)%> btn-sm" href='readView?no=<c:out value="${oldOne.no}"></c:out>'>μμΈν λ³΄κΈ° &gt;&gt;</a>
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
					<th scope="col">π λ²νΈ</th>
					<th scope="col">π λ μ§</th>
					<th scope="col">β μ λͺ©</th>
				</tr>
			</thead>

			<tbody>
			<c:choose>
			<c:when test="${empty list[0].no}">
			<tr></tr>
			</c:when>
			<c:otherwise>
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
						</c:otherwise>
			</c:choose>
			</tbody>

		</table>
		<div class="row">
			<div class="col-4">
				<a class="btn btn-outline-warning"
					href='writeDiary?userId=${list[0].user_id}'>κΈμ°κΈ°</a>
			</div>
			<div class="col-4"></div>
			<c:if test="${list[0].no != null}">
			<div class="col-4 text-end">
				<div class="btn-group" role="group">
					<%!
					int total;
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
			</c:if>
		</div>
	</div>
	<jsp:include page="modal.jsp" />
	<script type="text/javascript">
	$(function(){
		let consoleDeco = `
			β β β β β β β β β β β β β β β β β β’β£β£€β£€β£€β£Άβ£Άβ£Άβ£Άβ‘Άβ£Άβ£€β£€β£€β£β‘β β β β β β β β β β β β β β β β β 
			β β β β β β β β β β β β β β£β£€β£Άβ£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘β‘Ώβ β »β Ώβ’β£Ώβ£Ώβ£Ώβ£Ώβ£Άβ£ β£β β β β β β β β β β β β β 
			β β β β β β β β β β β’β£΄β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ’Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£β’Ώβ‘β β β β β’β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ’β’β£€β£β β β β β β β β β β 
			β β β β β β β β β£ β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£―β£Έβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£¦β£β£β£€β£β£Ώβ£Ώβ£Ώβ‘Ώβ »β£»β£Ώβ£Ύβ‘Ώβ£·β£·β£β β β β β β β β 
			β β β β β β β’ β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘β β’β’β£·β‘β’β’―β£Ώβ£β’§β£β β β β β β 
			β β β β β β£΄β’Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ’Ώβ β£―β’β β‘’β ’β£’β β‘―β‘’β ’β‘β‘³β’΅β’β’¦β‘β β β β 
			β β β β β£Όβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£·β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ Ώβ‘Ώβ’β’Ώβ‘β Ώβ£Ώβ’β β «β‘»β£¦β‘β β’§β‘»β£β£Άβ‘β’·β‘β‘β’β β’β‘’β‘β’§β’₯β β β β 
			β β β β£Όβ£Ώβ£Ώβ Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘Ώβ’Ώβ‘β£?β’β’β  β‘β β €β ±β’Ώβ££β‘ͺβ£Όβ‘β‘β£β’ͺβ’³β‘β ·β£β ¨β ³β£β’’β’Ώβ β β‘³β£β β’β β β 
			β β β Έβ’Ώβ β β β β’Ώβ£Ώβ‘Ώβ’Ώβ Ώβ£Ίβ£β β’β »β£·β ¨β£β Έβ‘β‘β’¨β’³β’±β£­β’Ώβ‘Έβ‘β’¦β‘β Έβ’β’β’β €β‘β ¦β‘±β£§β β ’β β β£ β£¦β β 
			β β β£β£β’β‘β β’’β‘€β ­β‘β β β‘β ³β£·β£β ¬β‘³β’»β‘Ίβ‘³β‘½β£β β »β‘§β‘³β‘―β’³β£β£β’£β‘β  β‘ β ͺβ’β£€β£Όβ£€β£¬β£¦β£΄β£Ύβ£Ύβ£Ώβ’»β‘β 
			β β β’β β β β β β β β β €β β β’ β β‘ β‘β β£·β£½β‘·β Ώβ‘β Έβ β β β β  β’½β£Ώβ‘β’β β’β’°β£Ώβ£Ώβ Ώβ£Ώβ β£Ώβ£Ώβ£Ώβ‘β β β β 
			β β β β β  β β β β β β β  β β β β β’β β β β β Ώβ ³β β£ β β β β’β£β β β β‘΄β£Ύβ Ώβ£Ώβ£Ώβ β β β β β’β£β£§β‘β‘β β 
			β β£Άβ£Ώβ£Ώβ£·β£Άβ£Άβ£β‘β β‘’β β β£β£β’β‘°β£€β£’β£΄β£€β£β£β£ β£β β β ²β£§β‘β£Ύβ£β£’β£β ‘β β’·β‘·β’β β β β β β‘β Ώβ‘β β β 
			β β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ β‘β£€β β‘β£Ώβ’»β‘β’β£Ώβ£β‘ͺβ’³β£β ?β‘β ³β£₯β ’β£β ’β β’­β‘ͺβ’­β »β£·β£―β£Ώβ£Ώβ£β‘β’β£°β£Ύβ£Ώβ£?β£Άβ£β β 
			β β’Έβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘·β£Ύβ£β£Έβ£β‘Ώβ β‘β’?β’β β Ήβ£Ώβ£β’β ³β£€β’β β β‘β’β‘¨β β‘β β «β‘β β‘»β Ώβ’Ώβ£­β£β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘Ώβ 
			β β β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘β£Όβ£Όβ£―β‘―β’β β °β Έβ β β‘±β‘±β‘ͺβ‘·β£₯β£β β β’β β’β β’β‘β  β’β β β β’β ©β β’β β£ β Ώβ£Ώβ£Ώβ£Ώβ£Ώβ β 
			β β β’Έβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ’·β Άβ β β£ β£Άβ£Ώβ£Ώβ£·β£Άβ£β’β’β β Ήβ‘¦β β  β‘β β’β β’β‘β’β β£²β β‘β£©β£β β’β §β£€β β’Έβ Ώβ β β 
			β β β β’»β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£·β£¦β£€β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£¦β£β ͺβ’β β‘β£¦β£β£ β£¦β£¬β£΅β£€β£Όβ£¦β β‘·β’β£°β‘β’Ήβ β£β£β β’’β£β β β β 
			β β β β β’»β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘―β’£β β‘β£΄β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ β‘Έβ β£°β β£³β β’£β£Όβ β£±β β β β β β 
			β β β β β β Ήβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘Ώβ β β β §β£β£΅β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£§β£΄β’Ώβ‘β β’β‘β β‘β β β β β β β 
			β β β β β β β β »β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘Ώβ‘β β’β£¦β‘β£β£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘β β£β£Άβ‘β ±β‘β £β β β β β β β 
			β β β β β β β β β β »β‘β’»β’β£Έβ’°β’β’°β£΄β£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘β β£β Έβ β β β β β β β β 
			β β β β β β β β β β β β β Ώβ£Ώβ£Ύβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘Ώβ β β β β β β β β β β β 
			β β β β β β β β β β β β β β β β »β Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ£Ώβ‘Ώβ β β β β β β β β β β β β β β β 
			β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β β 
`;
		console.log(consoleDeco);
	});
	</script>
</body>
</html>