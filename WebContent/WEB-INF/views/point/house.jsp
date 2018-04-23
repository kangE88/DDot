<%@page import="com.DDot.model.MemberDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./jquery/point.js"></script>
<style>
a:hover {
		background-color: #000084;   
	}
a:focus{
	background-color: #000084; 
}
</style>
</head>

<body>


<div class="row-fluid" style="height: 100%">
	<div class="span2">
</div>
<div class="span8 text-center">
	<div class="hero-unit">
		<h1>Welcome!</h1>
		<p>회원들만의 놀이공간 입니다. 경험치를 획득하여 Level을 올려보세요~!</p>
	</div>
	
	<table class="table">
		<tr>
			<td>
				<a href="#abc" data-toggle="tab" class="introtitle">가위바위보</a>
			</td>
			<td>
				<a href="#updown" data-toggle="tab">업다운</a>
			</td>					
		<tr>
		<tr>
			<td colspan="2">
				<div id="myTabContent" class="tab-content">
					<div class="tab-pane fade" id="abc">
						<p>
							가위바위보 게임입니다. 이기면 100 경험치를 얻습니다. 지면  100경험치를 잃습니다. 99레벨에 도전해보세요.<br>
							내고싶은 이미지를  선택하세요  <br>
							나의 경험치 : ${login.point }
							
						</p>
						<a href="#" class="userabc" value="1"><img alt="" src="./image/point/a200.png"></a>
						<a href="#" class="userabc" value="2"><img alt="" src="./image/point/b200.png"></a>
						<a href="#" class="userabc" value="3"><img alt="" src="./image/point/c200.png"></a>
						<div id="cpuabc">
							<font size='15'>vs</font>
							<img id="cpuabcimg" alt="" src="" value=""> <button id="stopbtn">Stop</button>
						</div>
					</div>
					<div class="tab-pane fade" id="updown">
						<p>
							업다운 게임입니다. 이기면 50 경험치를 얻습니다. 지면 50경험치를 잃습니다. 99레벨에 도전해보세요.<br>
							아래 손모양의 그림을 클릭하시면 이미지가 나타납니다. 1~3은 Down 4~6은 Up입니다. <br>
							나의 경험치 : ${login.point }
						</p>
						<a href="#" class="userupdown" value="up"><img alt="" src="./image/point/up.png"> </a>
						<font size="15"> vs </font><a href="#" class="userupdown" value="down"><img alt="" src="./image/point/down.png"> </a>
						<div id="cpuupdown">
						
						</div>
					</div>					
      			</div>	
			</td>
		</tr>
	</table>
</div>
<div class="span2">
</div>
</div>
<br>  

<!-- ==================== 가위바위보 스크립트 시작 ====================  -->

<script>
	var abc = new Array();
	abc[0] = 'a200.png';
	abc[1] = 'b200.png';
	abc[2] = 'c200.png';
	var user = null;
	var num = 0;
	var interval = null;
	
	var abclength = abc.length;   
	
	function cpuabcslide() {
		
		if(num==3) num=0;
		$("#cpuabcimg").prop("src",'./image/point/'+abc[num]);		
		num+=1;
	};
	  
	$(document).ready(function name() {
		$("#cpuabc").hide();
	});
	$(".userabc").click(function() {
		
		
		if(parseInt(${login.point})>=100){
			
			if(user == null){
				user = $(this).attr("value");
				
				$("#cpuabc").show();
				interval = setInterval(cpuabcslide,50)
			}
		}
		else if(parseInt(${login.point})<100){
			alert("Point가 모자릅니다.");
		}
	});
	$("#stopbtn").click(function() {
		clearTimeout(interval);
		
		var result = p_abc(user, num);		

		switch(result){
			case 3:
				alert("비겼습니다.")
			break;
			case 2:
				alert('이겼습니다. point : '+ ${login.point} + ' =====>' + ( parseInt(${login.point})+100));
			break;
			case 1:
				alert('졌습니다. point : '+ ${login.point} + ' =====>' + ( parseInt(${login.point})-100));
			break;	
		}
		
		$.ajax({
			url: "abchouse.do",
			type: "post",
			data: {result : result},
			success:function(data){				
				location.reload();
			},
			error:function( request, status, error )
			{
				alert( "실패" );
			}
		});
	});
	$(".introtitle").mouseleave(function() {
		$(this).prop("style","background-color: #000084");
	});
</script>

<!-- ==================== 가위바위보 스크립트 끝 ====================  -->

<!-- ==================== 업다운 스크립트 시작 ====================  -->

<script type="text/javascript">
	$(".userupdown").click(function() {
		if(parseInt(${login.point})>=50){
		var user = $(this).attr("value");	  		
		var random = Math.floor(Math.random() * 6) + 1;	
		var result;
		
		for(i=1;i<=random;i++){
			$("#cpuupdown").append("<img src='./image/point/star.png'>");
		}
		
		setTimeout(function() {
			updownresult(user, random)
		}, 500);	  	
		}
		else{
			alert("Point가 모자랍니다.");
		}
		
	});
	
	function updownresult(user, random) {
		if(random<4){	// down
			if(user=="down"){
				alert('이겼습니다. point : '+ ${login.point} + ' =====>' + ( parseInt(${login.point})+50));
				result = 0;
			}
			else if(user=="up"){
				alert('졌습니다. point : '+ ${login.point} + ' =====>' + ( parseInt(${login.point})-50));
				result = 1;
			}
			$.ajax({
				url: "updownhouse.do",
				type: "post",
				data: {result : result},
				success:function(data){				
					location.reload();
				},
				error:function( request, status, error )
				{
					alert( "실패" );
				}
			});
		}
		else{	// up
			if(user=="down"){
				alert('졌습니다. point : '+ ${login.point} + ' =====>' + ( parseInt(${login.point})-50));
				result = 1;
			}
			else{
				alert('이겼습니다. point : '+ ${login.point} + ' =====>' + ( parseInt(${login.point})+50));
				result = 0;
			}
			$.ajax({
				url: "updownhouse.do",
				type: "post",
				data: {result : result},
				success:function(data){				
					location.reload();
				},
				error:function( request, status, error )
				{
					alert( "실패" );
				}
			});
		}
	}
</script>

<!-- ==================== 업다운 스크립트 끝 ====================  -->

</body>
</html>