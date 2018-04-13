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

<body> 

<!-- navbar top ================================== -->
	<div class="navbar navbar-inverse navbar-fixed-top" style="height:5%;">
		<tiles:insertAttribute name="top"/>
	</div>
	<header class="jumbotron subhead">
		<div class="container" style="height:12%;">
		</div>
	</header>
<!-- Main ================================== -->
	<div class="row-fluid" style="height:80%;">
		<tiles:insertAttribute name="main" />
	</div>

<!-- Footer    ================================================== -->
<div class="footer navbar-fixed-bottom" style="height:7%;">
	<tiles:insertAttribute name="footer"/>
</div>
</body>

<!-- Command Help Modal ================================== -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h4 id="myModalLabel"><font color="SlateBlue">Help Command</font></h4>
  </div>
  <div class="modal-body">
    <h4>/move * <font color="black"> : move to *</font></h4>
    <h4>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="blue">* : home, board-category, community,<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;clab, donate, attendance, house</font></h4>
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
	case "/move clab":
		location.href="./labatory.do"
		break;
	case "/move donate":
		location.href="./donate.do"
		break;	
	case "/move attendance":
		location.href="./attendance.do"
		break;
	case "/move house":
		location.href="./house.do"
		break;
	}
		$("#cmd").val("");	
	}
});
</script>  


</html>
