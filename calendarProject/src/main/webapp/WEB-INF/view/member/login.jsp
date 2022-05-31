<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<title>로그인</title>
<style type="text/css">
.login_warn{
    margin-top: 30px;
    text-align: center;
    color : red;
}
</style>
</head>
<body>
<%@ include file = "../other/top.jsp" %>

<div class="container">
        <div class="row justify-content-center align-items-center" style="height:75vh">
            <div class="col-5">
                <div class="card">
                    <div class="card-body">
                        <form method="post" id="login_form" >
                        	<h3 style="text-align: center;">로그인</h3>
                            <div class="form-group">
                                <input type="email" class="form-control id_input" name="userId" placeholder="이메일">
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="password" class="form-control pw_input" name="userPassword" placeholder="비밀번호">
                            </div>
                            <c:if test = "${result == 0 }">
                				<div class = "login_warn">사용자 ID 또는 비밀번호를 잘못 입력하셨습니다.</div>
            				</c:if>
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="button" class="btn btn-primary form-control login_button" value="로그인">
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                            <button class="btn btn-warning form-control" type="button" onclick="loginWithKakao()"><i class='bi bi-chat-fill'></i> 카카오 로그인</button>
							</div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    
<!-- 카카오 로그인 -->
<script type="text/javascript" src="https://developers.kakao.com/sdk/js/kakao.min.js" charset="utf-8"></script>
<script type="text/javascript">
    $(document).ready(function(){
        Kakao.init('f4c6731f8ef4673fbb795634349fee8c');
        Kakao.isInitialized();
    });

    function loginWithKakao() {
        Kakao.Auth.authorize({ 
        redirectUri: 'http://localhost:8080/kakao_callback' 
        }); // 등록한 리다이렉트uri 입력
    }
</script>
    
<script>

	/* 로그인 버튼 클릭 메서드 */
	$(".login_button").click(function(){  
		/* 로그인 메서드 서버 요청 */
        $("#login_form").attr("action", "login");
        $("#login_form").submit();
	});
 
</script>

</body>
</html>