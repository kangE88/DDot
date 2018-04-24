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
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel"><font color="SlateBlue">Help Command</font></h4>
  </div>
  <div class="modal-body">
  	<h4>/login <font color="black"> : Login</font></h4>
  	------------------------------------------------
  	<h4>/logout <font color="black"> : Logout</font></h4>
  	------------------------------------------------
  	<h4>/mail <font color="black"> : ReadMail</font></h4>
  	------------------------------------------------
    <h4>/move * <font color="black"> : move to *</font></h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">* : home, board-category, community,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;clab, donate, attendance, house,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;chat</font></h4>
    ------------------------------------------------
    <h4>board's category <font color="black"> : java, jsp, jquery, oracle,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spring, etc</font></h4>
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
		case "/move home":
			location.href="./main.do"
			break;
		case "/move community":
			location.href="commlist.do"
			break;
		case "/move clab":
			location.href="./labatory.do"
			break;
		case "/move donate":
			location.href="./donate.do"
			break;			
		case "/move attendance":
			<%
			if(session.getAttribute("login") == null){
			%>
			alert("로그인이 필요한서비스 입니다.");
			location.href="login.do";
			<%}else{%>
			location.href="./attendance.do"
			<%}%>
			break;
		case "/move house":
			<%
			if(session.getAttribute("login") == null){
				%>
				alert("로그인이 필요한서비스 입니다.");
				location.href="login.do";
				<%}else{%>
				location.href="./house.do"
				<%}%>		
			break;
		case "/move board-java":
			location.href="http://localhost:8090/DDot/bbslist.do?category=0&subcategory=9";
			break;
		case "/move board-jsp":
			location.href="http://localhost:8090/DDot/bbslist.do?category=1&subcategory=9";
			break;
		case "/move board-jquery":
			location.href="http://localhost:8090/DDot/bbslist.do?category=2&subcategory=9";
			break;
		case "/move board-oracle":
			location.href="http://localhost:8090/DDot/bbslist.do?category=3&subcategory=9";
			break;
		case "/move board-spring":
			location.href="http://localhost:8090/DDot/bbslist.do?category=4&subcategory=9";
			break;
		case "/move board-etc":
			location.href="http://localhost:8090/DDot/bbslist.do?category=5&subcategory=9";
			break;
		case "/login":
			<%
			if(session.getAttribute("login") == null){
				%>				
				location.href="login.do";
				<%}else{%>
				alert("이미 로그인 되어있습니다.");
				<%}%>		
			break;
		case "/logout":
			<%
			if(session.getAttribute("login") == null){
				%>
				alert("로그인이 필요한서비스 입니다.");
				location.href="login.do";
				<%}else{%>
				location.href="./logout.do"
				<%}%>		
			break;
		case "/move chat":
			<%
			if(session.getAttribute("login") == null){
			%>
			alert("로그인이 필요한서비스 입니다.");
			location.href="login.do";
			<%}else{%>
			location.href="./chatting.do"
			<%}%>
			break;
		case "/mail":
			<%
			if(session.getAttribute("login") == null){
			%>
			alert("로그인이 필요한서비스 입니다.");
			location.href="login.do";
			<%}else{%>
			window.open("messagelist.do?category=0&sendto=${login.nickname}",'쪽지함','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=1000px,height=550px,top=100,left=500');
			<%}%>
			break;			
	}
		$("#cmd").val("");	
	}
});
</script>  


</html>
