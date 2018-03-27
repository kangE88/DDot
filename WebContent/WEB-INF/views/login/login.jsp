
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Sign in &middot; Twitter Bootstrap</title>
<!--     <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content=""> -->

    <!-- Le styles -->
    <link href="./css/bootstrap.css" rel="stylesheet">
    <!-- css & js 파일 추가하는 부분 Start -->
	<link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.css">
	<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css">
	<link rel="stylesheet" type="text/css" href="./css/prettify.css">
	
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script type="text/javascript" src="./js/bootstrap.js"></script>
	
	<script type="text/javascript">
		_386 = {fastLoad: true};
	</script>

<!-- css & js 파일 추가하는 부분 End -->
    
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

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <input type="text" class="input-block-level" placeholder="Email address">
        <input type="password" class="input-block-level" placeholder="Password">
        <label class="checkbox">
          <input type="checkbox" value="remember-me"> Remember me
        </label>
        <button class="btn btn-large btn-primary" id="_btnRegi">Sign up</button>
        
        <a href="regi.do"></a>
        <button class="btn btn-large btn-primary" id="_btnLogin" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->

	<script type="text/javascript">
		$("#_btnLogin").click(function() {
			alert("id:" + $("#_userid").val());
			if($("#_userid").val() == ""){		
				alert($("#_userid").attr("data-msg") + " 입력해 주십시오" );
				$("#_userid").focus();
			} else if($("#_pwd").val() == ""){
				alert($("#_pwd").attr("data-msg") + " 입력해 주십시오" );
				$("#_pwd").focus();
			} else{
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
