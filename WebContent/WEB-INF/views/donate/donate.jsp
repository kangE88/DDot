<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<%
int pic = (int)(Math.random()*4);
%>
<div class="row-fluid">
	<div class="span2"></div>
	<div class="span8 text-center">
		<br><br>
		<div class="hero-unit">
		개발도중 자료를 검색하다보면 많은 도움을 주는 그런 DEVDOT이 되고싶습니다.<br>
		<br>
		DEVDOT! 기부를 해주시는 것 자체만으로도 큰 힘이 됩니다 감사합니다.</h4>
		<br>
		</div>
	</div>
	<div class="span2"></div>
</div>
<br><br>
<div class="row-fluid">
	<div class="span2"></div>
	<div class="span8" style="text-align:center">
		<img src="./image/dev<%=pic %>.png">
	</div>
	<div class="span2"></div>
</div>
<!-- 
<div class="span2"></div>
<br><br><br><br><br>
<div class="span3"><h4>이번달 목표금액 목표치 달성</h4></div>
<div class="span8">
	<div class="progress progress-striped active">
  		<div class="bar" style="width: 40%;"></div>
	</div>
</div>
<div class="span1"></div> -->

</body>












