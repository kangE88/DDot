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
		alert("dialogDefinition 진입");
		//alert(${pageContext.request.contextPath}+"");
		//filebrowserUploadUrl: '${pageContext.request.contextPath}/file/ckeditorImageUpload.do'	
		var dialogName = ev.data.name;
		var dialog = ev.data.definition.dialog;
		var dialogDefinition = ev.data.definition;

 			if (dialogName == 'image') {
				alert("dialogDefinition image진입");
				filebrowserImageUploadUrl: 'c:/upload/${login.id}/';
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

<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">

<input type="hidden" name="category" value="${category }">

<!-- category 표현 부분 Start -->
<div style="font-size: 50px;font;text-align: center;">
				<c:choose>
			    <c:when test="${category eq 0 }">
			       Java
			    </c:when>
				<c:when test="${category eq 1 }">
			       JSP 
			    </c:when>
			    <c:when test="${category eq 2 }">
			       JQuery  
			    </c:when>
			    <c:when test="${category eq 3 }">
			       Oracle/SQL  
			    </c:when>
			    <c:when test="${category eq 4 }">
			       Spring  
			    </c:when>
			    <c:when test="${category eq 5 }">
			       E.T.C  
			    </c:when>
			</c:choose>
</div>
<!-- category 표현 부분  End-->

<table class="table table-bordered" style="width:85%;margin-top: 30px;margin-left: auto;margin-right: auto;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

	<tr>
		<th style ="text-align: center; vertical-align: middle;">Title</th>
			<td style="text-align: left">
				<input type="text" name="title" id="_title" style="width: 80%" onkeyup="checkLength(this,200)"/>
			</td>
	</tr>
	<tr>
		<th style ="text-align: center; vertical-align: middle;">Nickname</th>
		<td style="text-align: left">${login.nickname}
		<input type="hidden" name="nickname" size="60" value="${login.nickname}">
				
		</td>
	</tr>
	<tr>
		<th style ="text-align: center; vertical-align: middle;">Subcategory</th>
			<td style="text-align: left">
				<select id="_subcategory" name="subcategory">
				<option value="0">tip</option>
				<option value="1">error</option>
				<option value="2">ex</option>
				<option value="3">etc</option>
				</select>
			</td>
	</tr>
	<tr>
		<th style ="text-align: center; vertical-align: middle;">Content</th>
		<td style="text-align: left">
			<textarea rows="10" cols="50" name='content' id='_content'></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
			<span>					
	 			<a href="#none" class="btn" style="margin:auto;"  id="_btnWrite" title="글쓰기">Wrtie
				</a>
			</span>
		</td>
	</tr>


</table>

</form>

<script type="text/javascript">
//category & subcategory 선택 사항 적용 
// $("#_category > option[value="+'<c:out value="${category }"/>'+"]").attr("selected","selected");
$("#_subcategory > option[value="+'<c:out value="${subcategory }"/>'+"]").attr("selected","selected");

$("#_btnWrite").click(function() {	
	var editor_val = CKEDITOR.instances._content.document.getBody().getChild(0).getText().trim();
	if($("#_title").val().trim()==""){
	      alert("타이틀 기입이 필요합니다!");
		}else if (editor_val=="") {
		  alert("내용 작성이 필요합니다!"); 
	   }else{ 
	   $("#_frmForm").attr({ "target":"_self", "action":"bbswriteAf.do" }).submit();
	   }
});

// title 글자수 제한 관련
function checkLength(objname, maxlength) {
  var objstr = objname.value; // 입력된 문자열을 담을 변수 
  var objstrlen = objstr.length; // 전체길이
  
  // 변수초기화 
  var maxlen = maxlength; // 제한할 글자수 최대크기 
  var i = 0; // for문에 사용 
  var bytesize = 0; // 바이트크기 
  var strlen = 0; // 입력된 문자열의 크기
  var onechar = ""; // char단위로 추출시 필요한 변수 
  var objstr2 = ""; // 허용된 글자수까지만 포함한 최종문자열

  // 입력된 문자열의 총바이트수 구하기
  for (i = 0; i < objstrlen; i++) {
   // 한글자추출 
   onechar = objstr.charAt(i);

   if (escape(onechar).length > 4) {
    bytesize += 3; // 한글이면 3을 더한다. 
   } else {
    bytesize++; // 그밗의 경우는 1을 더한다.
   }

   if (bytesize <= maxlen) { // 전체 크기가 maxlen를 넘지않으면 
    strlen = i + 1; // 1씩 증가
   }
  }

  // 총바이트수가 허용된 문자열의 최대값을 초과하면 
  if (bytesize > maxlen) {
   // alert(((objname.name.match("title"))?"title":"content")+"에서 허용된 문자열의 최대값("+maxlen+")을 초과했습니다. \n초과된 내용은 자동으로 삭제 됩니다.");  // match를 이용해서 title & content 출력한다. 
   alert("허용된 문자열의 최대값을 초과했습니다. \n초과된 내용은 자동으로 삭제 됩니다.");  // match를 이용해서 title & content 출력한다.
   objstr2 = objstr.substr(0, strlen);
   objname.value = objstr2;
  }
  objname.focus();
 }

</script>
</body>
</html>