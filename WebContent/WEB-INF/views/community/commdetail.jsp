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
		<th>Good / Bad</th>
		<td style="padding-bottom: 10px">
			&nbsp;&nbsp;&nbsp;
			<span class="badge badge-success" id="up">${comm.up }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="badge badge-important" id="down">${comm.down }</span> <br>&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnGood" title="Good">Good</a>&nbsp;&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnBad" title="Bad">Bad</a>
		</td>
	</tr>
	<c:if test="${comm.nickname eq login.nickname}">
	<tr>
		<td colspan="2" style="height:50px; text-align:center;">
		<span>
			<a href="#none" class="btn" style="margin:auto;" id="_btnUpdate" title="글수정하기">modified</a>&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnDelete" title="글삭제하기">delete</a>&nbsp;
		</span>
		</td>
	</tr>
	</c:if>
</tbody>
</table>

</form>

<p>
<!-- 댓글 카운트 Start -->

&nbsp;&nbsp; Total reply count  : ${replycount }

<!-- 댓글 카운트 End -->
<p>

<!-- 댓글 리스트 Start -->

<c:forEach items="${replylist }" var="reply">
	<table class="table table-bordered" style="width:85%;">
	<col width="30%"><col width="70%">
			<tr>
			<td style="text-align: left">
			<!-- 아이콘 이미지를 가져오는 부분 -->
					<script type="text/javascript">
					$(document).ready(function() {
						$.ajax({
							  type:"POST"
							  ,url:"getMemberPoint.do"
							  ,data:{"nickname" : "${reply.nickname}"}
							  ,success:function(data){
								  var level = g_level(data.point);
								  $('#${reply.seq}icon').attr("src","./image/level/lv"+level+".gif");
							  },
							  error: function(xhr, status, error) {
								  alert("18");
						      }  
						 });
					 });
					</script>
				<img id="${reply.seq }icon" src="">
			${reply.nickname }
			</td>
			<td style="text-align: left;padding-bottom: 10px">
				<c:out value="${fn:substring(reply.wdate,2,19)}"/>
				
				<!-- 로그인한 정보가 작성자의 정보와 같으면 삭제 버튼 표현 -->
				<c:if test="${reply.nickname eq login.nickname}">
				<input type="hidden" id="_seq" value="${reply.seq }">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#none" class="btn" style="margin:auto;" id="_replyDelete" title="삭제">삭제</a>
				</c:if>
				
			</td>
		</tr>
		<tr>
			<td colspan="2">
				${reply.content }
			</td>
		</tr>
	</table>
</c:forEach>

<!-- 댓글 리스트 End -->

<p>

<!-- 댓글 쓰기 Start -->

<c:choose>
<c:when test="${login.nickname eq null}">
<table class="table table-bordered" style="width:85%;">
	<tr>
		<td style="text-align: center;">로그인을 하시면 댓글을 등록할 수 있습니다.</td>
	</tr>
</table>
</c:when>

<c:otherwise>
<form name="replyForm" id="_replyForm" method="post">
	<table class="table table-bordered" style="width:85%;">
	<input type="hidden" name="seq"   value="${comm.seq}"/>
		<tr>
			<td style="text-align: left">
			<!-- 아이콘 이미지를 가져오는 부분 -->
				<script type="text/javascript">
				$(document).ready(function() {
					$.ajax({
						  type:"POST"
						  ,url:"getMemberPoint.do"
						  ,data:{"nickname" : "${login.nickname}"}
						  ,success:function(data){
							  var level = g_level(data.point);
							  $('#${login.nickname}icon').attr("src","./image/level/lv"+level+".gif");
						  },
						  error: function(xhr, status, error) {
							  alert("18");
					      }  
					 });
				 });
				</script>
				
				<img id="${login.nickname}icon" src="">
			${login.nickname}
			</td>
			<td rowspan="2">
			<a href="#none" class="btn" style="margin:auto;" id="_btnWrite" title="등록">add comment</a>
			</td>
		</tr>
		<tr>
			<td>
				<textarea rows="5" cols="50" style="width:100%" id="_content" name="content"></textarea>
			</td>
		</tr>
	</table>
</form>
</c:otherwise>
</c:choose>

<!-- 댓글 쓰기 End -->


<script type="text/javascript">

$("#_btnUpdate").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"commupdate.do" }).submit();
});

$("#_btnDelete").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"commdelete.do" }).submit();
});


$("#_btnGood").click(function() {
	// $("#_frmForm").attr({ "target":"_self", "action":"updownbbsgood.do" }).submit();
	
	$.ajax({
				  type:"POST"
				  ,url:"updowncommgood.do"
				  ,data:{"seq" : "${comm.seq}"}
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
		  ,url:"updowncommbad.do"
		  ,data:{"seq" : "${comm.seq}"}
		  ,success:function(data){
			   $("#up").html(data.up);
			   $("#down").html(data.down);
		  },
		  error: function(xhr, status, error) {
			  alert("로그인 후 클릭 부탁 드립니다");
	      }  
	 });
});

//댓글 쓰기
$("#_btnWrite").click(function() {
	
	if($("#_content").val()==""){
		alert("댓글 내용을 입력해주세요!");
		$("#_content").focus();
		return false;
	}else{
	$.ajax({
		  type:"POST"
		  ,url:"commdetail.do"
		  ,data:{"seq" : "${comm.seq}", "nickname" : "${login.nickname}", "content" : $("#_content").val()}
		  ,success:function(data){
			  location.reload();
		  },
		  error: function(xhr, status, error) {
	            
	      }  
	 });
	}
});

//댓글 삭제
$("#_replyDelete").click(function() {
	$.ajax({
		  type:"POST"
		  ,url:"commdeletereply.do"
		  ,data:{"seq" : $("#_seq").val()}
		  ,success:function(data){
			  location.reload();
		  },
		  error: function(xhr, status, error) {
	            alert("삭제 실패닭!!");
	      }  
	 });
});

</script>
</body>
</html>