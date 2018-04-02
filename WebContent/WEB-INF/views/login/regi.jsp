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
</head>
<body>
<div class="row-fluid">
    <h2 class="form-signin-heading">Sign Up</h2><br>
	<form class="form-signin" style="margin-bottom:5px;">
            <table class="table">
              <tbody>
                <tr>
                  	<td style="vertical-align: middle;">아이디 :</td>
                  	<td><input type="text" placeholder="id" id="user_id" style="margin:auto; height:30px;"></td>
					<td>
					<!-- Button to trigger modal -->
					<a href="#idchk_modal" role="button" class="btn" data-toggle="modal" id="_idchk" style="margin:auto;">ID 중복체크</a></td>
					<!-- <button class="btn btn-mini btn-primary" id="_idchk" style="margin:auto;">ID 중복체크</button></td> -->
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">비밀번호 :</td>
                  	<td colspan="2"><input type="text" placeholder="id" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">비밀번호 확인 :</td>
                  	<td colspan="2"><input type="text" placeholder="id" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">닉네임 :</td>
                  	<td><input type="text" placeholder="email" style="margin:auto; height:30px;"></td>
					<td></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">e-mail :</td>
                  	<td><input type="email" placeholder="id" style="margin:auto; height:30px;"></td>
					<td></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">프로필 이미지 :</td>
                  	<td>
                  		<img id="pic" data-src="holder.js/260x120" src="" alt="클릭하여 이미지를 넣어주세요." alt="260x120" style="width: 200px; height: 150px;">
                  		<a href="#">
             				<input class="btn btn-mini btn-primary" type="file" onchange="previewFile()">
              			</a>                  		
                  	</td>
					<td></td>
                </tr>
                <tr>
                	<td colspan="3" style="text-align:right;">
                		<a href="./index.jsp" role="button" class="btn" data-toggle="modal" style="margin:auto;">back</a>
                		<a href="#" role="button" class="btn" data-toggle="modal" style="margin:auto;">Sign Up</a>
                	</td>
                </tr>
                
              </tbody>
            </table>
 	</form>
</div> <!-- /container -->

<!-- Modal -->
<div id="idchk_modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="ModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel" style="color: black">ID 중복체크</h3>
  </div>
  <div class="modal-body">
  	<p>아이디 : </p>
  	<input type="text" placeholder="id" id="user_id" style="margin:auto; height:30px;">
    <p id="idChkResult">y…</p>
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
/*  		
	//insert img text set
$('input[type=file]').change(function() {
   	$('input[id=imgText]').val($(this).val());
});
 */
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

/* 
 $(document).ready(function(){
	$('i').remove();
	$('span').remove();
	$('div .file-drop-zone-title').text("프로필 이미지를 드래그 해주십시오.");
}); 
 */
/*
$("#input-image-3").fileinput({
    uploadUrl: "./image",
    allowedFileExtensions: ["jpg", "png", "gif"],
    maxImageWidth: 50,
    maxImageHeight: 50,
    resizePreference: 'height',
    maxFileCount: 1,
    resizeImage: true,
    showUpload : false,
    showBrowse : true,
    showRemove: false,
    showCancel: false,
    showCaption : false,
    browseOnZoneClick: true
	
}).on('filepreupload', function() {
    $('#kv-success-box').html('');
}).on('fileuploaded', function(event, data) {
    $('#kv-success-box').append(data.response.link);
    $('#kv-success-modal').modal('show');
});
*/



<!-- 
$("#_btnLogin").click(function(){
	alert("login Click!");
	location.href="login.do";
});
-->

$("#_idchk").click(function (){
	var _id = $("#idChkResult").val();
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
		$("#_rgetid").html("사용할 수 없는 아이디입니다.");
		$("#_rgetid").css("background-color","#ff0000");
		$("#_userid").val("");
	}else{
		$("#_rgetid").html("사용할 수 있는 아이디입니다.");
		$("#_rgetid").css("background-color","#0000ff");
		$("#_userid").val($("#_id").val());
	}
}
//-->
</script>

</body>
</html>