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

<input type="hidden" name="seq"   value="${bbs.seq}"/>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tr>
		<th>Nickname</th>
		<td style="text-align: left">
		<input type="text" name="nickname" size="60" readonly="readonly" value="${bbs.nickname }"/>
		</td>
	</tr>
	<tr>
		<th>Title</th>
			<td style="text-align: left">
				<input type="text" name="title" size="60" readonly="readonly" value="${bbs.title }"/>
			</td>
	</tr>
	<tr>
		<th>Category</th>
			<td style="text-align: left">
				<select name="category" id="_category" disabled="disabled">
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
		<th>Subcategory</th>
			<td style="text-align: left">
				<select name="subcategory" id="_subcategory" disabled="disabled">
				<option value="0">Tip</option>
				<option value="1">Error</option>
				<option value="2">Example</option>
				<option value="3">E.T.C</option>
				</select>
			</td>
	</tr>
	<tr>
		<th>Content</th>
		<td style="text-align: left;">
			<div>${bbs.content}</div>
		</td>
	</tr>
	<tr>
		<th>Good / Bad</th>
		<td>
			&nbsp;&nbsp;&nbsp;
			<span class="badge badge-success" id="up">${bbs.up }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="badge badge-important" id="down">${bbs.down }</span> <br>&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnGood" title="Good">Good</a>&nbsp;&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnBad" title="Bad">Bad</a>
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
// category & subcategory 선택 사항 적용 
$("#_category > option[value="+'<c:out value="${bbs.category }"/>'+"]").attr("selected","selected");
$("#_subcategory > option[value="+'<c:out value="${bbs.subcategory }"/>'+"]").attr("selected","selected");

$("#_btnUpdate").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"bbsupdate.do" }).submit();
});

$("#_btnDelete").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"bbsdelete.do" }).submit();
});

$("#_btnGood").click(function() {
	// $("#_frmForm").attr({ "target":"_self", "action":"updownbbsgood.do" }).submit();
	
	$.ajax({
				  type:"POST"
				  ,url:"updownbbsgood.do"
				  ,data:{"seq" : "${bbs.seq}"}
				  ,success:function(data){
					 $("#up").html(data.up);
					 $("#down").html(data.down);
				  },
				  error: function(xhr, status, error) {
					  alert("로그인 후 클릭 부탁 드립니다");
			      }  
			 });
 });

$("#_btnBad").click(function() {
	// $("#_frmForm").attr({ "target":"_self", "action":"updownbbsbad.do" }).submit();
	
	$.ajax({
		  type:"POST"
		  ,url:"updownbbsbad.do"
		  ,data:{"seq" : "${bbs.seq}"}
		  ,success:function(data){
				 $("#up").html(data.up);
				 $("#down").html(data.down);
		  },
		  error: function(xhr, status, error) {
	            alert("로그인 후 클릭 부탁 드립니다");
	      }  
	 });
});

/* 
$("#_btnReply").click(function() {	
	alert('답글달기');	
	$("#_frmForm").attr({ "target":"_self", "action":"bbsreply.do" }).submit();
});
 */
</script>
</body>
</html>