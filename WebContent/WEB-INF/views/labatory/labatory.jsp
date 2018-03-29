<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<!-- css & js 파일 추가하는 부분 Start -->
<link rel="stylesheet" type="text/css" href="./css/bootstrap.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-theme.css">
<link rel="stylesheet" type="text/css" href="./css/bootstrap-responsive.css">
<link rel="stylesheet" type="text/css" href="./css/prettify.css">


<script type="text/javascript">
	_386 = {fastLoad: true};
</script>

<!-- css & js 파일 추가하는 부분 End -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Laboratory</title>

<!-- 전체div 메인이랑 맞추려면 padding-top 2% 주기-->
<div id="container" style="padding-top:1.5%; width: 100%; height: 90%;">
<div style="margin: 5px; width: 99%; height: 5%;" >
<button id="appendbtn" class="btn btn-link">Click Me! & Run Your Script</button>
<button id="clearbtn" class="btn btn-link">Click Me! & Clear Your Script</button>
<button id="savebtn" class="btn btn-link">Click Me! & Save Your Script PDF File</button>
</div>
<div id="labatory" style="width: 99%; height: 90%">

<!-- script 쓰는부분 -->
<div id="insertlabatory" style="float: left; padding:5px; width: 49%; height: 98%">
<textarea id="scriptarea" name="script" style="width: 100%; height: 100%; resize: none; border: 1px solid yellow; background-color: #000084; color: yellow"></textarea>
</div>

<!-- 결과출력 부분  -->

<div id="resultlabatory" style="float: right; margin:5px; margin-top:15px; width: 49%; height: 98%; border: 1px solid yellow;"></div>

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
</script>

<script type="text/javascript">
    (function(){
        var url = document.getElementById("resultlabatory").src;            
        var result = encodeURI(decodeURI(url));    
        document.getElementById("resultlabatory").src = result;
    }());
</script>

