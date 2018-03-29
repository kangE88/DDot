
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sign in &middot; Twitter Bootstrap</title>
	<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
    
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
      <form id="_frmForm" class="form-signin" action="main.do" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" placeholder="Email address" id="_userid">
        <input type="password" class="input-block-level" placeholder="Password" id="_pwd">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <a class="btn btn-large btn-primary" id="_btnRegi">Sign up</a>
        <a class="btn btn-large btn-primary" id="_btnLogin">Sign in</a>
        <a id="kakao-login-btn"></a>
		<a href="http://developers.kakao.com/logout"></a>
      </form>
    </div> <!-- /container -->
    
<!-- kakao -->
	<script type='text/javascript'>
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('08f9fff5a73551ee70534d1210f73132');
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        //alert(JSON.stringify(authObj));
	        var refreshToken = Kakao.Auth.getRefreshToken();
	        
	        Kakao.Auth.setAccessToken(accessTokenFromServer);
	        
	        location.href="kakaoLogin.do";
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	  //]]>
	</script>

<!-- user -->
	<script type="text/javascript">
		$("#_btnLogin").click(function() {
			alert("id:" + $("#_userid").val());
			if($("#_userid").val() == ""){		
				alert($("#_userid").attr("data-msg") + " id not input" );
				$("#_userid").focus();
			} else if($("#_pwd").val() == ""){
				alert($("#_pwd").attr("data-msg") + " pwd  not input" );
				$("#_pwd").focus();
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
