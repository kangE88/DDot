<%@page import="com.DDot.model.MemberDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	</div>
<!-- ==================== 어드민 죄측메뉴 끝 ====================  -->


<!-- ==================== 어드민 우측메뉴 시작 ====================  -->

<!-- ==================== 어드민 유저게시판 시작 ====================  -->
	<form id="usercommlist" method="post" action="">
		<input type="hidden" name="pageNumber" id="_pageNumber"/>	
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
		<input type="hidden" name="nickname" value="${nickname }">
		</form>
	<div class="span10">
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="45%"><col width="10%"><col width="10%"><col width="5%"><col width="10%">
			<thead>
				<tr>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">Level</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Nickname</th>
					<th style="text-align: center;">Date</th>
					<th style="text-align: center;">Count</th>
					<th style="text-align: center;">Good / Bad</th>					
				</tr>
			</thead>
			<tbody>	
			<c:if test="${empty commlist}">
			<tr>
				<td colspan="7">작성된 글이 없습니다.</td>
			</tr>	
			</c:if>
			
			<c:forEach items="${usercommlist}" var="comm" varStatus="vs">
			<tr>
				<td style="text-align: center;">${vs.count}</td>
				<td><img id="${comm.seq }iconc" src=""></td>
				<script type="text/javascript">
					$.ajax({
						url: "getusericonc.do",
						type: "post",
						data: {sseq: "${comm.seq}"},
						success: function(data) {
							var level = g_level(data);
							$("#${comm.seq }iconc").prop("src","./image/level/lv"+level+".gif");
						},
						error: function() {
							alert("18");
						}
						
						
					});
				</script>
	
				<!-- del==0 일 때 title 삭제 된 글로 표현 --> 
			<c:choose>
			<c:when test="${comm.del eq '0'}">
				<td style="text-align: left">삭제 된 글 입니다</td>
			</c:when>
			<c:when test="${bbs.del eq '1'}">
				<td style="text-align: left">관리자에 의해 삭제 된 글 입니다</td>
			</c:when>
			<c:otherwise>
				<td style="text-align: left"><a href='commdetail.do?seq=${comm.seq}'>${comm.title}</a></td>
			</c:otherwise>
			</c:choose>
			
				<td style="text-align: center;">${comm.nickname}</td>
				<!-- 날짜 형식 변경 -->
				<td style="text-align: center;">	<c:out value="${fn:substring(comm.wdate,5,10)}"/></td>
				<td style="text-align: center;">${comm.readcount}</td>
				<td style="text-align: center;">${comm.up} / ${comm.down }</td>
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
			$("#usercommlist").attr("target","_self").attr("action","usercommlist.do").submit();
		}
		</script>
	
	</div>
<!-- ==================== 어드민 유저게시판 시작 ====================  -->
<!-- ==================== 어드민 우측메뉴 끝 ====================  -->
</div>

</body>
</html>