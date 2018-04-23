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
<style type="text/css">
/*
We set the element we are applying our loading mask to relative  
*/
.loading-mask {
  position: relative;
}

/*
Because we set .loading-mask relative, we can span our ::before  
element over the whole parent element  
*/
.loading-mask::before {
  content: '';
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background-color: rgba(0, 0, 0, 0.25);
}

/*
Spin animation for .loading-mask::after  
*/
@keyframes spin {
  from {
    transform: rotate(0deg);
  }
  to {
    transform: rotate(359deg);
  }
}

/*
The loading throbber is a single spinning element with three  
visible borders and a border-radius of 50%.  
Instead of a border we could also use a font-icon or any  
image using the content attribute.  
*/
.loading-mask::after {
  content: "";
  position: absolute;
  border-width: 3px;
  border-style: solid;
  border-color: transparent rgb(255, 255, 255) rgb(255, 255, 255);
  border-radius: 50%;
  width: 24px;
  height: 24px;
  top: calc(50% - 12px);
  left: calc(50% - 12px);
  animation: 2s linear 0s normal none infinite running spin;
  filter: drop-shadow(0 0 2 rgba(0, 0, 0, 0.33));
}
</style>
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
<%-- 	<div id='loadingmessage' style='display:none'>
  		<img src='<%=request.getContextPath()%>/image/loading_spinner.gif'/>
	</div> --%>
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
	
	$(document.body).addClass('loading-mask');
	
	var email = $('#p_email').val();
	var id = $('#getid').val();
	//$('.loading-mask').show();  // show the loading message.

	$.ajax({
		url: "sendpw.do",
		type: "post",
		data : {id : id, email : email},
		success:function(){
			//$('.loading-mask').hide();
			$(document.body).removeClass('loading-mask');
			alert("비밀번호 메일 전송 완료!");
		},
		error:function(request,status,error){
	        alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	    }
	});
});

</script>

</body>
</html>