<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<div class="row-fluid">

	<!-- ==================== 게시판 좌측메뉴 Start ==================== -->
	<div class="span2" id="boardmenudiv" style="padding-left: 10px"> 
		<ul class="nav nav-list" id="boardmenu">
			<li class="nav-header">Category</li>
			<li class="divider"></li>
			<li>
				<a href="#">Tip</a>			
			</li>
			<li class="divider"></li>
			<li>
				<a href="#">Error</a>
			</li>
			<li class="divider"></li>
			<li>
				<a href="#">Example</a>
			</li>	
			<li class="divider"></li>	
			<li>
				<a href="#">E.T.C</a>
			</li>						
		</ul>
	</div>
	
	<!-- ==================== 게시판 좌측메뉴 End ==================== -->
	
	<!-- ==================== 실제게시판 들어가는부분 Start ==================== -->
	<div class="span9" id="boardmain">
		<table class="table table-hover" id="board">
			<col width="5%"><col width="5%"><col width="65%"><col width="10%"><col width="5%"><col width="5%"><col width="5%">
			<thead>
				<tr>
					<th style="text-align: center;">번호</th>
					<th style="text-align: center;"></th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">글쓴이</th>
					<th style="text-align: center;">등록일</th>
					<th style="text-align: center;">조회수</th>
					<th style="text-align: center;">추천</th>					
				</tr>
			</thead>
			<tbody>
				<tr>
					<td class="bbsseq" style="text-align: center;">Testing1</td>
					<td class="bbsicon" style="text-align: center;">Testing1-1</td>
					<td class="bbstitle" style="text-align: center;">Testing1-2</td>
					<td class="bbsnick" style="text-align: center;">Testing1-3</td>
					<td class="bbsdate" style="text-align: center;">Testing1-4</td>
					<td class="bbsreadcount" style="text-align: center;">Testing1-5</td>
					<td class="bbsup" style="text-align: center;">Testing1-6</td>
				</tr>
				<tr>
					<td>Testing2</td>
					<td>Testing2-1</td>
					<td>Testing2-2</td>
					<td>Testing2-3</td>
					<td>Testing2-4</td>
					<td>Testing2-5</td>
					<td>Testing2-6</td>
				</tr>
				<tr>
					<td>Testing3</td>
					<td>Testing3-1</td>
					<td>Testing3-2</td>
					<td>Testing3-3</td>
					<td>Testing3-4</td>
					<td>Testing3-5</td>
					<td>Testing3-6</td>
				</tr>
			</tbody>
		</table>
		<!-- ==================== 실제게시판 들어가는부분 End ==================== -->
		<!-- ==================== 글쓰기 div start ==================== -->
		<div class="span9"></div>
		<div class="span2" style="float: right;"> 
			<button class="btn btn-link">글쓰기</button>
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