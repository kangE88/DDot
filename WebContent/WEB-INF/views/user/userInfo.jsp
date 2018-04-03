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
	<style type="text/css">
	img{
		filter:none;
	}
	</style>
</head>
<body>



<script type="text/javascript">
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

//level get
$(window).on('load', function(point){
	var level = g_level('${login.point}');
	
	$('.level').html(level);
	$('.levelImg').attr("src","<%=request.getContextPath()%>/image/level/lv"+level+".gif");
});
</script>
<div class="row-fluid">
	<div class="span4">
		point ==> <%=mem.getPoint() %>
		<!-- <img alt="" src="./images/level/'+g_level(mem.getPoing())+'png'"> -->
		<p class="level"></p>
		<img class="levelImg" src="">
	</div>
</div>


</body>
</html>