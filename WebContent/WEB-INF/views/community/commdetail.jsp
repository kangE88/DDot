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


</head>

<body>

<form name="frmForm" id="_frmForm" method="post">

<table class="table table-bordered" style="width:85%;">

<input type="hidden" name="seq"   value="${comm.seq}"/>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tr>
		<th>Nickname</th>
		<td style="text-align: left">
		<input type="text" name="nickname" size="60" readonly="readonly" value="${comm.nickname }"/>
		</td>
	</tr>
	<tr>
		<th>Title</th>
			<td style="text-align: left">
				<input type="text" name="title" size="60" readonly="readonly" value="${comm.title }"/>
			</td>
	</tr>
	<tr>
		<th>Content</th>
		<td style="text-align: left">
			<div>${comm.content}</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<c:if test="${bbs.nickname eq login.nickname}">
			<a href="#none" class="btn" style="margin:auto;" id="_btnUpdate" title="글수정하기">modified</a>&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnDelete" title="글삭제하기">delete</a>&nbsp;
			</c:if>
			<a href="#none" class="btn" style="margin:auto;"  id="_btnReply" title="답글달기">reply</a>
		</span>
		</td>
	</tr>
</tbody>
</table>

</form>


<script type="text/javascript">

$("#_btnUpdate").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"commupdate.do" }).submit();
});

$("#_btnDelete").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"commdelete.do" }).submit();
});

/* 
$("#_btnReply").click(function() {	
	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"commreply.do" }).submit();
});
 */
</script>
</body>
</html>