<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- css & js add Start -->
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css?ver=3">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="./css/prettify.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>

<!-- global function -->
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/common.js"></script>
<script src="./js/sockjs-0.3.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/jquery.cookie.js"></script>

<style type="text/css">
	a:hover {
		background-color: #000084;   
	};
	.levelImg{
		-webkit-filter: none;
		filter: none;
	};
</style>

<!-- css & js End -->

<!-- animation off -->
<script type="text/javascript">
	_386 = {fastLoad: true};
	
	function logout(){
	    alert("일정시간이 지나 로그아웃 되었습니다.");
	    location.href="logout.do";
	}
	<% if(session.getAttribute("login") != null){ %>
		setTimeout("logout()",1000*6000);
	<%}%>
</script>

