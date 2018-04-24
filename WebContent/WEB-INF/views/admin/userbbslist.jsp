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
	background-color: #000084;  
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
		  <li><a href="admin.do">User</a></li>
		  <li class="divider"></li>
		  <li class="active"><a href="#">Board</a></li>
		  <li class="divider"></li>
		  <li><a href="#">Chat</a></li>  
		</ul>
		<form id="userpaging" method="post" action="">
		<input type="hidden" name="pageNumber" id="_pageNumber"/>	
		<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
		<input type="hidden" name="nickname" value="${nickname }">
		<input type="hidden" name="sort" value="${sort }">
		</form>
	</div>
<!-- ==================== 어드민 죄측메뉴 끝 ====================  -->


<!-- ==================== 어드민 우측메뉴 시작 ====================  -->

<!-- ==================== 어드민 유저게시판 시작 ====================  -->
	<div class="span10">
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="10%"><col width="5%"><col width="5%"><col width="30%"><col width="10%"><col width="5%"><col width="10%"><col width="5%">
			<thead>
				<tr>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">Icon</th>
					<th style="text-align: center;">Nickname</th>
					<th style="text-align: center;">Category</th>
					<th style="text-align: center;">SubCategory</th>
					<th style="text-align: center;">Title</th>					
					<th style="text-align: center;">Date</th>
					<th style="text-align: center;">Count</th>
					<th style="text-align: center;"><a href="userbbslist.do?nickname=${nickname }&sort=Good">Good</a> / <a href="userbbslist.do?nickname=${nickname }&sort=Bad">Bad</a></th>		
					<th style="text-align: center;">Del</th>				
				</tr>
			</thead>
			<tbody>	
			<c:if test="${empty userbbslist}">
			<tr>
				<td colspan="7">작성된 글이 없습니다.</td>
			</tr>	
			</c:if>
			
			<c:forEach items="${userbbslist}" var="bbs" varStatus="vs">
			<tr>
				<td style="text-align: center;">${vs.count}</td>
				<td><img id="${bbs.seq }icon" src=""></td>
				<script type="text/javascript">
					$.ajax({
						url: "getusericon.do",
						type: "post",
						data: {sseq: "${bbs.seq}"},
						success: function(data) {
							var level = g_level(data);
							$("#${bbs.seq }icon").prop("src","./image/level/lv"+level+".gif");
						},
						error: function() {
							alert("18");
						}						
					});
				</script>
				<td style="text-align: center;"><a href="#" class="userInfo" title="${bbs.nickname}">${bbs.nickname}</a></td>
			<c:choose>
			    <c:when test="${bbs.category eq 0 }">
			       <td style="text-align: center;">Java</td> 
			    </c:when>
				<c:when test="${bbs.category eq 1 }">
			       <td style="text-align: center;">JSP</td> 
			    </c:when>
			    <c:when test="${bbs.category eq 2 }">
			       <td style="text-align: center;">Jquery</td> 
			    </c:when>
			    <c:when test="${bbs.category eq 3 }">
			       <td style="text-align: center;">Oracle/Sql</td> 
			    </c:when>
			    <c:when test="${bbs.category eq 4 }">
			       <td style="text-align: center;">Spring</td> 
			    </c:when>
			    <c:when test="${bbs.category eq 5 }">
			       <td style="text-align: center;">E.T.C</td> 
			    </c:when>
			</c:choose>	
				<!-- subcategory 값이 0~3에 따른 값 입력 -->
			<c:choose>
			    <c:when test="${bbs.subcategory eq 0 }">
			       <td style="text-align: center;">[Tip]</td> 
			    </c:when>
				<c:when test="${bbs.subcategory eq 1 }">
			       <td style="text-align: center;">[Error]</td> 
			    </c:when>
			    <c:when test="${bbs.subcategory eq 2 }">
			       <td style="text-align: center;">[Example]</td> 
			    </c:when>
			    <c:when test="${bbs.subcategory eq 3 }">
			       <td style="text-align: center;">[E.T.C]</td> 
			    </c:when>
			</c:choose>
					
				<!-- del==0 일 때 title 삭제 된 글로 표현 --> 
			<c:choose>
			<c:when test="${bbs.del eq '0'}">
				<td style="text-align: left">글쓴이에 의해 삭제 된 글 입니다</td>
			</c:when>
			<c:when test="${bbs.del eq '1'}">
				<td style="text-align: left">관리자에 의해 삭제 된 글 입니다</td>
			</c:when>
			<c:otherwise>
				<!-- 댓글 카운트 가져오는 부분 -->
					<script type="text/javascript">
					$(document).ready(function() {
						$.ajax({
							  type:"POST"
							  ,url:"replycountbbs.do"
							  ,data:{"seq" : "${bbs.seq}"}
							  ,success:function(data){
								  if(data.replycount !=0){
								  $('#${bbs.seq }replycount').text("("+data.replycount+")");
								  }
							  },
							  error: function(xhr, status, error) {
								  alert("18");
						      }  
						 });
					 });
					</script>
				<td style="text-align: center"><a href='bbsdetail.do?seq=${bbs.seq}'>${bbs.title}</a>&nbsp;&nbsp;<span id="${bbs.seq }replycount"></span></td>
			</c:otherwise>
			</c:choose>
			
				
				<!-- 날짜 형식 변경 -->
				<td style="text-align: center;"><c:out value="${fn:substring(bbs.wdate,2,10)}"/></td>
				<td style="text-align: center;">${bbs.readcount}</td>
				<td style="text-align: center;">${bbs.up} / ${bbs.down }</td>
				<td style="text-align: center;"><img id="${bbs.seq }trash" src="./image/trash.png"> </td>
				<script type="text/javascript">
					$("#${bbs.seq }trash").click(function() {
						$.ajax({
							url: "deleteuserbbs.do",
							type: "post",
							data: {sseq: '${bbs.seq }' },
							success: function() {								
								location.href="userbbslist.do?nickname=${bbs.nickname}";
							},
							error: function() {
								alert("18");
							}
						})
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
			$("#userpaging").attr("target","_self").attr("action","userbbslist.do").submit();
		}
		</script>
	</div>
<!-- ==================== 어드민 유저게시판 시작 ====================  -->
<!-- ==================== 어드민 우측메뉴 끝 ====================  -->
</div>

</body>
</html>