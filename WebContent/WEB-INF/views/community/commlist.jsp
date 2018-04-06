<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<fmt:requestEncoding value="utf-8"/>

<!-- 
<style>
	#searchicon:hover{
		background-color: #000084;
	}
</style>
<div class="row-fluid">
 -->
	<!-- ==================== 게시판 좌측메뉴 Start ==================== -->
	<div class="span2" id="boardmenudiv" style="padding-left: 10px">
		
		<!-- 검색 관련 사항 Start -->
		<form name="frmForm1" id="_frmFormSearch" method="post" action="">
			<table class="table table-bordered" >
				<tr>
					<td>
							&nbsp;<select id="_s_category" name="s_category" class="span10">
								<option value="" selected="selected">Select</option>
								<option value="title">Title</option>
								<option value="content">Content</option>								
							</select>
						<div class="span12">
							<div class="span10">
								<input type="text" style="width: 95%" id="_s_keyword" name="s_keyword" value="${s_keyword}">  
							</div>
							<div class="span2">
								<button  type="button" id="_btnSearch" style="background-color:#00ff0000;border-color: #00ff0000;" ><img  src="./image/search.png" style="padding-top: 9px"></button>
							</div>
						</div>
							<input type="hidden" name="pageNumber" id="_pageNumber" value="0"/>	
							<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
					</td>
				</tr>
				</table>
		</form>
		
		<script type="text/javascript">
		$(document).ready(function() {
			// select 유지
			$("#_s_category > option[value="+'<c:out value="${ param.s_category }"/>'+"]").attr("selected","selected");  
		});
		$("#_btnSearch").click(function() {
			$("#_frmFormSearch").attr({ "target":"_self", "action":"commlist.do" }).submit();
		});
		</script>
	</div>
		
		<!-- 검색 관련 사항 End -->

	<!-- ==================== 게시판 좌측메뉴 End ==================== -->
	
	<!-- ==================== 게시판 타이틀 들어가는부분 Start ==================== -->
	
	<div class="span9 text-center">
		<div class="hero-unit" style="font-size: 2em">Community</div>
	</div>

	<!-- ==================== 게시판 타이틀 들어가는부분 End ==================== -->
	
	<!-- ==================== 실제게시판 들어가는부분 Start ==================== -->
	<div class="span9" id="boardmain">
	
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="45%"><col width="10%"><col width="10%"><col width="5%"><col width="10%">
			<thead>
				<tr>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">Icon</th>
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
			
			<c:forEach items="${commlist}" var="comm" varStatus="vs">
			<tr>
				<td style="text-align: center;">${vs.count}</td>
				<td><img src="./image/level/lv66.gif"></td>
	
				<!-- del==0 일 때 title 삭제 된 글로 표현 --> 
			<c:choose>
			<c:when test="${comm.del eq '0'}">
				<td style="text-align: left">삭제 된 글 입니다</td>
			</c:when>
			<c:otherwise>
				<td style="text-align: left"><a href='commdetail.do?seq=${comm.seq}'>${comm.title}</a></td>
			</c:otherwise>
			</c:choose>
			
				<td style="text-align: center;">${comm.nickname}</td>
				<!-- 날짜 형식 변경 -->
				<td style="text-align: center;">	<c:out value="${fn:substring(comm.wdate,2,10)}"/></td>
				<td style="text-align: center;">${comm.readcount}</td>
				<td style="text-align: center;">${comm.up} / ${comm.down }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		

		
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
			$("#_frmFormSearch").attr("target","_self").attr("action","commlist.do").submit();
		}
		</script>
		
		<!-- ==================== 페이징 처리 End ==================== -->
	  
		<!-- ==================== 글쓰기 div start ==================== -->
		<div class="span9"></div>
		<div class="span2" style="float: right;"> 
			<button class="btn" style="margin:auto;" onclick="location.href='commwrite.do'">Write</button>
		</div>	
		<!-- ==================== 글쓰기 div End ==================== -->
	</div>
</div>