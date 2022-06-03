<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/chart.js@3.8.0/dist/chart.min.js"></script>
</head>
<body>
	<div style="padding: 10rem;">
		<canvas id="myChartEx" width="400" height="400"
			aria-label="chart graphic" role="img">
            이 브라우저는 canvas 요소를 지원하지 않습니다.
        </canvas>
	</div>
	<script>
		const labels = [ 'a', 'b', 'c', 'd', 'e', 'f' ];
		const data = {
			labels : labels,
			datasets : [ {
				label : 'test datasets',
				borderColor : 'rgb(75, 192, 192)',
				data : [ 0, 22, 10, 1, 5, 2 ],
				fill : false,
				tension : 0.1
			} ]
		};
		const config = {
			type : 'line',
			data : data,
			option : {}
		};
		const myChart = new Chart($('#myChartEx'), config);
	</script>
</body>
</html>