<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:requestEncoding value="utf-8"/>


<style>
	#searchicon:hover{
		background-color: #000084;
	}
</style>
<div class="row-fluid">

	<!-- ==================== 게시판 좌측메뉴 Start ==================== -->
	<div class="span2" id="boardmenudiv" style="padding-left: 10px">
		
		<!-- subcategory 선택 관련 사항 Start -->
		<div class="span12">  
			<ul class="nav nav-list" id="boardmenu">
				<li class="nav-header">MENU</li>
				<li class="divider"></li>
				<li>
					<a href="messagelist.do?category=0">받은 쪽지함</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="messagelist.do?category=1">보낸 쪽지함</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="messagelist.do?category=2">삭제된 쪽지</a>
				</li>					
			</ul>
		</div>
	</div>
	<!-- subcategory 선택 관련 사항 End -->
	
	<!-- ==================== 게시판 좌측메뉴 End ==================== -->
	
	<!-- ==================== 게시판 타이틀 들어가는부분 Start ==================== -->
	
	<div class="span10 text-center">
		<div class="hero-unit" style="font-size: 2em">
			<c:choose>
			    <c:when test="${category eq 0 }">
					받은 쪽지함
			    </c:when>
				<c:when test="${category eq 1 }">
					보낸쪽지함
			    </c:when>
			    <c:when test="${category eq 2 }">
					삭제된 쪽지
			    </c:when>
			</c:choose>
		</div>
	</div>

	<!-- ==================== 게시판 타이틀 들어가는부분 End ==================== -->
	
	<!-- ==================== 실제게시판 들어가는부분 Start ==================== -->
	<div class="span10" id="boardmain">
	
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="5%"><col width="20%"><col width="50%"><col width="15%">
			<thead>
				<tr>
					<th style="text-align: center;">Check</th>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">Icon</th>
					<th style="text-align: center;">Nickname</th>
					<th style="text-align: center;">Content</th>
					<th style="text-align: center;">Date</th>
				</tr>
			</thead>
			<tbody>	
			<c:if test="${empty msglist}">
			<tr>
				<td colspan="7">작성된 글이 없습니다.</td>
			</tr>	
			</c:if>
			
			<c:forEach items="${msglist}" var="msg" varStatus="vs">
			<tr>
				<td style="text-align: center;"><input type="checkbox" value="${msg.seq}" > </td>
				<td style="text-align: center;">${vs.count}</td>
				<td style="text-align: center;"><img src="./image/level/lv99.gif"></td>
				<td style="text-align: center;"><a href="#" class="userInfo" title="${msg.nickname}">${msg.nickname}</a></td>
			
				<!-- del==0 일 때 title 삭제 된 글로 표현 --> 
			<c:choose>
			<c:when test="${msg.del eq '0'}">
				<td style="text-align: left">삭제 된 글 입니다</td>
			</c:when>
			<c:otherwise>
				<c:choose>
				<c:when test="${msg.read eq '0'}">
				<td style="text-align: left"><a href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
				</c:when>
				<c:otherwise>
				<td style="text-align: left; color: #bbbbbb; "><a href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
				</c:otherwise>
				</c:choose>
			</c:otherwise>
			</c:choose>
				<!-- 날짜 형식 변경 -->
				<td style="text-align: center;">	<c:out value="${fn:substring(msg.wdate,2,10)}"/></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
			
			<!-- Nickname 선택시 정보표현 Start --> 		
			<script type="text/javascript">
			$(".userInfo").click(function () {
				// alert($(".userInfo").attr("title"));
					window.open("userInfo.do?",'내정보','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=800px,height=400px,top=100,left=100');
				});
			</script>
			<!-- Nickname 선택시 정보표현 End -->		

		
		<!-- ==================== 실제게시판 들어가는부분 End ==================== -->
 
		<!-- ==================== 페이징 처리 Start ==================== -->
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
			$("#_pageNumber").val(pageNumber) ;
			$("#_frmFormSearch").attr("target","_self").attr("action","messagelist.do").submit();
		}
		</script>
		
		<!-- ==================== 페이징 처리 End ==================== -->
	  
		<!-- ==================== 글쓰기 div start ==================== -->
		<div class="span9"></div>
		<div class="span2" style="float: right;"> 
			<button class="btn" style="margin:auto;" onclick="location.href='messagewrite.do'">Write</button>
		</div>	
		<!-- ==================== 글쓰기 div End ==================== -->
	</div>
</div>


<!-- ==================== 선택된 카테고리 active효과 주는 Script Start ==================== -->
<script type="text/javascript">
	$("#boardmenu li").click(function() {		
		$("#boardmenu").children().removeClass("active");
		$(this).addClass("active");
	});
	
</script>
<!-- ==================== 선택된 카테고리 active효과 주는 Script End ==================== -->