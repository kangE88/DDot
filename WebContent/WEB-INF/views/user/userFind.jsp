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
<div class="span3"></div>
<div class="span6">
	<div class="row-fluid" style="border: 1px solid">
		<br>
		<h3 class="span12">아이디 찾기</h3><br>
		<span class="span12">e-mail</span>
		<span class="span12">
			<input type="text" id="email" class="span8">
			<button class="btn" id="find_id" class="span4">찾기</button>
			<br><br>
		</span>
	</div>
	<br><br>
	<div class="row-fluid" style="border: 1px solid">
		<br>
		<h3 class="span12">비밀번호 찾기</h3>
		<span class="span12">아이디</span>
		<span class="span12">
			<input type="text" class="span8" id="getid"><br>
			<span class="span12">e-mail</span>
			<input type="text" class="span8" id="p_email">
			<button class="btn" id="find_pwd" class="span4">찾기</button>
			<br><br>
		</span>
		<br>
	</div>
</div>

<div class="span3"></div>

<script type="text/javascript">

$('#find_id').click(function(){
	
	var email = $('#email').val();
	
	$.ajax({
		type: "post",
		url: "findID.do",
		async:true,
		data:"email=" + email,
		success:function(id){
			if(id != null){
				alert("찾으시는 아이디는 "+id+" 입니다.");
				$('#getid').val(id);
			}else{
				alert("찾으시는 아이디가 없습니다.");
			}
		},
	});
});

$('#find_pwd').click(function(){
	alert("pwd find click");
	
	var email = $('#p_email').val();
	var id = $('#getid').val();
	
	var formData = new FormData();
	
	formData.append("id",id);
	formData.append("email",email);

	$.ajax({
		type: "post",
		url: "findPWD.do",
		async:true,
		data:formData,
		dataType : 'json',
		contentType: false,
		processData : false,
		success:function(data){
			alert("success");
			alert("pwd===>"+data[0]);
			if(pwd != null){
				alert("찾으시는 비밀번호는 "+pwd+" 입니다.");
				//$('#getid').val(id);
			}else{
				alert("아이디 또는 이메일을 확인하시기 바랍니다.");
			}
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
});

</script>

</body>
</html>