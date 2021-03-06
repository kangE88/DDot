<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="com.DDot.websocket.EchoHandler"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


<style type="text/css">
.toggler {
	position: fixed;
	top: 40px;
	right: 0;
	width: 240px;
	height: auto;
}

#button {
	padding: .5em 1em;
	text-decoration: none;
}

#effect {
	position: relative;
	width: 240px;
	height: 170px;
	padding: 0.4em;
	right: 0px;
	background-color: gray;
}

#effect h3 {
	margin: 0;
	padding: 0.4em;
	text-align: center;
}

.user-area p {
	margin: 0;
	color: #ffffff;
}

.user-area {
    height: 142px;
	width: auto;
	overflow-y: scroll;
}

.mychat {
	margin: 0;
	color: yellow;
}

.otherchat {
	margin: 0;
}

.alertchat {
	margin: 0;
	color: #FFB6C1;
}
</style>

<!-- css & js End -->
</head>
<body>

	<!-- top util -->
	<div style="position: fixed; top: 10px; right: 10px; width: 60px;">
		<!--  <input type="button" id="aaaBtn" class="btn" value="쪽지보내기" style="align: left;">  -->
		<input type="button" id="usersBtn" class="btn" value="접속자"
			style="right: 0">
	</div>

	<!-- 채팅데이터  -->
	<div id="data" style="margin-bottom: 50px;"></div>


	<!-- input text -->
	<div style="position: fixed; bottom: 10px; width: 95%; align: center;">
		<input type="text" id="message"
			style="width: 85%; background-color: black; color: white;"> <input
			type="button" id="sendBtn" class="btn" value="send">
	</div>

	<div class="toggler">
		<div id="effect" class="ui-widget-content ui-corner-all" >
			<h3 class="ui-widget-header ui-corner-all" id="chat-usercount">현재 접속자</h3>


			<div class="user-area">
				<p>로딩중...</p>
			</div>
		</div>
	</div>


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

		sock.onopen = onOpen;

		function onOpen() {
		};

		function sendMessage() {

			/*소켓으로 보내겠다.  */

			/* sock.send($("#message").val());
			$("#message").val(""); */

			if ($("#message").val() != '') {

				var data = {};
				var nick = "${login.nickname}";

				data.nickname = nick;
				data.isFirst = false;
				data.message = $("#message").val();

				var json = JSON.stringify(data);
				sock.send(json);

				$("#message").val("");

			}

		}

		//evt 파라미터는 웹소켓을 보내준 데이터다.(자동으로 들어옴)

		function onMessage(evt) {

			var data = evt.data;

			$("#data").append(data);
			autoScroll();
			inMember();

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
			$.ajax({
				type : "POST",
				url : "chatstatus.do" //세션 생성페이지 (setAttribute...)
				,
				data : {
					"chatstat" : 0
				},
				async : false,
				success : function() {
					console.log("${chatstatus }");

					opener.location.reload();
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});
		}
	</script>
	<script>
		// 현재 접속자 보여주기
		$(function() {
			// run the currently selected effect
			function runEffect() {
				// get effect type from
				var selectedEffect = 'slide';

				// Most effect types need no options passed by default
				var options = {};
				// some effects have required parameters
				if (selectedEffect === "scale") {
					options = {
						percent : 50
					};
				} else if (selectedEffect === "size") {
					options = {
						to : {
							width : 200,
							height : 60
						}
					};
				}

				// Run the effect
				$("#effect").toggle(selectedEffect, {
					direction : 'right',
					mode : 'show'
				}, 500);
			}
			;

			// Set effect from select menu value
			$("#usersBtn").on("click", function() {
				runEffect();
			});
		});

		// 자동스크롤 내리기

		/* var div = document.getElementById("data");
		div.scrollTop = div.scrollHeight; */
		function autoScroll() {
			$(document).scrollTop($('#data').height());
		}

		// 접속자 명단 출력 및 갱신
		function inMember() {
			var write = "";
			$.ajax({
				type : "POST",
				url : "chatuser.do", //세션 생성페이지 (setAttribute...)
				success : function(data) {
					$.each(data.userlist, function(index, item) {
						write += "<p><a align='center' style='cursor: pointer; margin:0px' onclick='goUserListUrl(this)'>"+item+"</a></p>";

					});
					$("#chat-usercount").html("접속자 "+ data.userlist.length + "명");
					$(".user-area").html(write);
				},
				error : function(xhr, status, error) {
					alert(error);
				}
			});

		}
		
		function goUserListUrl(ajaxNick) {
			var nick = $(ajaxNick).text();
			window.open("userInfo_bbs.do?nickname="+nick,'상대정보','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=800px,height=400px,top=100,left=100');
		}
	</script>

</body>
</html>