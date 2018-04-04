<%@page import="com.DDot.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tiles:insertAttribute name="header"/>
	
<!-- Level function get -->
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/common.js"></script>

</head>
<body>



<script type="text/javascript">
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

//level get
$(window).on('load', function(){
	var level = g_level('${login.point}');
	var point = ${login.point};
	
	var exp_persent = g_percent(level, point);

	//$('.level').html(level);
	//level img set
	$('.levelImg').attr("src","<%=request.getContextPath()%>/image/level/lv"+level+".gif");
	
	//exp_persent
	console.log("exp==>"+exp_persent);
	//$('.expPersentBar').html("exp: "+exp_persent);
	$('.bar').prop("style", 'width: '+exp_persent+'%');

});

</script>
<div class="row-fluid">
	<div class="page-header">
		<h4>Level : </h4><img class="levelImg" src="">
	</div>
	<div class="progress progress-striped active">
  		<div class="bar"></div>
	</div>
	<hr>NickName: ${login.nickname} Point : ${login.point}<hr>
</div>


</body>
</html>