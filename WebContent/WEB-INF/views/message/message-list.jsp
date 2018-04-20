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
<div class="row-fluid" style="margin-bottom:  30px; margin-top:  30px;">

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
	<form name="frmForm1" id="_frmFormSearch" method="post" action="">
	
	<!-- 각 페이지의 category & subcategory 및 페이징 정보 전송 -->
	<input type="hidden" name="pageNumber" id="_pageNumber" value="0"/>	
	<input type="hidden" name="recordCountPerPage" id="_recordCountPerPage" value="${(empty recordCountPerPage)?10:recordCountPerPage}"/>
	<input type="hidden" name="category" value="${category }"/>
	
	</form>	
	<div class="span10" id="boardmain" >
	
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="20%"><col width="55%"><col width="15%">
			<thead>
				<tr>
					<th style="text-align: center;">Check<input name="checkall" type="checkbox" onclick="checkAll()"></th>
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
			
			<%-- 내용 시작  --%>
			<c:forEach items="${msglist}" var="msg" varStatus="vs">
			<c:choose>
			<%-- 받은 쪽지함 일 경우  --%>
			<c:when test="${category eq '0'}">
				<c:choose>
					<%-- 수신자가 삭제하지 않았을 경우 --%>
					<c:when test="${msg.senddel eq '2'}">
						<tr>
						<td style="text-align: center;"><input name="checkrow" type="checkbox" value="${msg.seq}" ></td>
						<td style="text-align: center;"><img src="./image/level/lv99.gif"></td>
						<%-- 수신자가 쪽지를 읽지 않은 경우 --%>
						<c:choose>
							<c:when test="${msg.sendread eq '0'}">
								<td style="text-align: center"><a href="#" class="userInfo" title="${msg.nickname}">${msg.nickname}</a></td>
								<td style="text-align: left"><a href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
							</c:when>
							<%-- 수신자가 쪽지를 읽었을 경우  sendread == 1 --%>
							<c:otherwise>
								<td style="text-align: center;"><a style=" color: #bbbbbb;" class="userInfo" title="${msg.nickname}">${msg.nickname}</a></td>
								<td style="text-align: left; color: #bbbbbb; "><a style=" color: #bbbbbb; "href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
							</c:otherwise>
							</c:choose>
							<%-- 날짜 형식 변경 --%>
							<td style="text-align: center;">	<c:out value="${fn:substring(msg.wdate,2,10)}"/></td>
						</tr>
					</c:when>
				</c:choose>
			</c:when>
			<%-- 받은 쪽지함 end --%>
			<%-- 보낸 쪽지함 start --%>
			<c:when test="${category eq '1'}">
				<c:choose>
					<%-- 발신자가 삭제하지 않았을 경우 --%>
					<c:when test="${msg.nickdel eq '2'}">
						<tr>
						<td style="text-align: center;"><input name="checkrow" type="checkbox" value="${msg.seq}" ></td>
						<td style="text-align: center;"><img src="./image/level/lv99.gif"></td>
						<%-- 발신자가 쪽지를 읽지 않은 경우 --%>
						<c:choose>
							<c:when test="${msg.nickread eq '0'}">
								<td style="text-align: center"><a href="#" class="userInfo" title="${msg.sendto}">${msg.sendto}</a></td>
								<td style="text-align: left"><a href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
							</c:when>
							<%-- 수신자가 쪽지를 읽었을 경우  sendread == 1 --%>
							<c:otherwise>
								<td style="text-align: center;"><a style=" color: #bbbbbb;" class="userInfo" title="${msg.sendto}">${msg.sendto}</a></td>
								<td style="text-align: left; color: #bbbbbb; "><a style=" color: #bbbbbb; "href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
							</c:otherwise>
							</c:choose>
							<%-- 날짜 형식 변경 --%>
							<td style="text-align: center;">	<c:out value="${fn:substring(msg.wdate,2,10)}"/></td>
						</tr>
					</c:when>
				</c:choose>
			</c:when>
			<%-- 보낸 쪽지함 end --%>
			<%-- 삭제한 쪽지함 start --%>
			<c:when test="${category eq '2'}">
				<c:choose>
					<%-- 수신자가 삭제했을때 --%>
					<c:when test="${msg.senddel eq '0'}">
						<tr>
						<td style="text-align: center;"><input name="checkrow" type="checkbox" value="${msg.seq}" ></td>
						<td style="text-align: center;"><img src="./image/level/lv99.gif"></td>
						<%-- 수신자가 쪽지를 읽지 않은 경우 --%>
						<c:choose>
							<c:when test="${msg.sendread eq '0'}">
								<td style="text-align: center"><a href="#" class="userInfo" title="${msg.nickname}">${msg.nickname}</a></td>
								<td style="text-align: left"><a href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
							</c:when>
							<%-- 수신자가 쪽지를 읽었을 경우  sendread == 1 --%>
							<c:otherwise>
								<td style="text-align: center;"><a style=" color: #bbbbbb;" class="userInfo" title="${msg.nickname}">${msg.nickname}</a></td>
								<td style="text-align: left; color: #bbbbbb; "><a style=" color: #bbbbbb; "href='messagedetail.do?category=${category}&seq=${msg.seq}'>${msg.content}</a></td>
							</c:otherwise>
							</c:choose>
							<%-- 날짜 형식 변경 --%>
							<td style="text-align: center;"><c:out value="${fn:substring(msg.wdate,2,10)}"/></td>
						</tr>
					</c:when>
				</c:choose>
			</c:when>
			<%-- 삭제한 쪽지함 end --%>
			</c:choose>
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
		<div class="span7"></div>
		<div class="span4" style="float: right;">
		<c:if test="${category eq 0 }">
		 	<button id="_delete" class="btn" style="margin:auto;" onclick="deleteAction()">Delete</button>
		 </c:if>
			<button class="btn" style="margin:auto;" onclick="location.href='messagewrite.do'">Write</button>
		</div>	
		<!-- ==================== 글쓰기 div End ==================== -->
	</div>
</div>


<script type="text/javascript">
	$("#boardmenu li").click(function() {		
		$("#boardmenu").children().removeClass("active");
		$(this).addClass("active");
	});
	
	
	// 체크박스 컨트롤
	// 전체 체크,전체 해제
	function checkAll(){
	      if( $("input[name='checkall']").is(':checked') ){
	        $("input[name='checkrow']").prop("checked", true);
	      }else{
	        $("input[name='checkrow']").prop("checked", false);
	      }
	}
	
	/* 삭제(체크박스된 것 전부) */
	function deleteAction(){
	  var checkRow = "";
	  $( "input[name='checkrow']:checked" ).each (function (){
	    checkRow = checkRow + $(this).val()+"," ;
	  });
	  checkRow = checkRow.substring(0,checkRow.lastIndexOf(",")); //맨끝 콤마 지우기
	 
	   if(checkRow == ''){
	    alert("삭제할 대상을 선택하세요.");
	    return false;
	  } 
	  console.log("### checkRow => "+checkRow);
	 
	   if(confirm("쪽지를 삭제 하시겠습니까?")){
	      
	      //삭제처리 후 다시 불러올 리스트 url      
	      //location.href="${rc.contextPath}/test_proc.do?idx="+checkRow+"&goUrl="+url+"&page="+page+"&saleType="+saleType+"schtype="+schtype+"schval="+schval;     
	      location.href="messagedelete.do?checklist="+checkRow;
	  } 
	}
</script>
