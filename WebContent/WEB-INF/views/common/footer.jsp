<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<footer style="background-color: #000084 ">
  <div class="container-col-md-12">
    <table class="table table-condensed">		
		<col width="70%"><col width="30%">
		<tr>
		<td>
			Commnad Line : <input type="text" style="width: 70%; background-color: black; color: white" id="cmd" placeholder="command를 입력하세요">
			</td>
		<td align="right" style="vertical-align: middle; text-align: right;">
			<p id="copyright-content" style="margin:0 5 0 0;">Copyright By DevDot Since 2018</p>
			<div class="toggler">
				<div id="effect" class="ui-widget-content ui-corner-all">
				<p id="effect-content" style="margin:0 5 0 0;"></p>
				</div>
			</div>
		</td>
		</tr>	
	</table>
   </div>
	 
</footer>
<script>
$("#effect").hide();
$(document).ready(function () {
	var nickname = "${login.nickname}";
	if (nickname!="") {
		var messagecount = <%=(Integer)request.getSession().getAttribute("messagecount")%>
		setInterval(function(){ 
		
		$.ajax({
			 type:"POST"
			 ,url:"checkmessage.do" //세션 생성페이지 (setAttribute...)
			 ,data:{"nickname" : nickname}
			 ,success:function(newcount){
			 	if (messagecount < newcount) {
			 		$("#copyright-content").hide();
					$("#effect-content").html("확인하지 않은 쪽지가 "+newcount+"건 있습니다.");
					runEffect();
					setTimeout(function(){runEffect()}, 4000);
					setTimeout(function(){$("#copyright-content").show();}, 4500);
					messagecount = newcount;
				}
			 },
			 error: function(xhr, status, error) {
			 }  
		}); 
		}, 5000);
	}
});

/* $(function() {
	// run the currently selected effect */
	function runEffect() {
		// get effect type from
		var selectedEffect = 'slide';

		// Most effect types need no options passed by default
		var options = {};
		// some effects have required parameters
		if (selectedEffect === "scale") {
			options = {
				percent : 50
			};
		} else if (selectedEffect === "size") {
			options = {
				to : {
					width : 400,
					height : 20
				}
			};
		}

		// Run the effect
		$("#effect").toggle(selectedEffect, {
			direction : 'right',
			mode : 'show'
		}, 500);
	};

	// Set effect from select menu value
/* 	$("#usersBtn").on("click", function() {
		runEffect();
	});
}); */
  
</script>