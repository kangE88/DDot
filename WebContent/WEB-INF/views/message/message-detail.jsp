<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
<input type="hidden" name="seq" value="${msg.seq}"/>
<input type="hidden" name="replyname" value="${msg.nickname}"/>
<table class="table table-bordered" style="width:85%; margin: auto;">
<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

	<tr>
		<th>Nickname</th>
		<td style="text-align: left">
		<input type="text" name="nickname" size="60" readonly="readonly" value="${msg.nickname }"/>
		</td>
	</tr>
	<tr>
		<th>Date</th>
		<td style="text-align: left">
		<input type="text" name="wdate" size="60" readonly="readonly" value="${fn:substring(msg.wdate,2,10)}"/>
		</td>
	</tr>
	<tr>
		<th>Content</th>
		<td style="text-align: left">
			<%-- <textarea rows="10" cols="50" name='content' id="_content" readonly="readonly">${bbs.content}</textarea> --%>
			<div>${msg.content}</div>
		</td>
	</tr>
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>
		<a href="#none" class="btn" style="margin:auto;" id="_btnBack" title="뒤로가기">Back</a>&nbsp;
		<c:if test="${category eq '0' }">
			<a href="#none" class="btn" style="margin:auto;" id="_btnDelete" title="글삭제하기">Delete</a>&nbsp;
			<a href="#none" class="btn" style="margin:auto;"  id="_btnReply" title="답장하기">Reply</a>
			</c:if>
		</span>
		</td>
	</tr>
</tbody>
</table>

</form>


<script type="text/javascript">

$("#_btnDelete").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"messagedelete.do?seq=${msg.seq}" }).submit();
});

$("#_btnBack").click(function() {	
	location.href="messagelist.do?category=0";
	
});


$("#_btnReply").click(function() {	
	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"messagewrite.do" }).submit();
});

</script>
</body>
</html>