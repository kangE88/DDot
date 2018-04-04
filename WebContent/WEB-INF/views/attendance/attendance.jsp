<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./css/fullcalendar.css">
<script type="text/javascript" src="./js/moment.min.js"></script>
<script type="text/javascript" src="./js/fullcalendar.js"></script>
<script type="text/javascript" src="./js/ko.js"></script>
<style type="text/css">
	#attendanceimg{
		display: flex;
	}
	#attendancebtn:hover{
		background-color: #000084;
	}
	#attendancebtn:focus {
		background-color: #000084;	
	}
</style>     
</head>
<body>
<script type="text/javascript">
			$(function() {

				// page is now ready, initialize the calendar...

				$('#calendar').fullCalendar({
					header:{
						left: '',
						center: 'title',
						right: ''
					},
					fixedWeekCount : false,
					locale : "ko"
				})

			});
</script>
	<div class="row-fluid" style="height: 100%">
		<div class="span3"></div>
		<div class="span6">
			<div id='calendar'></div>
		</div>
		<div class="span3">
			<button class="btn btn-link" id="attendancebtn">출석체크</button>
		</div>		
<script type="text/javascript">
	$(function() {
		$("#attendancebtn").click(function() {
			$("td.fc-widget-content.fc-today")
			.append("&nbsp;<img id='attendanceimg' src='./image/attendance112.png'>");
		});
	
		$("td.fc-widget-content.fc-today ").prop("style",
				"background-color: #000085");
	
		
	
		$("td.fc-widget-content[data-date='2018-04-08']")
				.append("&nbsp;<img id='attendanceimg' src='./image/attendance112.png'>");
	});
</script>

</div>

</body>
</html>