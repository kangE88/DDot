<%@page import="com.DDot.model.MemberDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script type="text/javascript" src="./jquery/common.js"></script>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>
<script type="text/javascript" src="./jquery/common.js"></script>
<style>
a:hover{
	background-color: white;  
}

a:active {
	background-color: #000084;
}
a:focus{
	background-color: #000084;
}

input[type="text"]{
	background-color: white;
	border: 1px solid #dddddd;
	color: #bbbbbb;
}
</style>

</head>

<body>
<div class="row-fluid">
<!-- ==================== 어드민 죄측메뉴 시작 ====================  -->
	<div class="span2" style="padding-left: 10px">
		<ul class="nav nav-list">
		  <li class="nav-header">Left Menu</li>
		  <li class="divider"></li>  
		  <li class="active"><a href="admin.do">User</a></li>
		  <li class="divider"></li>
		  <li><a href="#">Board</a></li>
		  <li class="divider"></li>
		  <li><a href="#">Chat</a></li>  
		</ul>
		<form id="userpaging" method="post" action="">
		<input type="hidden" name="pageNumber" id="_pageNumber"/>	
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
		</form>
	</div>
<!-- ==================== 어드민 죄측메뉴 끝 ====================  -->


<!-- ==================== 어드민 우측메뉴 시작 ====================  -->

<!-- ==================== 어드민 회원관리 시작 ====================  -->
	<div class="span10">
		<table class="table table-hover">  
			<col width="10%">	<!-- 아이디 -->
			<col width="5%">	<!-- 레벨아이콘 -->
			<col width="10%">	<!-- 닉네임 -->
			<col width="15%">	<!-- 이메일 -->
			<col width="15%">	<!-- 자기소개 -->
			<col width="10%">	<!-- 포인트 -->
			<col width="10%">	<!-- 구분 -->
			<col width="5%">	<!-- 보드글쓴갯수 -->
			<col width="5%">	<!-- 커뮤글쓴갯수 -->
			<col width="6%">	<!-- 접속중이냐?? -->
			<col width="8%">	<!-- 수정 버튼 -->
			<thead>
				<tr>
					<th style="text-align: center;">ID</th>
					<th style="text-align: center;">Lv</th>
					<th style="text-align: center;">NickName</th> 
					<th style="text-align: center;">Email</th>
					<th style="text-align: center;">Intro</th>
					<th style="text-align: center;">Point</th>
					<th style="text-align: center;">Auth</th>
					<th style="text-align: center;">Board</th>
					<th style="text-align: center;">Comm</th>
					<th style="text-align: center;">On</th>
					<th style="text-align: center;">Admin</th>   
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${userlist}" var="user" varStatus="vs">
				<tr>
					<td style="text-align: center;">${user.id }</td>					
					<td style="text-align: center;"><img id="${user.id }icon" src=""> </td>
					<script>
						var level = g_level(${user.point});
						$("#${user.id }icon").prop("src","./image/level/lv"+level+".gif");
					</script>
					<td style="text-align: center;">${user.nickname }</td>
					<td style="text-align: center;">${user.email }</td>
					<td style="text-align: center;">${user.intro }</td>
					<td style="text-align: center;">${user.point }</td>
					<td style="text-align: center;">${user.auth }</td>
					<td id="${user.id }write" style="text-align: center;"></td>
					<script>
						var nickname = '${user.nickname}';
						$.ajax({
							url: "userwritecount.do",
							type: "post",
							data: {nickname : nickname},
							success: function(data) {
								$("#${user.id}write").append('<a href="userbbslist.do?nickname=${user.nickname }" class="${user.id}bbs" style="color:#dddddd">'+data+'</a>');
							},
							error: function() {
								alert("18");
							}
						});					
						
					</script>
					<td id="${user.id }comm" style="text-align: center;"></td>
					<script type="text/javascript">
						var nickname = '${user.nickname}';
						$.ajax({
							url: "usercommcount.do",
							type: "post",
							data: {nickname : nickname},
							success: function(data) {
								$("#${user.id}comm").append('<a href="usercommlist.do?nickname=${user.nickname }" class="${user.id}comm" style="color:#dddddd">'+data+'</a>');
							},
							error: function() {
								alert("18");
							}
						})
					</script>
					<td style="text-align: center;">on</td>
					<td style="text-align: center;"><img id="${user.id }modify" src="./image/pen.png"></td>
					<script type="text/javascript">
						$("#${user.id}modify").click(function() {
							alert("${user.nickname} modify");
							$('#${user.id}Modal').modal('show');
						});
					</script>
					<div id="${user.id}Modal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
					  <div class="modal-header">
					    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
					    <h4 id="myModalLabel">${user.nickname }'s Point</h4>
					  </div>
					  <div class="modal-body">
					    <p>${user.point } =====> <input type="text" id="${user.id }pointtext"></p>
					  </div>
					  <div class="modal-footer">
					    <button class="btn" data-dismiss="modal" aria-hidden="true">Close</button>
					    <button id="${user.id }pointbtn" class="btn btn-primary">Save changes</button>
					  </div>
					</div>
					<script type="text/javascript">
						$("#${user.id }pointbtn").click(function() {
							
							$.ajax({
								url: "modifypoint.do",
								type: "post",
								data: {nickname : "${user.nickname}",
									   point: $("#${user.id }pointtext").val()
								},
								success: function(data) {
									alert("Good");
									location.href="admin.do";
								},
								error: function() {
									alert("18");
								}
							})
							$('#${user.id}Modal').modal('hide');
							
						});
					</script>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	
	<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber"/>
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
			<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
		</jsp:include>
	</div>
		
		<script type="text/javascript">
		function goPage(pageNumber) {			
			$("#_pageNumber").val(pageNumber);
			$("#userpaging").attr("target","_self").attr("action","admin.do").submit();
		}
		</script>
	</div>
<!-- ==================== 어드민 회원관리 시작 ====================  -->
<!-- ==================== 어드민 우측메뉴 끝 ====================  -->
</div>

</body>
</html>