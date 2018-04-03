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
		<div class="span11">
			<div class="span10">
				<input type="text" style="width: 95%">  
			</div>
			<div class="span2">
				<a id="searchicon" href="#"><img  src="./image/search.png" style="padding-top: 9px"></a>
			</div> 
		</div>
		
		<div class="span11">  
			<ul class="nav nav-list" id="boardmenu">
				<li class="nav-header">Category</li>
				<li class="divider"></li>
				<li>
					<%-- <a href="bbslist.do?category=${bbslist.category }&subcategory=0">Tip</a> --%>			
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
			<col width="5%"><col width="5%"><col width="5%"><col width="50%"><col width="10%"><col width="10%"><col width="5%"><col width="5%">
			<thead>
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;">아이콘</th>
					<th style="text-align: center;">category</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">글쓴이</th>
					<th style="text-align: center;">등록일</th>
					<th style="text-align: center;">조회수</th>
					<th style="text-align: center;">추천/비추</th>					
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
				<td>${vs.count}</td>
				<td><img src="./image/level/lv99.gif"></td>
				
				<!-- subcategory 값이 0~3에 따른 값 입력 -->
				<c:choose>
				    <c:when test="${bbs.subcategory eq 0 }">
				       <td>[Tip]</td> 
				    </c:when>
					<c:when test="${bbs.subcategory eq 1 }">
				       <td>[Error]</td> 
				    </c:when>
				    <c:when test="${bbs.subcategory eq 2 }">
				       <td>[Example]</td> 
				    </c:when>
				    <c:when test="${bbs.subcategory eq 3 }">
				       <td>[E.T.C]</td> 
				    </c:when>
				</c:choose>

				<td style="text-align: left"><a href='bbsdetail.do?seq=${bbs.seq}'>${bbs.title}</a></td>
				<td>${bbs.nickname}</td>
				<!-- 날짜 형식 변경 -->
				<td>	<c:out value="${fn:substring(bbs.wdate,2,10)}"/></td>
				<td>${bbs.readcount}</td>
				<td>${bbs.up} / ${bbs.down }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		<!-- ==================== 실제게시판 들어가는부분 End ==================== -->
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