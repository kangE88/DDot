<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<!-- css & js add Start -->
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="./css/prettify.css">

<script src="./js/sockjs-0.3.4.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>
<!-- css & js End -->

<!-- animation off -->
<script type="text/javascript">
	_386 = {fastLoad: true};
</script>

<script type="text/javascript">
	$(document).ready(function() {

		$("#sendBtn").click(function() {

			sendMessage();

		});

		$('#message').keydown(function(key) {
			if (key.keyCode == 13) {
				sendMessage();

			}
		});

	});

	var sock;

	//웸소켓을 지정한 url로 연결한다.

	sock = new SockJS("<c:url value="/echo"/>");

	//자바스크립트 안에 function을 집어넣을 수 있음.

	//데이터가 나한테 전달되읐을 때 자동으로 실행되는 function

	sock.onmessage = onMessage;

	//데이터를 끊고싶을때 실행하는 메소드

	sock.onclose = onClose;

	/* sock.onopen = function(){

	    sock.send($("#message").val());

	}; */

	function sendMessage() {

		/*소켓으로 보내겠다.  */

		sock.send($("#message").val());
		$("#message").val("");

	}

	//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

	function onMessage(evt) {

		var data = evt.data;

		$("#data").append(data + "<br/>");

		//sock.close();

	}

	function onClose(evt) {

		//sock.send('${login.id} 님이 퇴장하셨습니다');
		
		

		
	}

	//마우스 오른 쪽 금지

	document.oncontextmenu = function() {
		return false;
	}

	//새로고침 방지

	// Ctrl+R, Ctrl+N, F5 키 막음

	function doNotReload() {
		if ((event.ctrlKey == true && (event.keyCode == 78 || event.keyCode == 82))
				|| (event.keyCode == 116)) // function F5 //78 ,82 ctrl+N , ctrl+R 

		{
			event.keyCode = 0;
			event.cancelBubble = true;
			event.returnValue = false;
		}
	}
	document.onkeydown = doNotReload;
	
/* 	$(window).bind("beforeunload", function (){
		
		 $.ajax({
			  type:"POST"
			  ,url:"chatstatus.do" //세션 생성페이지 (setAttribute...)
			  ,data:{"chatstat" : 0}
			  ,success:function(){
				  opener.location.reload();
			  },
			  error: function(xhr, status, error) {
		            alert(error);
		      }  
			 }); 
		

		return "";
	});
	 */
	window.onunload = function() {
	
		//sessionStorage.getItem("chatstatus");
		 
		 
		  
	    $.ajax({
			  type:"POST"
			  ,url:"chatstatus.do" //세션 생성페이지 (setAttribute...)
			  ,data:{"chatstat" : 0}
			  ,async: false
			  ,success:function(){
				  console.log(${chatstatus});
				  opener.location.reload();			 
			  },
			  error: function(xhr, status, error) {
		            alert(error);
		      }  
			 }); 
	   
	   // return "나가실래요?";
	    
	    
	}

</script>


</head>

<body>

	<!-- top util -->
	<div style="position:fixed; top: 10px; width:95%; align:center;">
	<!--  <input type="button" id="aaaBtn" class="btn" value="쪽지보내기" style="align: left;">  -->
	<input type="button" id="usersBtn" class="btn" value="◁" style="right: 0">
    </div>
	
	<!-- 채팅데이터  -->
	<div id="data"></div>
	
	<!-- input text -->
	<div style="position:fixed; bottom: 10px; width:95%; align:center;">
	<input type="text" id="message" style="width: 85%; background-color: black; color: white;">
	<input type="button" id="sendBtn" class="btn" value="send">
    </div>

	

</body>
</html>