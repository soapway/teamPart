<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>full - calendar</title>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.css"
	rel="stylesheet" type="text/css" />
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.css"
	rel="stylesheet" type="text/css" />

<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/daygrid/main.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/timegrid/main.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/list/main.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/interaction/main.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/moment/main.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/locales/ko.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor"
	crossorigin="anonymous">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.2/font/bootstrap-icons.css">

<script>
	$(function() {
		setCalendar();
	});

	function setCalendar() {

		var calendarEl = document.getElementById('calendar');

		var calendar = new FullCalendar.Calendar(calendarEl, {
			plugins : [ 'dayGrid', 'timeGrid', 'list', 'interaction' ],
			header : {
				left : 'prev,next today',
				center : 'title',
				right : 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
			},
			defaultView : 'dayGridMonth',
			locale : 'ko',
			navLinks : true, // can click day/week names to navigate views
			editable : false,
			allDaySlot : false,
			eventLimit : true, // allow "more" link when too many events
			minTime : '00:00:00',
			maxTime : '24:00:00',
			contentHeight : 'auto',
			dayMaxEvents : true,
			eventSources : [ {
				events : function(info, successCallback, failureCallback) {
					$.ajax({
						url : '${pageContext.request.contextPath}/diary/datas',
						type : 'POST',
						dataType : 'json',
						data : {
							startTime : moment().subtract(30, "days").format(
									'YYYY-MM-DD'),
							endTime : moment().add(1, "days").format(
									'YYYY-MM-DD'),
							userId : $("#userId").val()
						},
						success : function(data) {
							successCallback(data);
						}
					});
				}
			} ],
			eventClick: function(info) {
			    info.jsEvent.preventDefault(); // don't let the browser navigate
			    
			    if(info.event.url){
			    	location.href = '${pageContext.request.contextPath}' + info.event.url;
			    }
			    
			  }

		});

		calendar.render();

	}
</script>
</head>
<body>
	<jsp:include page="../other/top.jsp" />
	<div class="container my-4 py-4">
		<jsp:include page="nav.jsp" />
		<div id="calendar"></div>
		<input type="hidden" value='${userId}' name="userId" id="userId">
	</div>

</body>
</html>