<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
<title>가입</title>
<style type="text/css">

 /* 중복아이디 존재하지 않는경우 */
.id_input_re_1{
	color : green;
	display : none;
}
/* 중복아이디 존재하는 경우 */
.id_input_re_2{
	color : red;
	display : none;
}

/* 유효성 검사 문구 */
.final_id_ck{
    display: none;
}
.final_pw_ck{
    display: none;
}
.final_name_ck{
    display: none;
}
.final_tel_ck{
    display: none;
}
</style>
</head>
<body>
<jsp:include page="../other/top.jsp"></jsp:include>

<div class="container">
        <div class="row justify-content-center align-items-center" style="height:75vh">
            <div class="col-5">
                <div class="card">
                    <div class="card-body">
                        <form method="post" id="join_form">
                        	<h3 style="text-align: center;">회원가입</h3>
                            <div class="form-group">
                                <input type="email" class="form-control id_input" name="userId" placeholder="아이디(이메일)">
                                <span class="id_input_re_1">사용 가능한 아이디입니다.</span>
								<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
								<span class="final_id_ck">아이디를 입력해주세요.</span>
								<sapn class="mail_input_box_warn"></sapn>
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="password" class="form-control pw_input" name="userPassword" placeholder="비밀번호">
                            	<span class="final_pw_ck">비밀번호를 입력해주세요.</span>
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="text" class="form-control name_input" name="userName" placeholder="이름">
                                <span class="final_name_ck">이름을 입력해주세요.</span>
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="tel" class="form-control tel_input" name="userTel" placeholder="전화번호">
                                <span class="final_tel_ck">전화번호를 입력해주세요.</span>
                            </div>
                            <div class="form-group" style="padding-top: 15px;">
                                <input type="button" class="btn btn-primary form-control join_button" value="가입하기" >
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <script>
    
    /* 유효성 검사 통과유무 변수 */
    var idCheck = false;
    var idckCheck = false;
    var pwCheck = false;
    var nameCheck = false;
    var telCheck = false;
    
    $(document).ready(function(){
    //회원가입 버튼(회원가입 기능 작동)
    	$(".join_button").click(function(){
    		
    		/* 입력값 변수 */
    		var id = $('.id_input').val();
    		var pw = $('.pw_input').val();
    		var name = $('.name_input').val();
    		var tel = $('.tel_input').val();
    		var warnMsg = $(".mail_input_box_warn");
    		
    		/* 아이디 유효성검사 */
            if(id == ""){
                $('.final_id_ck').css('display','block');
                idCheck = false;
            }else{
                $('.final_id_ck').css('display', 'none');
                idCheck = true;
            }
    		
            /* 이메일 형식 유효성 검사 */
            if(mailFormCheck(id)){
                warnMsg.css("display", "none");
                $('.id_input_re_1').css("display", "none");
            } else {
                warnMsg.html("올바르지 못한 이메일 형식입니다.");
                warnMsg.css("display", "inline-block");
                $('.id_input_re_1').css("display", "none");
                return false;
            }  
    		
            /* 비밀번호 유효성 검사 */
            if(pw == ""){
                $('.final_pw_ck').css('display','block');
                pwCheck = false;
            }else{
                $('.final_pw_ck').css('display', 'none');
                pwCheck = true;
            }
            
            /* 이름 유효성 검사 */
            if(name == ""){
                $('.final_name_ck').css('display','block');
                nameCheck = false;
            }else{
                $('.final_name_ck').css('display', 'none');
                nameCheck = true;
            }
            
            /* 전화번호 유효성 검사 */
            if(tel == ""){
                $('.final_tel_ck').css('display','block');
                telCheck = false;
            }else{
                $('.final_tel_ck').css('display', 'none');
                telCheck = true;
            }
    		
            /* 최종 유효성 검사 */
            if(idCheck&&idckCheck&&pwCheck&&nameCheck&&telCheck ){
            	$("#join_form").attr("action", "join");
         		$("#join_form").submit();
            }
            
            return false;
    	});
    });
    
  	//아이디 중복검사
    $('.id_input').on("propertychange change keyup paste input", function(){
    	
    	var userId = $('.id_input').val();			// .id_input에 입력되는 값
    	var data = {userId : userId}				// '컨트롤에 넘길 데이터 이름' : '데이터(.id_input에 입력되는 값)'
    	
    	
    	$.ajax({
    		type : "post",
    		url : "memberIdChk",
    		data : data,
    		success : function(result){
//    			console.log("성공 여부" + result);
    			if(result != 'fail'){
    				$('.id_input_re_1').css("display","inline-block");
    				$('.id_input_re_2').css("display", "none");	
    				idckCheck = true;
    			} else {
    				$('.id_input_re_2').css("display","inline-block");
    				$('.id_input_re_1').css("display", "none");	
    				idckCheck = false;
    			}
   			}
    	});
    });
  	
    /* 입력 이메일 형식 유효성 검사 */
    function mailFormCheck(userId){
    	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
    	return form.test(userId);
   	}
    
    </script>
</body>
</html>