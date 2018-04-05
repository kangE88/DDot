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
		
		<!-- 검색 관련 사항 Start -->
		<form name="frmForm1" id="_frmFormSearch" method="post" action="">
			<table class="table table-bordered" >
				<tr>
					<td>
							&nbsp;<select id="_s_category" name="s_category" class="span10">
								<option value="" selected="selected">select</option>
								<option value="title">title</option>
								<option value="content">content</option>								
							</select>
						<div class="span12">
							<div class="span10">
								<input type="text" style="width: 95%" id="_s_keyword" name="s_keyword" value="${s_keyword}">  
							</div>
							<div class="span2">
								<button  type="button" id="_btnSearch" style="background-color:#00ff0000;border-color: #00ff0000;" ><img  src="./image/search.png" style="padding-top: 9px"></button>
							</div>
						</div>
							<!-- 각 페이지의 category & subcategory 및 페이징 정보 전송 -->
							<input type="hidden" name="pageNumber" id="_pageNumber" value="0"/>	
							<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
							<input type="hidden" name="category" value="${category }"/>
							<input type="hidden" name="subcategory" value="${subcategory }"/>					
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
			$("#_frmFormSearch").attr({ "target":"_self", "action":"bbslist.do" }).submit();
		});
		</script>
		<!-- 검색 관련 사항 End -->
		
		<!-- subcategory 선택 관련 사항 Start -->
		<div class="span12">  
			<ul class="nav nav-list" id="boardmenu">
				<li class="nav-header">Category</li>
				<li class="divider"></li>
				<li>
					<a href="bbslist.do?category=${category }&subcategory=0">Tip</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="bbslist.do?category=${category }&subcategory=1">Error</a>
				</li>
				<li class="divider"></li>
				<li>
					<a href="bbslist.do?category=${category }&subcategory=2">Example</a>
				</li>	
				<li class="divider"></li>	
				<li>
					<a href="bbslist.do?category=${category }&subcategory=3">E.T.C</a>
				</li>						
			</ul>
		</div>
	</div>
	<!-- subcategory 선택 관련 사항 End -->
	
	<!-- ==================== 게시판 좌측메뉴 End ==================== -->
	
	<!-- ==================== 게시판 타이틀 들어가는부분 Start ==================== -->
	
	<div class="span9 text-center">
		<div class="hero-unit" style="font-size: 2em">
			<c:choose>
			    <c:when test="${category eq 0 }">
			       Java 
			    </c:when>
				<c:when test="${category eq 1 }">
			       JSP 
			    </c:when>
			    <c:when test="${category eq 2 }">
			       JQuery  
			    </c:when>
			    <c:when test="${category eq 3 }">
			       Oracle/SQL  
			    </c:when>
			    <c:when test="${category eq 4 }">
			       Spring  
			    </c:when>
			    <c:when test="${category eq 5 }">
			       E.T.C  
			    </c:when>
			</c:choose>
		</div>
	</div>

	<!-- ==================== 게시판 타이틀 들어가는부분 End ==================== -->
	
	<!-- ==================== 실제게시판 들어가는부분 Start ==================== -->
	<div class="span9" id="boardmain">
	
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="5%"><col width="40%"><col width="10%"><col width="10%"><col width="5%"><col width="10%">
			<thead>
				<tr>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">icon</th>
					<th style="text-align: center;">category</th>
					<th style="text-align: center;">title</th>
					<th style="text-align: center;">nickname</th>
					<th style="text-align: center;">date</th>
					<th style="text-align: center;">count</th>
					<th style="text-align: center;">good / bad</th>					
				</tr>
			</thead>
			<tbody>	
			<c:if test="${empty bbslist}">
			<tr>
				<td colspan="7">작성된 글이 없습니다.</td>
			</tr>	
			</c:if>
			
			<c:forEach items="${bbslist}" var="bbs" varStatus="vs">
			<tr>
				<td style="text-align: center;">${vs.count}</td>
				<td><img src="./image/level/lv99.gif"></td>
				
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
				<td style="text-align: left">삭제 된 글 입니다</td>
			</c:when>
			<c:otherwise>
				<td style="text-align: left"><a href='bbsdetail.do?seq=${bbs.seq}'>${bbs.title}</a></td>
			</c:otherwise>
			</c:choose>
			
				<td style="text-align: center;">${bbs.nickname}</td>
				<!-- 날짜 형식 변경 -->
				<td style="text-align: center;">	<c:out value="${fn:substring(bbs.wdate,2,10)}"/></td>
				<td style="text-align: center;">${bbs.readcount}</td>
				<td style="text-align: center;">${bbs.up} / ${bbs.down }</td>
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
			$("#_frmFormSearch").attr("target","_self").attr("action","bbslist.do").submit();
		}
		</script>
		
		<!-- ==================== 페이징 처리 End ==================== -->
	  
		<!-- ==================== 글쓰기 div start ==================== -->
		<div class="span9"></div>
		<div class="span2" style="float: right;"> 
			<button class="btn btn-link" onclick="location.href='bbswrite.do'">글쓰기</button>
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