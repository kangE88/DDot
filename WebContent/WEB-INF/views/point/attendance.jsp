<%@page import="com.DDot.model.MemberDto"%>
<%@page import="com.DDot.service.impl.PointServiceImpl"%>
<%@page import="com.DDot.service.PointService"%>
<%@page import="com.DDot.model.PointDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="./css/fullcalendar.css">
<script type="text/javascript" src="./js/moment.min.js"></script>
<script type="text/javascript" src="./js/fullcalendar.js"></script>
<script type="text/javascript" src="./js/ko.js"></script>
<script type="text/javascript" src="./jquery/point.js?ver=1"></script>
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
<%
if(session.getAttribute("login") == null){
%>
<script type="text/javascript">
	alert("로그인 후 이용 가능합니다.");
	location.href="login.do";
</script>
<%
}else{
	MemberDto mem = (MemberDto)session.getAttribute("login");
%>

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
				console.log("datadate: " + datadate);
				$("td.fc-day.fc-widget-content[data-date='"+datadate+"']")
				.append("&nbsp;<img id='attendanceimg' src='./image/attendance112.png'>");
			}
		}		
		
		$("#attendancebtn").click(function() {
			if(attendstring.charAt(day)==0){
				$("td.fc-day.fc-widget-content.fc-today").append("&nbsp;<img id='attendanceimg' src='./image/attendance112.png'>");
				location.href="attendanceAf.do";
			}
			else{
				alert("오늘은 이미 출석체크 하였습니다.");
			}
		});
	
		$("td.fc-day.fc-widget-content.fc-today").prop("style",
				"background-color: #000085");	
		
		});
</script>

</div>
<%
}
%>
</body>
</html>