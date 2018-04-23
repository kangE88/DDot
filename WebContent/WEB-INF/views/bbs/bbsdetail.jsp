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

<!-- detail 본문 내용 -->
<form name="frmForm" id="_frmForm" method="post">
<table class="table table-bordered" style="width:85%;">
<input type="hidden" name="seq"   value="${bbs.seq}"/>

<colgroup>
<col style="width:200px;" />
<col style="width:auto;" />
</colgroup>

<tr>
		<th style ="text-align: center; vertical-align: middle;">Nickname</th>
		<td style="text-align: left">
		<%-- <input type="text" name="nickname" size="60" readonly="readonly" value="${bbs.nickname }"/> --%>
		${bbs.nickname }
		</td>
	</tr>
	<tr>
		<th style ="text-align: center; vertical-align: middle;">Title</th>
			<td style="text-align: left">
				<%-- <input type="text" name="title" style="width: 500px" readonly="readonly" value="${bbs.title }"/> --%>
				${bbs.title }
			</td>
	</tr>
	<tr>
		<th style ="text-align: center; vertical-align: middle;">Category</th>
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
		<th style ="text-align: center; vertical-align: middle;">Subcategory</th>
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
		<th style ="text-align: center; vertical-align: middle;">Content</th>
		<td style="text-align: left;">
			<div>${bbs.content}</div>
		</td>
	</tr>
	<tr>
		<th style ="text-align: center; vertical-align: middle;">Good / Bad</th>
		<td style="padding-bottom: 10px">
			&nbsp;&nbsp;&nbsp;
			<span class="badge badge-success" id="up">${bbs.up }</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<span class="badge badge-important" id="down">${bbs.down }</span> <br>&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnGood" title="Good">Good</a>&nbsp;&nbsp;
			<a href="#none" class="btn" style="margin:auto;" id="_btnBad" title="Bad">Bad</a>
		</td>
	</tr>
	<c:if test="${bbs.nickname eq login.nickname}">
		<tr>
			<td colspan="2" style="height:50px; text-align:center;">
			<span>
				
				<a href="#none" class="btn" style="margin:auto;" id="_btnUpdate" title="글수정하기">modified</a>&nbsp;
				<a href="#none" class="btn" style="margin:auto;" id="_btnDelete" title="글삭제하기">delete</a>&nbsp;
				
				<!-- <a href="#none" class="btn" style="margin:auto;"  id="_btnReply" title="답글달기">reply</a> -->
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
	<table class="table table-bordered" style="width:85%;" >
	<col width="30%"><col width="70%">
			<tr >
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
			<td style="text-align: left;padding-bottom: 10px" >
			<c:out value="${fn:substring(reply.wdate,2,19)}"/>
						
				<!-- 로그인한 정보가 작성자의 정보와 같으면 삭제 버튼 표현 -->
				<c:if test="${reply.nickname eq login.nickname}">
				<input type="hidden" id="_seq" value="${reply.seq }">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="#none" class="btn" style="margin:auto;" id="_replyDelete" title="삭제">delete</a>
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
		<td style="text-align: center;">Login to register a comment.</td>
	</tr>
</table>
</c:when>

<c:otherwise>
<form name="replyForm" id="_replyForm" method="post">
	<table class="table table-bordered" style="width:85%;">
	<input type="hidden" name="seq"   value="${bbs.seq}">
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
			<td rowspan="2" style="text-align: center;vertical-align: middle;">
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
// category & subcategory 선택 사항 적용 
$("#_category > option[value="+'<c:out value="${bbs.category }"/>'+"]").attr("selected","selected");
$("#_subcategory > option[value="+'<c:out value="${bbs.subcategory }"/>'+"]").attr("selected","selected");

/* 글 수정 */
$("#_btnUpdate").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"bbsupdate.do" }).submit();
});

/* 글 삭제 */
$("#_btnDelete").click(function() {	
	$("#_frmForm").attr({ "target":"_self", "action":"bbsdelete.do" }).submit();
});

/* 좋아요 */
$("#_btnGood").click(function() {
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

/* 싫어요 */
$("#_btnBad").click(function() {
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

// 댓글 쓰기
$("#_btnWrite").click(function() {
	
	if($("#_content").val()==""){
		alert("댓글 내용을 입력해주세요!");
		$("#_content").focus();
		return false;
	}else{
	$.ajax({
		  type:"POST"
		  ,url:"bbsdetail.do"
		  ,data:{"seq" : "${bbs.seq}", "nickname" : "${login.nickname}", "content" : $("#_content").val().replace(/(?:\r\n|\r|\n)/g, '<br/>')}
		  ,success:function(data){
			  location.reload();
		  },
		  error: function(xhr, status, error) {
	            alert("댓글 내용을 입력해주세요!");
	            return false;
	      }  
	 });
	}
});

//댓글 삭제
$("#_replyDelete").click(function() {
	$.ajax({
		  type:"POST"
		  ,url:"bbsdeletereply.do"
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