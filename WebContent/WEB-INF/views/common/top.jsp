<%@page import="com.DDot.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<div class="row-fluid" style="height:50px; background-color: black;">
	<div class="span2"></div>
	<!-- <div class="span8"><p class="text-center" style="padding-top:15px;"><font size="40">dev.</font></p></div> -->
	<div class="span8 text-center"><img src="./image/logo.png" class="center"></div>
	<div class="span2" style="padding-top:15px;">
	</div>
</div>
<div class="navbar-inner">
	<div class="row-fluid" style="margin-left:auto; margin-right:auto; width:95%;">
	<button type="button" class="btn btn-navbar collapsed" data-toggle="collapse" data-target=".nav-collapse">
          </button>
		<a class="brand" href="#">D.Dot</a>
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
						<li><a href="bbslist.do?category=0&subcategory=9">Java</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=1&subcategory=9">JSP</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=2&subcategory=9">JQuery</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=3&subcategory=9">Oracle/SQL</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=4&subcategory=9">Spring</a></li>
						<li class="divider"></li>
						<li><a href="bbslist.do?category=5&subcategory=9">E.T.C</a></li>
					</ul>
				</li>		
				<li class=""><a href="commlist.do">Community</a></li>
				<li class=""><a href="labatory.do">C.Lab</a></li>
				<li id="chatting" class=""><a href="#none">Chat</a></li>
				<li class=""><a href="donate.do">Donate</a></li>
				<li class=""><a href="attendance.do">attendance</a></li>
				<li class=""><a href="house.do">house</a></li>
				<% 	if(session.getAttribute("login") != null){
						MemberDto mem = (MemberDto)session.getAttribute("login");
						if(mem.getAuth()==1){
				%>
				<li class=""><a href="admin.do">AdminPage</a></li>
				<%}}%>
				
			</ul>
<!-- 		</div>
		<div class="nav-collapse pull-right"> -->
			<ul class="nav pull-right">
				<% if(session.getAttribute("login") == null){ %>
				<li><a tabindex="-1" href="regi.do">Join</a></li>
				<li><a tabindex="-1" href="login.do">Login</a></li>	
			<%} else {
				MemberDto mem = (MemberDto)session.getAttribute("login");	
			%>
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="none"> 
					<span class="nickname"><%=mem.getNickname() %></span> <span	class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li class=""><a href="#" id="userInfo">내 정보</a></li>
						<li class=""><a href="logout.do">로그아웃</a></li>
					</ul>
				</li>
			<%}%>
			</ul>
			<ul class="nav" id="message-nav">
			<% if(session.getAttribute("login") != null){
			%>
				<li class=""><a href="#"><img class="message" alt="message" src="./image/message.png" style="width: 24px; height: 20px;"></a></li>
			<%}%>
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
				  console.log("${chatstatus}");
				  location.reload();
			  },
			  error: function(xhr, status, error) {
		            alert(error);
		      }  
			 });
		window.open("chatting.do",'채팅','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=no,directories=no,width=600,height=790,top=0,left=500');
	}else if(chatStatus == null){
		alert("로그인이 필요합니다.");

	}else{
		alert("이미 채팅방이 켜져있습니다");
	}
});

//userInfo
$("#userInfo").click(function () {
	
/* 			$.ajax({
				type:"POST"
			  	,url:"setUserInfo.do" //세션 생성페이지 (setAttribute...)
				,async: false
			 	,success:function(){
				 	console.log('${login}');
				  	location.reload();
			  	},
			  	error: function(xhr, status, error) {
		        	alert(error);
		      	}  
			}); */
		window.open("userInfo.do",'내정보','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=800px,height=400px,top=100,left=100');
	});
	
//message
$("#message-nav").hover(function() {
	$(".message").attr("src", "./image/message_hover.png");
},function(){
	$(".message").attr("src", "./image/message.png");
});

$("#message-nav").click(function(){
	window.open("messagelist.do?category=0&sendto=${login.nickname}",'쪽지함','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=1000px,height=550px,top=100,left=500');
});

</script>