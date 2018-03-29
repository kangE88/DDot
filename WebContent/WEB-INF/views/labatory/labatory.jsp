<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- css & js 파일 추가하는 부분 Start -->
<!-- <link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="./css/prettify.css"> -->


<script type="text/javascript">
	_386 = {fastLoad: true};
</script>

<!-- css & js 파일 추가하는 부분 End -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Laboratory</title>

<!-- 전체div 메인이랑 맞추려면 padding-top 2% 주기-->
<div>
	<div class="span12">
		<button id="appendbtn" class="btn btn-link">Run Your Script</button>
		<button id="clearbtn" class="btn btn-link">Clear Your Script</button>
		<button id="copybtn" class="btn btn-link">Copy To ClipBoard</button>
	</div>
	<div class="span12">	
		<!-- script 쓰는부분 -->
		<div class = "span5" id="insertlabatory" style="height:500px; border: 1px solid yellow;">
			<textarea id="scriptarea" name="script" style="width: 100%; height: 98%; resize: none; background-color: #000084; color: yellow"></textarea>
		</div>
		<div class="span1" style="height:500px;  vertical-align: middle;">
			<br><br><br><br><br><br><br><br><br><br>
			<img src="./image/arrow-pointing-to-right.png">
		</div>
		
		
	<!-- 결과출력 부분  -->	
		<div class="span5" id="resultlabatory" style="height:500px ; border: 1px solid yellow;"></div>	
	</div>
</div>



<script type="text/javascript">
$("#appendbtn").click(function() {
	var script = $("#scriptarea").val();
	alert(script);
	
	$("#resultlabatory").load('./result.jsp', script, function() {
		alert("load run");
		$("#resultdiv").append(script);
	});
	 
	/* 
	$.ajax({
	    url : "./result.jsp",
	    dataType : "html",
	    type : "post",  // post 또는 get
	    data : script,   // 호출할 url 에 있는 페이지로 넘길 파라메터
	    success : function(result){
	    	alert("success");
	        $("#resultdiv").html(result);
	    }
	});
	  */
});
$("#clearbtn").click(function() {
	alert("clear");
	$("#resultdiv").empty();
});

$("#copybtn").click(function() {
	var copyText = document.getElementById("scriptarea");
	  copyText.select();
	  document.execCommand("Copy");
	  alert("Copied the text: " + copyText.value);	
});
</script>

<script type="text/javascript">
    (function(){
        var url = document.getElementById("resultlabatory").src;            
        var result = encodeURI(decodeURI(url));    
        document.getElementById("resultlabatory").src = result;
    }());
</script>
