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
								<option value="select" selected="selected">Select</option>
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
			
			if($("#_s_category option:selected").val()=="select"){
				alert("Title 또는 Content 선택하여 검색 하세요!!");
				return false;
			}else if($("#_s_keyword").val()==""){
				alert("검색창에 내용을 입력하세요!");
				$("#_s_keyword").focus();
				return false;
				
			}
			
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
			<col width="5%"><col width="45%"><col width="15%"><col width="10%"><col width="5%"><col width="10%">
			<thead>
				<tr>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Lv / Nickname</th>
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
				
				
				<!-- 아이콘 이미지를 가져오는 부분 -->
				<script type="text/javascript">
				$(document).ready(function() {
					$.ajax({
						  type:"POST"
						  ,url:"getMemberPoint.do"
						  ,data:{"nickname" : "${comm.nickname}"}
						  ,success:function(data){
							  var level = g_level(data.point);
							  $('#${comm.seq}icon').attr("src","./image/level/lv"+level+".gif");
						  },
						  error: function(xhr, status, error) {
							  alert("18");
					      }  
					 });
				 });
				
				</script>
				
				<!-- del==0 일 때 title 삭제 된 글로 표현 --> 
			<c:choose>
			<c:when test="${comm.del eq '0'}">
				<td style="text-align: left">유저에 의해 삭제 된 글 입니다</td>
			</c:when>
			<c:when test="${comm.del eq '1'}">
				<td style="text-align: left">관리자에 의해 삭제 된 글 입니다</td>
			</c:when>
			<c:otherwise>
			
				<!-- 댓글 카운트 가져오는 부분 -->
					<script type="text/javascript">
					$(document).ready(function() {
						$.ajax({
							  type:"POST"
							  ,url:"replycountcomm.do"
							  ,data:{"seq" : "${comm.seq}"}
							  ,success:function(data){
								  if(data.replycount !=0){
								  $('#${comm.seq }replycount').text("("+data.replycount+")");
								  }
							  },
							  error: function(xhr, status, error) {
								  alert("18");
						      }  
						 });
					 });
					</script>
			
				<td style="text-align: left"><a href='commdetail.do?seq=${comm.seq}'>${comm.title}</a>
				<span id="${comm.seq }replycount"></span>
			</c:otherwise>
			</c:choose>
				
				<!-- userinfo 정보 확인 -->
				<td style="text-align: center;">
				<img id="${comm.seq }icon" src="">
				<a onclick="window.open('userInfo_bbs.do?nickname=${comm.nickname}','내정보','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=800px,height=400px,top=100,left=100');" href="#" >${comm.nickname}</a></td>
				
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
			<button class="btn" style="margin:auto;" onclick="" id="_btnWrite">Write</button>
		</div>	
		
		<script type="text/javascript">
		$("#_btnWrite").click(function() {

			if("${login.nickname}"=="" || "${login.nickname}"==null ){
				alert("로그인 후 작성 가능 합니다!");
				return false;
			}
			
				location.href='commwrite.do';
		});
		</script>
		<!-- ==================== 글쓰기 div End ==================== -->
	</div>
</div>