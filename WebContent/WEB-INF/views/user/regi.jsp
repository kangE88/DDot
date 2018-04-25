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
</style>
<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="<%=request.getContextPath()%>/jquery/common.js"></script>
</head>
<body>

<form class="form-signin" method="post" enctype="multipart/form-data" style="height:100%;">
    <h2 class="form-signin-heading">Sign Up</h2><br>
    		<p class="table span3"></p>
            <table class="table span6" style=" text-align:center; margin-bottom:5%;margin-left: 0;">
              <tbody class="span12">
                <tr>
                  	<td style="vertical-align: middle;" class="span4">ID :</td>
                  	<td class="span4"><input type="text" id="_id" name="id" data-msg="ID" style="ime-mode: disabled; margin:auto; height:30px;"></td>
					<td style="text-align:center;" class="span4">
					<!-- Button to trigger modal -->
					<a href="#idchk_modal" role="button" class="btn span10" data-toggle="modal" id="_idchk" style="margin:auto;">Check</a></td>
					<!-- <button class="btn btn-mini btn-primary" id="_idchk" style="margin:auto;">ID 중복체크</button></td> -->
                </tr>
                <tr>
                  	<td style="vertical-align: middle;" class="span4">Password :</td>
                  	<td colspan="2" class="span8"><input type="password"  id="pwd" name="pwd" data-msg="Password" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;" class="span4">Password Confirm :</td>
                  	<td colspan="2" class="span8"><input type="password" id="pwdRe" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;" class="span4">Nickname :</td>
                  	<td class="span4"><input type="text" placeholder="nickname" id="_nickname" name="nickname" data-msg="Nickname" style="margin:auto; height:30px;"></td>
					<!-- Button to trigger modal -->
					<td style="text-align:center;" class="span4">
					<a href="#nicname_chk_modal" role="button" class="btn span10" data-toggle="modal" id="_nicchk" style="margin:auto;">Check</a></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;" class="span4">e-mail :
	                  	<span href="#none" data-toggle="tooltip" data-placement="top" title="" data-original-title="Email 주소를 정확히 기입해야 합니다.(ID 찾을 때 필요)">
						<img alt="command-tutorial" src="./image/help.png">
						</span>
                  	</td>
                  	<td class="span4"><input type="email" placeholder="email" id="_email" name="email" data-msg="e-mail" style="margin:auto; height:30px;"></td>
                  	<!-- Button to trigger modal -->
					<td style="text-align:center;" class="span4">
					<a href="#email_chk_modal" role="button" class="btn span10" data-toggle="modal" id="_emailchk" style="margin:auto;">Check</a></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;" class="span4">Profile Picture :</td>
                  	<td class="span4">
             			<input name="picFile" id="pic" type="file">
                  		<img id="thumPic" onclick="document.all.pic.click();" src="./image/addImg.png" data-src="holder.js/260x120" alt="클릭하여 이미지를 넣어주세요." style="width: 200px; height: 150px;">
                  	</td>
					<td class="span4">
					</td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;" class="span4">Intro :</td>
					<td colspan="2" class="span8"><textarea rows="3" class="span12" data-msg="Intro" name="intro"></textarea></td>
                </tr>
                <tr>
                	<td colspan="3" style="text-align:right;">
                		<a href="./index.jsp" role="button" class="btn" style="margin:auto;">Back</a>
                		<a href="#" role="button" class="btn" id="_btnRegi" style="margin:auto;">Sign Up</a>
                	</td>
                </tr>
              </tbody>
            </table>
            <p class="table span3"></p>
 	</form><!-- /container -->

<!-- Modal -->
<div id="idchk_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    	<h3 id="myModalLabel" style="color: black">ID Check</h3>
  	</div>
	<div class="modal-body">
		<p id="idChkResult"></p>
  	</div>
  	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  	</div>
</div>

<!-- Modal -->
<div id="nicname_chk_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    	<h3 id="nicModalLabel" style="color: black">Nicname Check</h3>
  	</div>
	<div class="modal-body">
		<p id="nicknameChkResult"></p>
  	</div>
  	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  	</div>
</div>

<!-- Modal -->
<div id="email_chk_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  	<div class="modal-header">
    	<button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    	<h3 id="emailModalLabel" style="color: black">Email Check</h3>
  	</div>
	<div class="modal-body">
		<p id="emailChkResult"></p>
  	</div>
  	<div class="modal-footer">
    	<button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
  	</div>
</div>

<!-- img thumnail event -->
<script>
var idck = false;
var nickck = false;
var emailck = false;

$(function() {
    $("#pic").on('change', function(){
       readURL(this);
   });    
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#thumPic').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}

//id 한글입력 방지
	$("#_id").keyup(function(e) { 
		idck =false;
	if (!(e.keyCode >=37 && e.keyCode<=40)) {
		var v = $(this).val();
		$(this).val(v.replace(/[^a-z0-9]/gi,''));
	}
	if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
		$(this).val() == "";
	}
});

//nickname 중복체크 후 변경 방지
$("#_nickname").keyup(function(e) { 
	nickck =false;
});

$("#_idchk").click(function (){
	var _id = $("#_id").val().trim();

	if(_id == ""){
		$('#idChkResult').text("Enter Your ID");
	}else{
		idCheckFunc(_id);
	}
});


function idCheckFunc(id) {
	
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
		$("#idChkResult").html("The ID is available for use.");
		$("#idChkResult").css("background-color","#ff0000");
		$("#id").val("");
		idck = false;
	}else{
		$("#idChkResult").html("This ID can not be used.");
		$("#idChkResult").css("background-color","#0000ff");
		$("#id").val($("#id").val());
		idck = true;
	}
}

$("#_nicchk").click(function (){
	var _nic = $("#_nickname").val().trim();

	if(_nic == ""){
		$('#nicknameChkResult').text("Enter Your Nickname!");
	}else{
		nickCheckFunc(_nic);
	}
});

function nickCheckFunc(nickname) {
	//alert("idCheckFunc");
	
	$.ajax({
		type: "post",
		url: "getNickname.do",
		async:true,
		data:"nickname=" + nickname,
		success:function(msg){
			nicknameCheckMessage(msg);
		}
	});
}

function nicknameCheckMessage(msg) {
	if(msg.message == 'SUCS'){
		$("#nicknameChkResult").html("The Nickname is available for use.");
		$("#nicknameChkResult").css("background-color","#ff0000");
		$("#nickname").val("");
		nickck = false;
	}else{
		$("#nicknameChkResult").html("This Nickname can not be used.");
		$("#nicknameChkResult").css("background-color","#0000ff");
		$("#nickname").val($("#nickname").val());
		nickck = true;
	}
}

$("#_emailchk").click(function (){
	var _email = $("#_email").val().trim();

	if(_email == ""){
		$('#emailChkResult').text("Enter Your email!");
	}else{
		emailCheckFunc(_email);
	}
});

function emailCheckFunc(email) {
	
	$.ajax({
		type: "post",
		url: "getEmail.do",
		async:true,
		data:"email=" + email,
		success:function(msg){
			emailCheckMessage(msg);
		}
	});
}

function emailCheckMessage(msg) {
	if(msg.message == 'SUCS'){
		$("#emailChkResult").html("The email is available for use.");
		$("#emailChkResult").css("background-color","#ff0000");
		$("#email").val("");
		emailck = false;
	}else{
		$("#emailChkResult").html("This email can not be used.");
		$("#emailChkResult").css("background-color","#0000ff");
		$("#email").val($("#email").val());
		emailck = true;
	}
}

//pwd 체크
/* $("#pwd").keyup(function(e) { 
	if($('#pwd').val() == $('#pwdRe').val()){
		pwdReOK = true;
	}else{
		alert("Password Duplication Confirm");
	}
});
 */

$("#_btnRegi").click(function() {
	//alert("_id:" + $("#_id").val());
	if($("#_id").val() == ""){		
		alert($("#_id").attr("data-msg") + " 입력해 주십시오" );
		$("#_id").focus();
	}else if($("#pwd").val() == ""){		
		alert($("#pwd").attr("data-msg") + " 입력해 주십시오" );
		$("#pwd").focus();
	}else if($("#_name").val() == ""){		
		alert($("#_name").attr("data-msg") + " 입력해 주십시오" );
		$("#_name").focus();
	}else if($("#_email").val() == ""){		
		alert($("#_email").attr("data-msg") + " 입력해 주십시오" );
		$("#_email").focus();
	}else{
		if(idck==false){
			alert("ID Check Please");
		}else if(nickck == false){
			alert("Nickname Check Please");
		}else if(nickck == false){
			alert("Email Check Please");
		}else{
			//비밀번호 유효성 체크
			var pwd = $("#pwd").val();
			var pwdRe = $("#pwdRe").val();

			if( pwd != pwdRe ) {	//	비밀번호 와 비밀번호 확인이 다르다면 ... 
				alert("Password Confirm Please!");
	
				//이벤트 중지하기
				event.preventDefault();
			}else{
				$(".form-signin").attr({"target":"_self", action:"regiAf.do"}).submit();
			}
		}
		
	}
});
//-->
</script>

</body>
</html>