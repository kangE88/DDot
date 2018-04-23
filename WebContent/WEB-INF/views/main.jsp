<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<body>
<div class="row-fluid">
	<%-- <img alt="logo" src="<%=request.getContextPath()%>/image/logo.png" class="span12"> --%>
</div>
<div class="span2">
</div>
<div class="span8 text-center" style="margin:auto;">
	<br>
 	<div class="hero-unit">
		<h1>Wellcome DevDot!</h1>
		<p>환영합니다! 이곳은 개발자들을 위한 공간이며, 지식을 공유하고 자랑하세요!<br><br>
		궁금한 내용을 검색해보세요!</p>
	</div>
	<br>
	<br>
		<h3>검색어를 입력하세요 : <select id="selectcate" style="width: 10%">  
								<option value="all">All</option>
						    	<option value="title">Title</option>
								<option value="content">Content</option>
							</select>
		<input id="boardsearchtext" type="text" style="width: 30%"><a id="boardsearchbtn" href="#"><img alt="" src="./image/search.png"></a> </h3>
	<br>
	<br>
	<div class="row-fluid">
      <ul class="thumbnails example-sites">
        <li class="span3">
          <a class="thumbnail" href="http://jason.sperske.com/wad/" target="_blank">
            <img src="assets/img/example-sites/wad.png" alt="WADParser.py">
          </a>
          <a class="btn">more</a>
        </li>
        <li class="span3">
          <a class="thumbnail" href="http://kippt.com/" target="_blank">
            <img src="assets/img/example-sites/kippt.png" alt="Kippt">
          </a>
          <a class="btn">more</a>
        </li>
        <li class="span3">
          <a class="thumbnail" href="http://www.gathercontent.com/" target="_blank">
            <img src="assets/img/example-sites/gathercontent.png" alt="Gather Content">
          </a>
          <a class="btn">more</a>
        </li>
        <li class="span3">
          <a class="thumbnail" href="http://www.jshint.com/" target="_blank">
            <img src="assets/img/example-sites/jshint.png" alt="JS Hint">
          </a>
          <a class="btn">more</a>
        </li>
        </ul>
        </div>
<%-- 	<table class="table">
		<tr>
			<td>
				<a id="introlink" href="#intro" data-toggle="tab" class="introtitle">DevDot이란?</a>
				<a href="#introboard" data-toggle="tab" class="introtitle">Board</a>
				<a href="#introcommunity" data-toggle="tab" class="introtitle">Community</a>
				<a href="#introclab" data-toggle="tab" class="introtitle">C.Lab</a>
				<a href="#introchat" data-toggle="tab" class="introtitle">Chat</a>
				<a href="#introdonate" data-toggle="tab" class="introtitle">Donate</a>
				<a href="#introprompt" data-toggle="tab" class="introtitle">Prompt</a>
				<a href="#introattendance" data-toggle="tab" class="introtitle">Attendance</a>
			</td>
		<tr>
		<tr>
			<td>
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade" id="intro">
						<img alt="" src="<%=request.getContextPath()%>/image/logo.png">					
						<p>
							프로그램 개발자들이 자신의 코드나 언어, 툴에 대한 지식을 얻거나 공유하기 위하여 각종 콘텐츠를 통해 능력을 향상시키고 기록하여 추후 많은 데이터로 잦은 실수를 방지하고 올바른 방법을 찾는 Developer 들이 모일 수 있는 공간을 제공
						</p>
					</div>
					<div class="tab-pane fade" id="introboard">
          				<p>
          					여러가지 언어에 대한 각종 Tip, Error, Debut등의 정보를 공유하고 쉽게 접근할 수 있는 게시판
          				</p>
      				</div>
      				<div class="tab-pane fade" id="introcommunity">
          				<p>
          					개발하면서 지친 심신을 풀어주는곳 재미있는 짤방, 사진등을 공유하고 모두 즐길수 있는 게시판 
          				</p>
      				</div>
      				<div class="tab-pane fade" id="introclab">
          				<p>
          					개발툴을 쓰찌 않아도 내가 작성한 코드의 결과를 한눈에 볼 수 있는 공간. Javascript, Jquery등을 모두 지원한다.
          				</p>
      				</div>
      				<div class="tab-pane fade" id="introchat">
          				<p>
          					현재 접속중인 회원들과 채팅할 수 있는 공간. 내가 궁금한것을 바로바로 알 수 있게 해주는 공간
          				</p>
      				</div>
      				<div class="tab-pane fade" id="introdonate">
          				<p>
          					DDot에게 후원해주는 공간. DDot의 발전과 유지를 위해서 여러분들의 도움이 필요합니다.
          				</p>
      				</div>
      				<div class="tab-pane fade" id="introprompt">
          				<p>
          					하단에 있는 프롬프트에 명령어를 입력한 후 엔터키를 치면 그에 상응하는 페이지로 이동합니다. 프롬프트에 /help를 입력후 엔터를 쳐보세요.
          				</p>
      				</div>
      				<div class="tab-pane fade" id="introattendance">
      					<p>
      						비회원도 이용할 수 있지만 회원가입하시면 DDot만의 Level, 경험치, Skill등의 재미있는 기능을 만끽할 수 있습니다.
      					</p>
      				</div>
				</div>
			</td>
		</tr>
	</table> --%>
</div>
<div class="span2">
</div>

<br>

<script>
		$(".introtitle").mouseleave(function() {
			$(this).prop("style","background-color: #000084");
		});
		$(function() {
			$("#introlink").click();
		});
		$("#boardsearchbtn").click(function() {
			var category = $("#selectcate").val();
			var text = $("#boardsearchtext").val();			
			
			location.href="boardsearch.do?category="+category+"&text="+text;
		});
</script>



</body>
</html>