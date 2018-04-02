<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
		<% if(session.getAttribute("login") == null){ 
			System.out.println("session NUll Login =-=>> "+session.getAttribute("login")); }else{
			System.out.println("session Login =-=>> "+session.getAttribute("login"));}%>

<div class="span2">
</div>
<div class="span8 text-center">
	<div class="hero-unit">
		<h1>Wellcome!</h1>
		<p>환영합니다! 이곳은 개발자들을 위한 공간이며, 지식을 공유하고 자랑하세요!<br><br>
		즐거운 개발 되세요!</p>
	</div>
	<h4>Hello! Final Project</h4>
</div>
<div class="span2">
</div>

<body>

<br>

<script type="text/javascript">

</script>



</body>
</html>