<%@page import="com.DDot.service.impl.PointServiceImpl"%>
<%@page import="com.DDot.service.PointService"%>
<%@page import="com.DDot.model.PointDto"%>
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
<script type="text/javascript" src="./jquery/point.js"></script>
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
		
		var date = new Date();
		var year = date.getFullYear();
		var month = date.getMonth()+1;
		var day = date.getDate();		
		
		var tmonth = p_two(month.toString());
		var tday = p_two(day.toString());		
		
		<%
		PointDto pdto = (PointDto)request.getAttribute("pdto");		
		%>
		
		var attendstring = "<%=pdto.attendstring() %>";
		
		
		for(i=1;i<32;i++){
			
			var aday = attendstring.charAt(i);
			console.log(aday);
			if(aday=='1'){				
				var datadate = year+'-'+tmonth+'-'+p_two(i.toString());				
				$("td.fc-widget-content[data-date='"+datadate+"']")
				.append("&nbsp;<img id='attendanceimg' src='./image/attendance112.png'>");
			}
		}		
		
		$("#attendancebtn").click(function() {
			if(attendstring.charAt(day)==0){
				$("td.fc-widget-content.fc-today").append("&nbsp;<img id='attendanceimg' src='./image/attendance112.png'>");
				location.href="attendanceAf.do";
			}
			else{
				alert("오늘은 이미 출석체크 하였습니다.");
			}
		});
	
		$("td.fc-widget-content.fc-today").prop("style",
				"background-color: #000085");	
		
		});
</script>

</div>

</body>
</html>