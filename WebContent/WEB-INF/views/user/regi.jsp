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

<style type="text/css">

img .file-preview-image{
	height:120px;
}

input[type=file] {
    opacity: 0;
    z-index: -1;
    position: absolute;
}
button {
	margin-top:15px;
}


</style>
<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/common.js"></script>
</head>
<body>

<form class="form-signin" enctype="multipart/form-data" style="height:100%;">
    <h2 class="form-signin-heading">Sign Up</h2><br>
    		<table class="table span3"></table>
            <table class="table span6" style=" text-align:center; margin-bottom:5%;margin-left: 0;">
              <tbody>
              <colgroup>
				  <col width="25%">
				  <col width="40%">
				  <col width="35%">
			  </colgroup>
                <tr>
                  	<td style="vertical-align: middle;">아이디 :</td>
                  	<td><input type="text" placeholder="id" id="_id" name="id" style="ime-mode: disabled; margin:auto; height:30px;"></td>
					<td style="text-align:center;">
					<!-- Button to trigger modal -->
					<a href="#idchk_modal" role="button" class="btn span10" data-toggle="modal" id="_idchk" onclick="" style="margin:auto;">ID 중복체크</a></td>
					<!-- <button class="btn btn-mini btn-primary" id="_idchk" style="margin:auto;">ID 중복체크</button></td> -->
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">비밀번호 :</td>
                  	<td colspan="2"><input type="password" placeholder="pwd" name="pwd" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">비밀번호 확인 :</td>
                  	<td colspan="2"><input type="password" placeholder="pwdRe" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">닉네임 :</td>
                  	<td><input type="text" placeholder="nickname" name="nickname" style="margin:auto; height:30px;"></td>
					<td></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">e-mail :</td>
                  	<td><input type="email" placeholder="email" name="email" style="margin:auto; height:30px;"></td>
					<td></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">프로필 이미지 :</td>
                  	<td>
                  		<img id="pic" data-src="holder.js/260x120" src="" alt="클릭하여 이미지를 넣어주세요." alt="260x120" style="width: 200px; height: 150px;">
                  		<a href="#">
             				<input class="btn btn-mini btn-primary" type="file" onchange="previewFile()">
             				<!-- <input type="hidden" name="pic"> -->
              			</a>                  		
                  	</td>
					<td>
						<input type="hidden" name="pic" class="span10">
						<a href="#" role="button" class="btn span10" id="_btnClean" style="margin:auto;">clear</a>
					</td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">자기 소개 :</td>
					<td colspan="2"><textarea rows="3" class="span12" placeholder="intro" name="intro"></textarea></td>
                </tr>
                <tr>
                	<td colspan="3" style="text-align:right;">
                		<a href="./index.jsp" role="button" class="btn" style="margin:auto;">back</a>
                		<a href="#" role="button" class="btn" id="_btnRegi" style="margin:auto;">Sign Up</a>
                	</td>
                </tr>
              </tbody>
            </table>
            <table class="table span3"></table>
 	</form><!-- /container -->

<!-- Modal -->
<div id="idchk_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    	<h3 id="myModalLabel" style="color: black">ID 중복체크</h3>
  	</div>
	<div class="modal-body">
		<p id="idChkResult"></p>
  	</div>
  	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  	</div>
</div>

<!-- img thumnail event -->
<script>



$('#pic').click(function(){
	alert("click");
	$('input[type=file]').trigger('click');
});
  		
	//insert img text set
$('input[type=file]').change(function() {
   	$('input[name=pic]').val($(this).val());
});

function previewFile() {
	  var preview = document.querySelector('#pic');
	  var file    = document.querySelector('input[type=file]').files[0];
	  var reader  = new FileReader();

	  reader.onload = function () {
	    preview.src = reader.result;
	  }

	  if (file) {
	    reader.readAsDataURL(file);
	  } else {
	    preview.src = "";
	  }
	}


</script>

<script type="text/javascript">

//id 한글입력 방지
	$("#_id").keyup(function(e) { 
	if (!(e.keyCode >=37 && e.keyCode<=40)) {
		var v = $(this).val();
		$(this).val(v.replace(/[^a-z0-9]/gi,''));
	}
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
		$(this).val() == "";
	}
});

//id pwd창으로 갈때 한글입력 제거
	$("#_id").keydown(function(e) { 
	if (!(e.keyCode >=37 && e.keyCode<=40)) {
		var v = $(this).val();
		$(this).val(v.replace(/[^a-z0-9]/gi,''));
	}
});

$("#_btnRegi").click(function() {
	alert("_id:" + $("#_id").val());
	if($("#_id").val() == ""){		
		alert($("#_id").attr("data-msg") + " 입력해 주십시오" );
		$("#_id").focus();
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
		alert("signup");
		$(".form-signin").attr({"target":"_self", action:"regiAf.do"}).submit();
	}
});

$("#_idchk").click(function (){
	var _id = $("#_id").val().trim();

	if(_id == ""){
		$('#idChkResult').text("아이디를 입력해 주십시오.");
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
		$("#idChkResult").html("사용할 수 없는 아이디입니다.");
		$("#idChkResult").css("background-color","#ff0000");
		$("#id").val("");
	}else{
		$("#idChkResult").html("사용할 수 있는 아이디입니다.");
		$("#idChkResult").css("background-color","#0000ff");
		$("#id").val($("#id").val());
	}
}
//-->
</script>

</body>
</html>