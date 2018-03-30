<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<fmt:requestEncoding value="utf-8"/>    

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>regi</title>

<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
      }

      .form-signin {
        max-width: 700px;
        padding: 19px 29px 29px;
        margin: 0 auto 20px;
        border: 1px solid #e5e5e5;
      }
      .form-signin .form-signin-heading,
      .form-signin .checkbox {
        margin-bottom: 10px;
      }
      .form-signin input[type="text"],
      .form-signin input[type="password"] {
        font-size: 16px;
        height: auto;
        margin-bottom: 15px;
        padding: 7px 9px;
      }

    </style>
    <link href="./css/bootstrap-responsive.css" rel="stylesheet">
</head>
<body>
<div class="col-md-12">

      <form class="form-signin">
        <h2 class="form-signin-heading">Join</h2>
        <ul class="thumbnails">
  			<li class="span4">
    			<a href="#" class="thumbnail">
      			<img class="pic" data-src="" alt="">
    			</a>
  			</li>
		</ul>
		<script>
		$('.pic').click{
			alert("img add");
		}
		
		</script>
		
        id : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input-block-level" placeholder="id"><a class="btn btn-small btn-primary" id="_idchk">id cheack</a><br>
        password : <input type="password" class="input-block-level" placeholder="Password">
        email : &nbsp;&nbsp;&nbsp;&nbsp;<input type="email" class="input-block-level" placeholder="email">
        nicname : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input-block-level" placeholder="nicname">
        <!-- pic : &nbsp;&nbsp;&nbsp;&nbsp;<input type="text" class="input-block-level"> -->
        
        <div class="input-group input-file col-md-7" name="input-pic">
			<span class="input-group-btn">
				<button class="btn btn-default btn-choose" type="button" style="margin-left: 15px;">이미지선택</button>
			</span> 
				<input type="text" class="form-control" placeholder='Choose a file...' style="width: 100%;" /> 
			<span class="input-group-btn">
				<button class="btn btn-warning btn-reset" type="button" >Reset</button>
			</span>
		</div>
        
        <a class="btn btn-large btn-primary" id="_btnRegi">Join</a>
        <a class="btn btn-large btn-primary" href="login.do">back</a>
      </form>

    </div> <!-- /container -->

<script type="text/javascript">
$("#_btnRegi").click(function() {
	alert("id:" + $("#_userid").val());
	if($("#_userid").val() == ""){		
		alert($("#_userid").attr("data-msg") + " 입력해 주십시오" );
		$("#_userid").focus();
	}else if($("#_pwd").val() == ""){		
		alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#_pwd").focus();
	}else if($("#_name").val() == ""){		
		alert($("#_name").attr("data-msg") + " 입력해 주십시오" );
		$("#_name").focus();
	}else if($("#_email").val() == ""){		
		alert($("#_email").attr("data-msg") + " 입력해 주십시오" );
		$("#_email").focus();
	}else{
		$("#_frmForm").attr({"target":"_self", action:"regiAf.do"}).submit();
	}
});

<!-- 
$("#_btnLogin").click(function(){
	alert("login Click!");
	location.href="login.do";
});

$("#_btnGetId").click(function (){
	var _id = $("#_id").val();
	if(_id == ""){
		alert("아이디를 입력해 주십시오");
	}else{
		idCheckFunc(_id);
	}
});

function idCheckFunc(id) {
	//alert("idCheckFunc");
	
	$.ajax({
		type: "post",
		url: "getID.do",
		async:true,
		data:"id=" + id,
		success:function(msg){
			idCheckMessage(msg);
		}
	});
}

function idCheckMessage(msg) {
	if(msg.message == 'SUCS'){
		$("#_rgetid").html("사용할 수 없는 아이디입니다.");
		$("#_rgetid").css("background-color","#ff0000");
		$("#_userid").val("");
	}else{
		$("#_rgetid").html("사용할 수 있는 아이디입니다.");
		$("#_rgetid").css("background-color","#0000ff");
		$("#_userid").val($("#_id").val());
	}
}
-->
</script>

</body>
</html>