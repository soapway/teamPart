<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../other/top.jsp"></jsp:include>

	<div class="container">
		<div class="row justify-content-center align-items-center"
			style="height: 75vh">
			<div class="col-5">
				<div class="card">
					<div class="card-body">
						<form method="post" id="update_form">
							<h3 style="text-align: center;">회원정보수정</h3>
							<div class="form-group">
								<input type="email" class="form-control id_input" name="userId"
									value="${member.userId}" readonly="readonly">
								<%-- 								<sapn>아이디 : ${member.userId}</sapn> --%>
							</div>
							<div class="form-group" style="padding-top: 15px;">
								<input type="password" class="form-control pw_input"
									name="userPassword" placeholder="비밀번호">
							</div>
							<div class="form-group" style="padding-top: 15px;">
								<input type="text" class="form-control name_input"
									name="userName" value="${member.userName}">
							</div>
							<div class="form-group" style="padding-top: 15px;">
								<input type="tel" class="form-control tel_input" name="userTel"
									value="${member.userTel}">
							</div>
							<div class="form-group" style="padding-top: 15px;" align="center">
								<input type="button" class="btn btn-primary update_button "
									value="수정하기">
								<button type="button" class="btn btn-primary"
									data-bs-toggle="modal" data-bs-target="#exampleModal">탈퇴하기</button>
							</div>
							<div class="modal fade" id="exampleModal" tabindex="-1"
									aria-labelledby="exampleModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<h5 class="modal-title" id="exampleModalLabel">회원탈퇴</h5>
												<button type="button" class="btn-close"
													data-bs-dismiss="modal" aria-label="Close"></button>
											</div>
											<div class="modal-body">정말로 탈퇴하시겠습니까?</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-secondary"
													data-bs-dismiss="modal">취소</button>
												<input type="button" class="btn btn-primary delete_button"
													value="탈퇴하기">
											</div>
										</div>
									</div>
								</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>



	<script>
		$(document).ready(function() {
			//회원수정 버튼(회원수정 기능 작동)
			$(".update_button").click(function() {
				$("#update_form").attr("action", "update.do");
				$("#update_form").submit();
			});
			
			//회원탈퇴 버튼(회원탈퇴 기능 작동)
			$(".delete_button").click(function() {
				$("#update_form").attr("action", "delete.do");
				$("#update_form").submit();
			});

		});
	</script>
</body>
</html>