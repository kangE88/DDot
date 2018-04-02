
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sign in &middot; Twitter Bootstrap</title>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
	<script src="./js/jquery.session.js"></script>
    
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
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" placeholder="ID" id="id" name="id">
        <input type="password" class="input-block-level" placeholder="Password" id="pwd" name="pwd">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <a class="btn btn-large btn-primary" id="_btnRegi">Sign up</a>
        <a class="btn btn-large btn-primary" id="_btnLogin">Sign in</a>
        <a id="kakao_btn_changed"></a>
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
	
	
		$("#_btnLogin").click(function() {
			//alert("id:" + $("#id").val());
			if($("#id").val() == ""){		
				alert($("#id").attr("data-msg") + " id not input" );
				$("#id").focus();
			} else if($("#pwd").val() == ""){
				alert($("#pwd").attr("data-msg") + " pwd  not input" );
				$("#pwd").focus();
			} else{
				alert("else");
				$("#_frmForm").attr("target", "_self").submit();				
			}	
		});
		
		$("#_btnRegi").click(function() {
			alert("click");
			window.location.href = "regi.do";
		});
	</script>
	
  </body>
</html>
