<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    

<fmt:requestEncoding value="utf-8"/>  

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sign in</title>

    <style type="text/css">
      body {
        padding-top: 40px;
        padding-bottom: 40px;
      }

      .form-signin {
        max-width: 300px;
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
    <div class="row-fluid">
      <form id="_frmForm" class="form-signin" action="loginAf.do" method="post">
        <h2 class="form-signin-heading">Login</h2>
        <input type="text" class="input-block-level" placeholder="ID" id="id" name="id">
        <input type="password" class="input-block-level" placeholder="Password" id="pwd" name="pwd">
        <label class="checkbox">
          <input type="checkbox" id="_chk_save_id"> Remember me
        </label>
        <a class="btn btn-large btn-primary" id="_btnRegi">Sign up</a>
        <a class="btn btn-large btn-primary" id="_btnLogin">Sign in</a>
        <br>
        <br>
        <br>
        <a id="forgot">Forgot ID & Password ?</a>
        
      </form>
    </div> <!-- /container -->

<!-- user -->
	<script type="text/javascript">
		//id 한글입력 방지
 		$("#id").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $(this).val();
				$(this).val(v.replace(/[^a-z0-9]/gi,''));
			}else if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
				return;
			}
		});
		
		//id pwd창으로 갈때 한글입력 제거
 		$("#id").keydown(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $(this).val();
				$(this).val(v.replace(/[^a-z0-9]/gi,''));
			}
		}); 
	
 		// id 쿠키 저장
 		var user_id = $.cookie("userid");
 		if(user_id != null){
 			$("#id").val(user_id);
 			$("#_chk_save_id").prop("checked", "checked");
 		}

 		$("#_chk_save_id").click(function() {		
 			if($('input:checkbox[id="_chk_save_id"]').is(":checked")){
 				if($("#id").val() == ""){
 					$(this).prop("checked", false);
 					alert("아이디를 입력해 주십시오");
 				}else{
 					$.cookie("userid", $("#id").val(), { expires: 7, path: '/' });
 				}		
 			}else{
 				$.removeCookie("userid", { path:'/' });
 			}
 		});
		
	
		$("#_btnLogin").click(function() {
			//alert("id:" + $("#id").val());
			if($("#id").val() == ""){
				alert($("#id").attr("data-msg") + " 아이디를 잘못 입력하셨습니다. " );
				$("#id").focus();
			} else if($("#pwd").val() == ""){
				alert($("#pwd").attr("data-msg") + " 비밀번호를 잘못 입력하셨습니다." );
				$("#pwd").focus();
			} else {
				$("#_frmForm").attr("target", "_self").submit();				
			}	
		});
		
		$("#_btnRegi").click(function() {
			window.location.href = "regi.do";
		});
	</script>
	
  </body>
</html>
