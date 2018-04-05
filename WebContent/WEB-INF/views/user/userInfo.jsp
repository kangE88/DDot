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

</head>
<script type="text/javascript">
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

//level get
$(window).on('load', function(){
	var level = g_level('${login.point}');
	var point = ${login.point};
	
	var exp_persent = g_percent(level, point);
	
	var profileImg = "/img/${login.id}/${login.pic}";

	//$('.level').html(level);
	//level img set
	$('.levelImg').attr("src","<%=request.getContextPath()%>/image/level/lv"+level+".gif");
	$('#profile').attr('src', profileImg);
	//exp_persent
	console.log("exp==>"+exp_persent);
	//$('.expPersentBar').html("exp: "+exp_persent);
	$('.bar').prop("style", 'width: '+exp_persent+'%');

});

</script>
<body>
<div class="row-fluid">
	<div class="page-header span12" style="height:100px;">
		<p class="span1">Lv :</p><img class="levelImg span1" style="height:30px;">
		<div class="progress progress-striped active span7">
		  		<div class="bar"></div>
		</div>
	</div>
	<div class="row-fluid">
		<div class="span4">
			<img id=profile class="span4">
		</div>
		<div class="span8">
			
		</div>
	</div>
	<div class="row-fluid">
		<p>NickName: ${login.nickname}</p>
	</div>
</div>

</body>
</html>