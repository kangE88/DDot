<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="row-fluid" style="height:50px; background-color: black;">
	<div class="span2"></div>
	<!-- <div class="span8"><p class="text-center" style="padding-top:15px;"><font size="40">dev.</font></p></div> -->
	<div class="span8 text-center"><img src="./image/logo.png" class="center"></div>
	<div class="span2" style="padding-top:15px;">
		<ul class="nav">
		<li><a tabindex="-1" href="login.do">Login</a></li>
		<!-- 
				<li class="dropdown">
					<a class="dropdown-toggle" data-toggle="dropdown" href="none"> 
					id <span class="caret"></span>
					</a>
					<ul class="dropdown-menu">
						<li><a href="#">내정보</a></li>
						<li class="divider"></li>
						<li><a href="#">정보 수정</a></li>
						<li class="divider"></li>
						<li><a href="#">로그아웃</a></li>
						<li class="divider"></li>
					</ul>
				</li>
		 -->
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