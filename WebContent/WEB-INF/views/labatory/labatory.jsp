<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>

<!--  =================== codemirror theme css  =================== -->
<link rel="stylesheet" type="text/css" href="./codemirror/lib/codemirror.css?ver=1">
<link rel="stylesheet" type="text/css" href="./codemirror/theme/lucario.css">
<link rel="stylesheet" type="text/css" href="./codemirror/hint/show-hint.css">

<!--  =================== codemirror javascript  =================== -->
<script src="./codemirror/lib/codemirror.js"></script>
<script src="./codemirror/mode/javascript/javascript.js"></script>
<script src="./codemirror/mode/markdown/markdown.js"></script>

<!--  =================== codemirror hint  =================== -->
<script src="./codemirror/hint/javascript-hint.js"></script>
<script src="./codemirror/hint/show-hint.js"></script>

<!-- =================== alertify js/css  =================== -->
<script src="./js/alertify.min.js"></script>
<link rel="stylesheet" type="text/css" href="./css/alertify.core.css">
<!-- css & js End -->
<style>
.CodeMirror {  
  height: auto;
}
.alertify-log.alertify-log-success.alertify-log-show{
	background-color: #6cbf28;
	color: #ffffdc;
}
</style>

<!-- animation off -->
<script type="text/javascript">
	_386 = {fastLoad: true};
	/* var myCodeMirror = CodeMirror.fromTextArea(document.getElementById("scriptarea")); */
	

</script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Laboratory</title>

<!-- 전체div 메인이랑 맞추려면 padding-top 2% 주기-->
<div class="row-fluid" style="height: 100%">	
	<div class="span11" style="height: 10%">
	&nbsp;&nbsp;&nbsp;
		<button id="appendbtn" class="btn btn-link">Run Your Script</button>
		<button id="clearbtn" class="btn btn-link">Clear Your Script</button>
		<button id="copybtn" class="btn btn-link">Copy To ClipBoard</button>
	</div>
	<div class="span11" style="height: 90%">	
		<!-- script 쓰는부분 -->
		<div class = "span5" id="insertlabatory" style="height:90%; border: 1px solid yellow;">
		 	<textarea id="scriptarea" name="scriptarea" name="script" style="width: 100%; height: 96%; resize: none; background-color: #000084; color: yellow; border: 0; display: none;"></textarea>
		 	<!-- codemirror 생성 Script -->
	<script>
		var myCodeMirror = CodeMirror.fromTextArea(document.getElementById("scriptarea"),{
			  value: "cm",
			  mode: {name: "javascript", globalVars: true},
			  lineNumbers: true,
			  theme: "lucario",
			  extraKeys: {"Ctrl-Space": "autocomplete"},	  
		});	
	</script>
		</div>
		
		<div class="span1" style="height:90%;  vertical-align: middle;">
			<br><br><br><br><br><br><br><br><br><br>
			<img src="./image/arrow-pointing-to-right.png">
		</div>		
		
	<!-- 결과출력 부분  -->	
		<div class="span5" id="resultlabatory" style="height:90% ; border: 1px solid yellow;">
			<jsp:include page="./result.jsp"></jsp:include>
		</div>	
	</div>
</div>

<input type="text" id="clipboard" value="" style="position:absolute;top:-9999em;">

<script type="text/javascript">
$("#appendbtn").click(function() {
	var script = myCodeMirror.getValue();	
	
	$("#resultlabatory").load('./result.jsp', script, function() {	
		$("#resultdiv").append(script);
	});	
	alertify.set({ delay: 3000 });
	alertify.success("　Run Success!!");
});
$("#clearbtn").click(function() {	
	$("#resultdiv").empty();	
	alertify.set({ delay: 3000 });
	alertify.success("　Clear Success!!");
});

$("#copybtn").click(function() {
	var script = myCodeMirror.getValue();
	$("#clipboard").val(script);	
	
	$("#clipboard").select();
	
	try { // The important part (copy selected text) 
		var successful = document.execCommand('copy'); 		
		// if(successful) answer.innerHTML = 'Copied!'; 
		// else answer.innerHTML = 'Unable to copy!'; 
		} catch (err) {
			alert('이 브라우저는 지원하지 않습니다.')
		}
		alertify.set({ delay: 3000 });
		alertify.success("　Copy to ClipBoard Success!!");
});
</script>

<script type="text/javascript">
    (function(){
        var url = document.getElementById("resultlabatory").src;            
        var result = encodeURI(decodeURI(url));    
        document.getElementById("resultlabatory").src = result;
    }());
    
    $(".CodeMirror-hints").attr("style","top:0px");
</script>
