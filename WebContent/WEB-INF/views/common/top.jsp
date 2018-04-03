<%@page import="com.DDot.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row-fluid" style="height:50px; background-color: black;">
	<div class="span2"></div>
	<!-- <div class="span8"><p class="text-center" style="padding-top:15px;"><font size="40">dev.</font></p></div> -->
	<div class="span8 text-center"><img src="./image/logo.png" class="center"></div>
	<div class="span2" style="padding-top:15px;">
		<ul class="nav">
		<% if(session.getAttribute("login") == null){ 
			System.out.println("session Login =-=>> "+session.getAttribute("login")); %>
			<li>
				<a tabindex="-1" href="login.do">Login</a>
			</li>	
		<%
			} else {
				MemberDto mem = (MemberDto)session.getAttribute("login");
				
		%>	
			<li>
				<a tabindex="-1" href="#"><%=mem.getId() %></a>
			</li>
		<%}%>
		</ul>
	</div>
</div>
<div class="navbar-inner">
	<div class="container">
		<button type="button" class="btn btn-navbar" data-toggle="collapse"
			data-target=".nav-collapse"></button>
		<a class="brand" href="./index.jsp">D.Dot</a>
		<div class="nav-collapse collapse">
			<ul class="nav">
				<li class="">
					<a href="./index.jsp">Home</a>
				</li>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="none"> 
					Board <span	class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="bbslist.do?category=0">Java</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=1">JSP</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=2">JQuery</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=3">Oracle/SQL</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=4">Spring</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=5">E.T.C</a></li>
					</ul>
				</li>		
				<li class=""><a href="./scaffolding.html">Community</a></li>
				<li class=""><a href="labatory.do">C.Lab</a></li>
				<li id="chatting" class=""><a href="#none">Chat</a></li>
				<li class=""><a href="donate.do">Donate</a></li>
			</ul>
		</div>
	</div>
</div>

<script>
$("#chatting").click(function () {
//	window.open("chatting.do",'_blank');
	//$("#chatting").hide();
	var chatStatus = <%=session.getAttribute("chatstatus")%>
	
	if (chatStatus == 0) {
			$.ajax({
			  type:"POST"
			  ,url:"chatstatus.do" //세션 생성페이지 (setAttribute...)
			  ,data:{"chatstat" : 1}
			  ,success:function(){
				  console.log(${chatstatus});
				  location.reload();
			  },
			  error: function(xhr, status, error) {
		            alert(error);
		      }  
			 });
		window.open("chatting.do",'채팅','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=600,height=790,top=100,left=100');
	}else if(chatStatus == null){
		alert("로그인이 필요합니다.");

	}else{
		alert("이미 채팅방이 켜져있습니다");
	}
});
</script>