<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.8/fullpage.min.js"
	integrity="sha512-SED4JtVTs/hBH7hr0oqqyV8xicviQn9DX/Ts9APRUzDTZRRexLvIwyMHXu2GxEU3ZcXpZpDTWizJuzZ9BqgIXg=="
	crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fullPage.js/4.0.8/fullpage.css"
	integrity="sha512-71o4VLexkvCSZf9nAI/uWPoBJDV8q6g8q3kvuIth20F8kjI+Zg1zNbbJSa+V5S89Has+E6rMadf8xvLSO1Zlyw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
body,div,dl,dt,dd,ul,ol,li,h1,h2,h3,h4,h5,h6,pre,
form,fieldset,input,textarea,p,blockquote,th,td {
    padding: 0;
    margin: 0;
}
h1,h2,h3,h4,h5,h6 {
    font-weight: normal;
    font-size: 100%;
    margin:0;
    padding:0;
    color:#444;
}
body{
	font-family: arial,helvetica;
	color: #333;
	color: rgba(0,0,0,0.5);
}
h1{
	font-size: 6em;
}
.section{
	text-align:center;
}
/* Style for our header texts
* --------------------------------------- */
h1{
	font-size: 5em;
	font-family: arial,helvetica;
	color: #fff;
	margin:0;
	margin-bottom: 1rem;
}
.section p,
.intro p{
	color: #fff;
}

/* Centered texts in each section
* --------------------------------------- */
.section{
	text-align:center;
}
</style>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.3/font/bootstrap-icons.css">
</head>
<body>
	<div id="fullpage">
		<div class="section" id="section0"><h1><i class="bi bi-person"></i></h1><p>쉬운 가입</p><p><i class="bi bi-chat-fill"></i> 카카오도 가능해요</p></div>
		<div class="section" id="section1"><h1><i class="bi bi-emoji-sunglasses"></i></h1><p><i class="bi bi-file-text"></i> 차곡차곡 쌓여나가는 나의 일상</p></div>
		<div class="section" id="section2"><h1><i class="bi bi-palette"></i></h1><p><i class="bi bi-display"></i> 다시 올 때마다 새로운 느낌으로</p></div>
		<div class="section" id="section3"><h1><i class="bi bi-calendar3"></i></h1></div>
		<div class="section" id="section4"><h1>Some section</h1></div>
	</div>
	<script type="text/javascript">
		let myFullpage = new fullpage('#fullpage', {
			sectionsColor: ['#FAA732', '#49AFCD', '#5BB75B', '#DA4F49', '#006DCC'],
			verticalCentered: true
		});
	</script>
</body>
</html>