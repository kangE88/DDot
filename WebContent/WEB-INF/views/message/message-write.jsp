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

<form name="frmForm" id="_frmForm" method="post" action="messagewriteAf.do">
<input type="hidden" id="_auth" name="auth" value="3">
<table align="center" class="table table-bordered" style="width:85%; margin: auto;" >
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

	
	<tr>
		<th>Nickname</th>
		<td style="text-align: left">
		<input type="text" name="nickname" size="60" value="${login.nickname}" readonly="readonly">
		<span>					
	 		<a href="#none" class="btn" style="margin:auto;"  id="_btnToAdmin" title="관리자에게">관리자에게 보내기
			</a>
		</span>
		</td>
	</tr>
	
	<tr>
		<th>To Nickname</th>
		<td style="text-align: left">
			<input type="text" name="sendto" id="_sendto" size="60" value="${replyname}">
			<span id="_spanCheckNick"></span>
		</td>
	</tr>
	
	<tr>
		<th>Content</th>
		<td style="text-align: left">
			<textarea rows="5" cols="50" name='content' id="_content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>					
	 			<a href="#" class="btn" style="margin:auto;" onclick="back()" title="뒤로가기">Back
				</a>
			</span>
			<span>					
	 			<a href="#none" class="btn" style="margin:auto;"  id="_btnWrite" title="글쓰기">Write
				</a>
			</span>
		</td>
	</tr>


</table>

</form>

<script type="text/javascript">
var check=false;
var admincheck=false;

$(document).ready(function () {
	checkNickname();
})

//$("#_btnCheckNick").click(function () {
$("#_sendto").keyup(function () {
	checkNickname();
});

$("#_btnToAdmin").click(function () {
	$("#_sendto").attr('readonly',true);
	$("#_spanCheckNick").html("관리자에게 쪽지를 보냅니다.");
	check=true;
	admincheck=true;
	$("#_auth").val("1");
	});


function checkNickname() {
	var checkNick = $("#_sendto").val();
	if (checkNick=="") {
		$("#_spanCheckNick").html("수신자 닉네임을 입력하세요");
	}else{
		$.ajax({      
	        type:"POST",  
	        url:"messageCheckNick.do",      
	        data:{"nickname":checkNick},      
	        success:function(count){   
	           if (count > 0) {
	        	   $("#_spanCheckNick").html("OK!");
	        	   check=true;
				}else {
					$("#_spanCheckNick").html("사용자를 찾을수 없습니다.");
					check=false;
				}
	        },
	        error:function(e){  
	            alert(e.responseText);  
	        }  
	    });  
	}
}
	
$("#_btnWrite").click(function() {	
	// alert('글작성');	
	var editor_val = CKEDITOR.instances._content.document.getBody().getChild(0).getText().trim();
	if (editor_val=="") {
		alert("내용 작성이 필요합니다!");
	
	}else if($("#_sendto").val().trim()==null){
		alert("수신자의 닉네임이 필요합니다!");
	}else{ 
		if (check) {
			$("#_frmForm").attr({ "target":"_self", "action":"messagewriteAf.do" }).submit();
		}
		else {
			alert("수신자 확인이 필요합니다!");
		}
	}
});




function back() {
	location.href="messagelist.do?category=0";
}
</script>
</body>
</html>