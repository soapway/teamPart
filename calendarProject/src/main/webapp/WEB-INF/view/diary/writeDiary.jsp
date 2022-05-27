<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp" />
<script type="text/javascript">
	function validateForm() {
		let title = $.trim($("#title").val());
		let content = $.trim($("#content").val());
		let textColor = $.trim($("#textColor").val());
		let color = $.trim($("#color").val());
		if (title == "" || content == "" || textColor == "" || color == "") {
			alert("빈 칸을 채워주세요");
			return false;
		}
	}
</script>
<body>
	<main class="container p-5">
		<%!public String css() {
		HashMap<Integer, String> map = new HashMap<>();
		map.put(1, "light");
		map.put(2, "info");
		map.put(3, "primary");
		map.put(4, "secondary");
		map.put(5, "warning");
		map.put(6, "danger");

		Integer i = (int) (Math.random() * 6) + 1;
		String css = map.get(i);
		return css;
	}%>
		<div class="p-5 mb-4 bg-<%=css()%> rounded-3"
			style="--bs-bg-opacity: .5">
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<h1 class="text-center my-2 text-<%=css()%>">
				<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" />
			</h1>
		</div>

		<div class="p-5 my-4 bg-light rounded-3">
			<form action="writeDiary" method="post" onsubmit="return validateForm()">
				<input class="form-control" type="hidden" value="${userId}"
					name="user_id" id="user_id">
				<div>
					<label for="title" class="form-label">제목</label> <input
						class="form-control mb-2" type="text" name="title" id="title"
						required>
				</div>
				<div>
					<label for="content" class="form-label">내용</label>
					<textarea class="form-control mb-2" rows="10" cols="50"
						maxlength="3000" id="content" name="content" required></textarea>
				</div>
				<div class="row my-2">
					<div class="col py-2">
						<label for="textColor" class="form-label">글자색🎨</label> <input
							class="form-control form-control-color" type="color"
							value="#FFFFFF" id="textColor" name="textColor">
					</div>
					<div class="col py-2">
						<label for="color" class="form-label">배경색🎨</label> <input
							class="form-control form-control-color" type="color"
							value="#DB592A" id="color" name="color">
					</div>
					<small class="text-muted">이 색상은 달력보기에 적용됩니다.</small>
				</div>
				<input type="submit" class="btn btn-outline-primary my-2"
					value="📝 저장하기"> <input type="reset"
					class="btn btn-outline-danger my-2" value="🗑 지우기"> <a
					class="btn btn-outline-secondary" role="button"
					href='list?userId=${userId}'>📑 돌아가기</a>
			</form>
		</div>
	</main>
</body>
</html>