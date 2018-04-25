<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<title>DevDot</title>
<head>
	<tiles:insertAttribute name="header"/>
</head>

<body data-spy="scroll" data-target=".bs-docs-sidebar" style="visibility: visible;">

	<!-- navbar top ================================== -->
	<tiles:insertAttribute name="top"/>
	<!-- Main ================================== -->
	<div class="row-fluid">
		<tiles:insertAttribute name="main" />
	</div>
	
	<!-- Footer    ================================================== -->
	<tiles:insertAttribute name="footer"/>
</body>

<!-- Command Help Modal ================================== -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-header">
		<button type="button" class="close" data-dismiss="modal"
			aria-hidden="true">×</button>
		<h4 id="myModalLabel">
			<font color="SlateBlue">Help Command</font>
		</h4>
	</div>
	<div class="modal-body">
		<h4>
			/home <font color="black"> : home</font>
		</h4>
		------------------------------------------------
		<h4>
			/board-category <font color="black"> : Board</font>
		</h4>
		------------------------------------------------
		<h4>
			board's category <font color="black"> : java, jsp, jquery,
				oracle,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spring,
				etc
			</font>
		</h4>
		------------------------------------------------
		<h4>
			/community <font color="black"> : Community</font>
		</h4>
		------------------------------------------------
		<h4>
			/clab <font color="black"> : C.Lab</font>
		</h4>
		------------------------------------------------
		<h4>
			/login <font color="black"> : Login</font>
		</h4>
		------------------------------------------------
		<h4>
			/donate <font color="black"> : Donate</font>
		</h4>
		------------------------------------------------
		<h4>
			/attendance <font color="black"> : Attendance</font>
		</h4>
		------------------------------------------------
		<h4>
			/house <font color="black"> : House</font>
		</h4>
		------------------------------------------------
		<h4>
			/chat <font color="black"> : Chatting</font>
		</h4>
		------------------------------------------------
		<h4>
			/mail <font color="black"> : Read&SendMail</font>
		</h4>
		------------------------------------------------
		<h4>
			/logout <font color="black"> : Logout</font>
		</h4>

	</div>
	<div class="modal-footer">
		<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
	</div>
</div>


<script type="text/javascript">
//top navbar dropdown
$(".dropdown-toggle").dropdown();

$(document).ready(function() {
	$("#content_title_wrap div.title").css("background-image",
							"url('<%=request.getContextPath() %>/image/ico_sub_sb.gif')");	
});

// Command Script ===================================== 
$("#cmd").keydown(function(key) {
	if (key.keyCode == 13) {
	var command = $("#cmd").val();
	
	switch(command){
		case "/help":
			$('#myModal').modal('show')
			break;
		case "/?":
			$('#myModal').modal('show')
			break;
		case "/home":
			location.href="./main.do"
			break;
		case "/community":
			location.href="commlist.do"
			break;
		case "/clab":
			location.href="./labatory.do"
			break;
		case "/donate":
			location.href="./donate.do"
			break;			
		case "/attendance":
			<%if (session.getAttribute("login") == null) {%>
			alert("로그인이 필요한서비스 입니다.");
			location.href="login.do";
			<%} else {%>
			location.href="./attendance.do"
			<%}%>
			break;
		case "/house":
			<%if (session.getAttribute("login") == null) {%>
				alert("로그인이 필요한서비스 입니다.");
				location.href="login.do";
				<%} else {%>
				location.href="./house.do"
				<%}%>		
			break;
		case "/board-java":
			location.href="http://localhost:8090/DDot/bbslist.do?category=0&subcategory=9";
			break;
		case "/board-jsp":
			location.href="http://localhost:8090/DDot/bbslist.do?category=1&subcategory=9";
			break;
		case "/board-jquery":
			location.href="http://localhost:8090/DDot/bbslist.do?category=2&subcategory=9";
			break;
		case "/board-oracle":
			location.href="http://localhost:8090/DDot/bbslist.do?category=3&subcategory=9";
			break;
		case "/board-spring":
			location.href="http://localhost:8090/DDot/bbslist.do?category=4&subcategory=9";
			break;
		case "/board-etc":
			location.href="http://localhost:8090/DDot/bbslist.do?category=5&subcategory=9";
			break;
		case "/login":
			<%if (session.getAttribute("login") == null) {%>				
				location.href="login.do";
				<%} else {%>
				alert("이미 로그인 되어있습니다.");
				<%}%>		
			break;
		case "/logout":
			<%if (session.getAttribute("login") == null) {%>
				alert("로그인이 필요한서비스 입니다.");
				location.href="login.do";
				<%} else {%>
				location.href="./logout.do"
				<%}%>		
			break;
		case "/chat":
			<%if (session.getAttribute("login") == null) {%>
			alert("로그인이 필요한서비스 입니다.");
			location.href="login.do";
			<%} else {%>			
			var chatStatus = <%=session.getAttribute("chatstatus")%>
			
			if (chatStatus == 0) {
					$.ajax({
					  type:"POST"
					  ,url:"chatstatus.do" //세션 생성페이지 (setAttribute...)
					  ,data:{"chatstat" : 1}
					  ,success:function(){
						  console.log("${chatstatus}");
						  location.reload();
					  },
					  error: function(xhr, status, error) {
				            alert(error);
				      }  
					 });
				window.open("chatting.do",'채팅','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=600,height=790,top=0,left=500');
			}
			<%}%>
			
			break;
		case "/mail":
			<%if (session.getAttribute("login") == null) {%>
			alert("로그인이 필요한서비스 입니다.");
			location.href="login.do";
			<%} else {%>
			window.open("messagelist.do?category=0&sendto=${login.nickname}",'쪽지함','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=1000px,height=550px,top=100,left=500');
			<%}%>
			break;			
		}
		$("#cmd").val("");	
	}
});
</script>


</html>
