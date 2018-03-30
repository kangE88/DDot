
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
        <a id="kakao_btn_changed"></a>
      </form>
    </div> <!-- /container -->
    
<!-- kakao -->
	<script type='text/javascript'>
	
 	// 로그인 및 로그아웃 버튼 생성 처리
	var cookiedata = document.cookie;
	 
	alert("cookieData==>"+cookiedata);
	
	if(cookiedata.indexOf('kakao_login=done') < 0){
		alert("create");
	    createLoginKakao();
	}else{
		alert("Logout");
	    createLogoutKakao();
	}
	
	/* 로그인 관련 쿠키 생성 및 삭제 */
	function setCookie( name , value , expired ){
	 
	 var date = new Date();
	 date.setHours(date.getHours() + expired);
	 var expried_set = "expries="+date.toGMTString();
	 document.cookie = name + "=" + value + "; path=/;" + expried_set + ";"
	}
	
	function getCookie(name){
		 
	    var nameofCookie = name + "=";
	    var x = 0;
	    while(x <= document.cookie.length){
	        var y = ( x + nameofCookie.length);
	        if(document.cookie.substring(x,y) == nameofCookie){
	            if((endofCookie = document.cookie.indexOf(";",y)) == -1)
	                endofCookie = document.cookie.length;
	            return unescape(document.cookie.substring(y,endofCookie));
	        }
	        x = document.cookie.indexOf(" ",x) + 1;
	        if( x == 0 )
	            break;
	        }
	        
	        return "";
	}
	
	  //<![CDATA[
	    // 사용할 앱의 JavaScript 키를 설정해 주세요.
	    Kakao.init('08f9fff5a73551ee70534d1210f73132');
	    
	    //clean
	    Kakao.Auth.cleanup();
	    
	    // 카카오 로그인 버튼을 생성합니다.
	    Kakao.Auth.createLoginButton({
	      container: '#kakao-login-btn',
	      success: function(authObj) {
	        alert(JSON.stringify(authObj));
	        
	        alert("accessToken==>"+Kakao.Auth.getAccessToken());
	        alert("session SET===>"+$.session.set("code", authObj));
	        
	        $.session.set("code", authObj);
	        
	        setCookie("kakao_login","done",1); // 쿠키생성 (로그인)
            alert("cookiedata==>"+cookiedata);
	        
            createLogoutKakao();
	        
/* 	        var accessToken = Kakao.Auth.getAccessToken();
	        
	        var refreshToken = Kakao.Auth.getRefreshToken();
	        
	        Kakao.Auth.setAccessToken(accessTokenFromServer); */
	        
	        location.href="kakaoLogin.do";
	      },
	      fail: function(err) {
	         alert(JSON.stringify(err));
	      }
	    });
	  //]]>
	  
	  
	 // 로그아웃 처리
	    function logoutWithKakao(){
	        Kakao.Auth.logout();
	        alert('Logout success!');
	        setCookie("kakao_login","",-1);  // 쿠키삭제 (로그아웃)
	        //deleteCookie( "kakao_login" ); 쿠키삭제 다른 방법
	        createLoginKakao();
	        
	        window.location.href="./index.jsp";
	    }
	     
	     
	     
	    // 로그인 버튼생성
	    function createLoginKakao(){
	     var login_btn = "<a id='kakao-login-btn'></a>";
	     document.getElementById('kakao_btn_changed').innerHTML  = login_btn;
	    }
	     
	     
	 // 로그아웃 버튼생성
	    function createLogoutKakao(){
	     var logout_btn = "<a id='kakao-logout-btn' href='javascript:logoutWithKakao()'>"+
	                    "<img src='./image/logo.png' width='200'/>"+
	                    "</a>";
	     document.getElementById('kakao_btn_changed').innerHTML  = logout_btn;
	     
	    }
	</script>

<!-- user -->
	<script type="text/javascript">
		//id 한글입력 방지
 		$("#_userid").keyup(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $(this).val();
				$(this).val(v.replace(/[^a-z0-9]/gi,''));
			}else if(event.keyCode == 8 || event.keyCode == 9 || event.keyCode == 37 || event.keyCode == 39 || event.keyCode == 46){
				return;
			}
		});
		
		//id pwd창으로 갈때 한글입력 제거
 		$("#_userid").keydown(function(e) { 
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $(this).val();
				$(this).val(v.replace(/[^a-z0-9]/gi,''));
			}
		}); 
	
	
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
