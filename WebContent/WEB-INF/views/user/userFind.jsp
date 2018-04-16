<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<fmt:requestEncoding value="utf-8"/>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DevDot</title>

<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/common.js"></script>
</head>
<body>

<div class="row-fluid">
	<!-- <div class="span6"> -->
	<table class="table-bordered">
		<tbody>
			<tr class="span6" style="margin:auto;">
				<td>
					<h4 class="span12">아이디 찾기</h4>
					<span class="span12">이름</span><input type="text" class="span8">
					<span class="span12">e-mail</span>
					<input type="text" class="span8">
					<button class="btn">찾기</button>
				</td>
			</tr>
			<!-- <div class="span6"> -->
			<tr class="span6" style="margin:auto;">
				<td>
					<h4 class="span12">비밀번호 찾기</h4>
					<span class="span12">아이디</span><input type="text" class="span8">
					<span class="span12">e-mail</span><input type="text" class="span8">
					<button class="btn">찾기</button>
				</td>
			</tr>
		</tbody>
	</table>
</div>

</body>
</html>