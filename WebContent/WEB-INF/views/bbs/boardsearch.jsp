<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<fmt:requestEncoding value="utf-8"/>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Laboratory</title>

<!-- 전체div 메인이랑 맞추려면 padding-top 2% 주기-->
<div class="row-fluid" style="height: 100%">
	<!-- <div class="span1"></div> -->	
	<div class="span6">
		<h4>검색된 게시판의 글수 : ${totalRecordCount }</h4>
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="5%"><col width="40%"><col width="10%"><col width="10%"><col width="5%"><col width="10%">
			<thead> 
				<tr>
					<th style="text-align: center;">No.</th>
					<th style="text-align: center;">Level</th>
					<th style="text-align: center;">Category</th>
					<th style="text-align: center;">Title</th>
					<th style="text-align: center;">Nickname</th>
					<th style="text-align: center;">Date</th>
					<th style="text-align: center;">Count</th>
					<th style="text-align: center;">Good / bad</th>					
				</tr>
			</thead>
			<tbody>	
			<c:if test="${empty boardlist}">	
			<tr>
				<td colspan="7">작성된 글이 없습니다.</td>
			</tr>	
			</c:if>
			
			<c:forEach items="${boardlist}" var="bbs" varStatus="vs">
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
				
				<!-- subcategory 값이 0~3에 따른 값 입력 -->
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
					
				<!-- del==0 일 때 title 삭제 된 글로 표현 --> 
			<c:choose>
			<c:when test="${bbs.del eq '0'}">
				<td style="text-align: left">삭제 된 글 입니다</td>
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
				<td style="text-align: left"><a href='bbsdetail.do?seq=${bbs.seq}'>${bbs.title}</a>&nbsp;&nbsp;<span id="${bbs.seq }replycount"></span></td>
			</c:otherwise>
			</c:choose>
			
				<td style="text-align: center;"><a href="#" class="userInfo" title="${bbs.nickname}">${bbs.nickname}</a></td>
				<!-- 날짜 형식 변경 -->
				<td style="text-align: center;">	<c:out value="${fn:substring(bbs.wdate,5,10)}"/></td>
				<td style="text-align: center;">${bbs.readcount}</td>
				<td style="text-align: center;">${bbs.up} / ${bbs.down }</td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
		
		<form id="searchbbs" action="">
			<input type="hidden" name="pageNumber" id="_pageNumber" value="${pageNumber }"/>	
			<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
			<input type="hidden" name="pageNumberc" id="_pageNumberc1" value="${pageNumberc }"/>
			<input type="hidden" name="recordCountPerPagec" id="_recordCountPerPagec" value="${(empty recordCountPerPagec)?10:recordCountPerPagec}"/>
			<input type="hidden" name="category" id="_category" value="${s_category }"/>
			<input type="hidden" name="text" id="_text" value="${s_keyword }"/>
		</form>
		
		<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/common/paging.jsp" flush="false">
			<jsp:param value="${pageNumber }" name="pageNumber"/>
			<jsp:param value="${pageCountPerScreen }" name="pageCountPerScreen"/>
			<jsp:param value="${recordCountPerPage }" name="recordCountPerPage"/>
			<jsp:param value="${totalRecordCount }" name="totalRecordCount"/>
		</jsp:include>
		</div>		
		
			
			<!-- Nickname 선택시 정보표현 Start --> 		
			<script type="text/javascript">
			$(".userInfo").click(function () {
				// alert($(".userInfo").attr("title"));
					window.open("userInfo.do?",'내정보','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=800px,height=400px,top=100,left=100');
				});
			</script>
			<!-- Nickname 선택시 정보표현 End -->		
	</div>
	
	<div class="span6">
		<h4>검색된 커뮤니티의 글수 : ${totalRecordCountc }  </h4>
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
			
			<c:forEach items="${commlist}" var="comm" varStatus="vs">
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
				<td style="text-align: left"><a href='commdetail.do?seq=${comm.seq}'>${comm.title}</a>&nbsp;&nbsp;<span id="${comm.seq }replycount"></span></td>						
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
		
		<form id="searchcomm" action="">
			<input type="hidden" name="pageNumber" id="_pageNumber1" value="${pageNumber }"/>	
			<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
			<input type="hidden" name="pageNumberc" id="_pageNumberc" value="${pageNumberc }"/>	
			<input type="hidden" name="recordCountPerPagec" id="_recordCountPerPagec" value="${(empty recordCountPerPagec)?10:recordCountPerPagec}"/>
			<input type="hidden" name="category" id="_categoryc" value="${s_category }"/>
			<input type="hidden" name="text" id="_textc" value="${s_keyword }"/>
		</form>
		
		<div id="paging_wrap">
		<jsp:include page="/WEB-INF/views/common/paging1.jsp" flush="false">
			<jsp:param value="${pageNumberc }" name="pageNumberc"/>
			<jsp:param value="${pageCountPerScreenc }" name="pageCountPerScreenc"/>
			<jsp:param value="${recordCountPerPagec }" name="recordCountPerPagec"/>
			<jsp:param value="${totalRecordCountc }" name="totalRecordCountc"/>
		</jsp:include>
		</div>
	</div>
	<!-- <div class="span1"></div> -->
	<script type="text/javascript">
		function goPage(pageNumber) {
			
			$("#_pageNumber").val(pageNumber);				
		 	$("#_pageNumberc1").val(${pageNumberc });
						
			$("#searchbbs").attr("target","_self").attr("action","boardsearch.do").submit();			
		}

		function goPagec(pageNumberc) {
			
			$("#_pageNumberc").val(pageNumberc);
			$("#_pageNumber1").val(${pageNumber });
						
			$("#searchcomm").attr("target","_self").attr("action","boardsearch.do").submit();
		}
	</script>
</div>

