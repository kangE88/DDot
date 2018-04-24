<%@page import="com.DDot.model.MemberDto"%>
<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
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
<br><br>
<div class="row-fluid">
	<div class="span2">
</div>
<div class="span8 text-center">
	<div class="hero-unit">
		<br>
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
						<p class="prettyprint">
							이기면 100 Point 적립! 지면 100 Point 차감!<br><br>
							묵, 찌, 빠 중  내고싶은 이미지를 선택하세요!<br><br>
							나의 Point : ${login.point }<br>
							
						</p>
						<div class="span7">
						<a href="#" class="userabc" value="1"><img alt="" src="./image/point/a150.png"></a>
						<a href="#" class="userabc" value="2"><img alt="" src="./image/point/b150.png"></a>
						<a href="#" class="userabc" value="3"><img alt="" src="./image/point/c150.png"></a>
						<font size='15'>vs</font>
						</div>
						<div id="cpuabc" class="span4">
							
							<img id="cpuabcimg" alt="" src="" value=""> <img title="Stop" id="stopbtn" alt="" src="./image/stop.png">
						</div>
					</div>
					<div class="tab-pane fade" id="updown">
						<p class="prettyprint">
							이기면 50 Point 적립! 지면 50 Point 차감! <br><br>
							임의의 별이 세팅됩니다. 별의 갯수 : 1개 ~ 3개 Down! 4개 ~ 6개 Up!<br><br>
							나의 Point : ${login.point }<br>
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
	abc[0] = 'a150.png';
	abc[1] = 'b150.png';
	abc[2] = 'c150.png';
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