<%@page import="com.DDot.model.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<tiles:insertAttribute name="header"/>

</head>

<script type="text/javascript">

//level get
$(window).on('load', function(){
	var level = g_level('${mem.point}');
	var point = ${mem.point};
	
	var exp_persent = g_percent(level, point);
	
	var profileImg = "/img/${mem.id}/${mem.pic}";

	//$('.level').html(level);
	//level img set
	$('.levelImg').attr("src","<%=request.getContextPath()%>/image/level/lv"+level+".gif");
	$('#profile').attr('src', profileImg);
	//exp_persent
	console.log("exp==>"+exp_persent);
	//$('.expPersentBar').html("exp: "+exp_persent);
	
	if(exp_persent > 100){
		console.log("exp!");
		exp_persent = 100;
	}

	$('.bar').prop("style", 'width: '+exp_persent+'%');
	$('.expPercent').text(exp_persent+'%');

});

/* img thumnail event */
$(function() {
    $("#picFile").on('change', function(){
        readURL(this);
    });
});

function readURL(input) {
    if (input.files && input.files[0]) {
    var reader = new FileReader();

    reader.onload = function (e) {
            $('#profile').attr('src', e.target.result);
        }
      reader.readAsDataURL(input.files[0]);
    }
}
</script>
<body>
<div class="row-fluid">
	<div class="page-header span12" style="margin-top:0; height:60px; margin-bottom: 5px;">
		<p class="span1">Lv:</p><img class="levelImg span1" style="margin-left:0; width:30px; height:20px;">
		<span class="span3">Point : ${mem.getPoint()  } pt</span>
		<p class="span1">Exp:</p>
		<div class="progress progress-striped active span6" style="margin-left:0;">
		  		<div class="bar"></div>
		</div>
		<p class="expPercent span1" style="margin-left:3px;"></p>
	</div>
	<div class="row-fluid">
    		<table class="table span5">
    		<colgroup>
    			<col width="300px;">
    			<col width="300px;">
    		</colgroup>
    			<tbody class="span12">
    				<tr style="width:290px; height:191px;">
    					<td>
    						<img id="profile" style="width: 291px; height: 170px;">
    					</td>
    				</tr>
    			</tbody>
    		</table>
            <table class="table span7" style=" text-align:center; margin-bottom:5%;margin-left: 0;">
              <tbody>
              <colgroup>
				  <col width="50%">
				  <col width="50%">
			  </colgroup>
                <tr>
                  	<td style="vertical-align: middle; text-align:right;">아이디 :</td>
                  	<td><input type="text" id="id" name="id" class="span12" style="margin:auto; height:30px;" readonly="readonly" value="${mem.id }"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle; text-align:right;">닉네임 :</td>
                  	<td><input type="text" id="nickname" name="nickname" class="span12" style="margin:auto; height:30px;" readonly="readonly" value="${mem.nickname }">
                  		<!-- <input type="hidden" id="nicResult"> --></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle; text-align:right;">e-mail :</td>
                  	<td><input type="email" name="email" class="span12" style="margin:auto; height:30px;" readonly="readonly" value="${mem.email }"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle; text-align:right;">자기 소개 :</td>
					<td><textarea rows="3" class="span12" name="intro" readonly="readonly" >${mem.intro }</textarea></td>
                </tr>
                <tr>
                	<td colspan="2" style="text-align:right;">
                		<a href="#" class="btn" style="margin:auto;" onclick="window.close();">닫기</a>
                		<c:if test="${not empty login}">
	                		<c:if test="${login.nickname ne mem.nickname}">
	                			<a href="#" class="btn" style="margin:auto;" onclick="directWriteMessage();">쪽지</a>
	                		</c:if>
                		</c:if>
                	</td>
                </tr>
              </tbody>
            </table>
 		</form><!-- /container -->
	</div>
</div>
</body>
<script type="text/javascript">

function directWriteMessage(){
	window.open("messagewrite.do?replyname=${mem.nickname}",'쪽지함','toolbar=no,location=no,status=no,menubar=no,scrollbars=auto,resizable=yes,directories=no,width=1000px,height=550px,top=100,left=500');
}


</script>
</html>