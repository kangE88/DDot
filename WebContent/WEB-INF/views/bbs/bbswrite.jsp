<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!DOCTYPE html>
<html>
<head>
<link href="./css/bootstrap-responsive.css" rel="stylesheet">
<script src="./ckeditor/ckeditor.js"></script>
 <script>
 window.onload=function(){
	CKEDITOR.replace('_content'); 
	};
 </script>
</head>

<body>

<form name="frmForm" id="_frmForm" method="post" action="bbswriteAf.do">

<table class="table table-bordered" style="width:85%;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

	
	<tr>
		<th>nickname</th>
		<td style="text-align: left">
		<input type="text" name="nickname" size="60" value="${login.nickname}">
		</td>
	</tr>
	<tr>
		<th>title</th>
			<td style="text-align: left">
				<input type="text" name="title" size="60"/>
			</td>
	</tr>
	<tr>
		<th>category</th>
			<td style="text-align: left">
				<select id="category" name="category">
				<option value="0">Java</option>
				<option value="1">JSP</option>
				<option value="2">JQuery</option>
				<option value="3">Oracle/SQL</option>
				<option value="4">Spring</option>
				<option value="5">E.T.C</option>
				</select>
			</td>
	</tr>
	<tr>
		<th>subcategory</th>
			<td style="text-align: left">
				<select id="subcategory" name="subcategory">
				<option value="0">tip</option>
				<option value="1">error</option>
				<option value="2">ex</option>
				<option value="3">etc</option>
				</select>
			</td>
	</tr>
	<tr>
		<th>내용</th>
		<td style="text-align: left">
			<textarea rows="10" cols="50" name='content' id="_content"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
			<span>					
	 			<a href="#none" id="_btnLogin" title="글쓰기">글쓰기
				</a>
			</span>
		</td>
	</tr>


</table>

</form>

<script type="text/javascript">
$("#_btnLogin").click(function() {	
	// alert('글작성');	
	$("#_frmForm").attr({ "target":"_self", "action":"bbswriteAf.do" }).submit();	
});
</script>
</body>
</html>