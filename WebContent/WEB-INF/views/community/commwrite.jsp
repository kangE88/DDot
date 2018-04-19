<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>

   
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


<script src="./ckeditor/ckeditor.js"></script>
 <script>
 window.onload=function(){
	CKEDITOR.replace('_content'); 
	
	CKEDITOR.on('dialogDefinition', function (ev) {
		var dialogName = ev.data.name;
		var dialog = ev.data.definition.dialog;
		var dialogDefinition = ev.data.definition;

			if (dialogName == 'image') {
				dialog.on('show', function (obj) {
				this.selectPage('Upload'); //업로드텝으로 시작
			});

				// $('#cke_100_uiElement').hide();
			
				dialogDefinition.removeContents('Link'); // 링크탭 제거
		}
	});
	};

 </script>
</head>

<body>

<form name="frmForm" id="_frmForm" method="post" action="commwriteAf.do">

<table class="table table-bordered" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

	
	<tr>
		<th>Nickname</th>
		<td style="text-align: left">
		<input type="text" name="nickname" size="60" value="${login.nickname}" readonly="readonly">
		</td>
	</tr>
	<tr>
		<th>Title</th>
			<td style="text-align: left">
				<input type="text" name="title" id="_title" size="60"/>
			</td>
	</tr>
	<tr>
		<th>Content</th>
		<td style="text-align: left">
			<textarea rows="10" cols="50" name='content' id="_content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
			<span>					
	 			<a href="#none" class="btn" style="margin:auto;"  id="_btnWrite" title="글쓰기">Wrtie	</a>
			</span>
		</td>
	</tr>


</table>

</form>

<script type="text/javascript">
$("#_btnWrite").click(function() {	
	var editor_val = CKEDITOR.instances._content.document.getBody().getChild(0).getText().trim();
	if($("#_title").val().trim()==""){
	      alert("타이틀 기입이 필요합니다!");
	      $("#_title").focus();
		}else if (editor_val=="") {
		  alert("내용 작성이 필요합니다!");
	   }else{ 
	   $("#_frmForm").attr({ "target":"_self", "action":"commwriteAf.do" }).submit();
	   }
});	
</script>
</body>
</html>