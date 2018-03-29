<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<title>DevDot</title>

<!-- css & js 파일 추가하는 부분 Start -->
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="./css/prettify.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script type="text/javascript" src="./js/bootstrap.js"></script>

<!-- css & js 파일 추가하는 부분 End -->

<!-- 애니메이션 끄는부분 시작 -->

<script type="text/javascript">
	_386 = {fastLoad: true};
</script>

<!-- 애니메이션 끄는부분 끝 -->
<style type="text/css">	
	
	#footer{
		height:40px;
	}	
}


</style>

</head>
<body style="height: 100%">

<div style="height: 11%">

	<div class="navbar navbar-inverse navbar-fixed-top">
		<div style="height:50px; background-color: black;">
			<img src="" />
		</div>
		<div class="navbar-inner" style="height: 15%">
			<div class="container">
				<button type="button" class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"></button>
				<a class="brand" href="./index.jsp">D.Dot</a>
				<div class="nav-collapse collapse">
					<ul class="nav">
						<li class="">
							<a href="./index.html">Home</a>
						</li>
						<li class="dropdown">
							<a class="dropdown-toggle" data-toggle="dropdown" href="none"> 
							Board <span	class="caret"></span>
							</a>
							<ul class="dropdown-menu">
								<li><a href="#">Java</a></li>
								<li class="divider"></li>
								<li><a href="#">JSP</a></li>
								<li class="divider"></li>
								<li><a href="#">JQuery</a></li>
								<li class="divider"></li>
								<li><a href="#">Oracle/SQL</a></li>
								<li class="divider"></li>
								<li><a href="#">Spring</a></li>
								<li class="divider"></li>
								<li><a href="#">E.T.C</a></li>
							</ul>
						</li>		
						<li class=""><a href="./scaffolding.html">Community</a></li>
						<li class=""><a href="labatory.do">C.Lab</a></li>
						<li class=""><a href="./components.html">Donate</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
	<div class="span12" style="height: 82%">
		<tiles:insertAttribute name="main"/>
	</div>


<script type="text/javascript">
	$(".dropdown-toggle").dropdown();
</script>

<!-- Command Help Modal ================================== -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Help Command</h3>
  </div>
  <div class="modal-body">
    <h4>/move * <font color="black"> : move to *</font></h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">* : home, board-category, community,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;clab, donate</font></h4>
    ------------------------------------------------
    <h4>board's category <font color="black"> : java, jsp, jquery, oracle,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;spring, etc</font></h4>
  </div>
  <div class="modal-footer">
    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>    
  </div>
</div>
 
<%-- <div class="navbar navbar-inverse navbar-fixed-bottom">
	<div class="container" style="width: 100%">
		<table class="table table-condensed">		
			<col width="70%"><col width="30%">	
			<tr>
				<td>
					<input type="text" style="width: 70%;" id="cmd" >
				</td>
				<td align="right">
				CopyRight By DDot since 2018
				</td>
			</tr>
			
		</table>
	</div>
</div> --%>

<!-- Footer    ================================================== -->
<footer class="footer navbar-fixed-bottom" style="height: 7%; background-color: #000084 ">
  <div class="container-col-md-12">
    <table class="table table-condensed">		
		<col width="70%"><col width="30%">	
		<tr>
		<td>
			Commnad Line : <input type="text" style="width: 70%; background-color: black; color: white" id="cmd" >
			</td>
			<td align="right">
			CopyRight By DDot since 2018
			</td>
		</tr>	
	</table>
   </div>

</footer>

<script type="text/javascript">
$(document).ready(function() {
	$("#content_title_wrap div.title").css("background-image",
							"url('<%=request.getContextPath() %>/image/ico_sub_sb.gif')");	
});

</script>
<!-- Command 창 Script ===================================== -->
<script type="text/javascript">
	$("#cmd").keydown(function(key) {
 		if (key.keyCode == 13) {
			var command = $("#cmd").val();
			
			switch(command){
			case "/help":
				$('#myModal').modal('show')
				break;
			case "/move home":
				location.href="./main.do"
				break;
			case "/move clab":
				location.href="./labatory.do"
				break;	
				
				
				}
			$("#cmd").val("");	
			}
			
 		});
</script>  

</body>
</html>
