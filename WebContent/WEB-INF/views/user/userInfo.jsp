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
<%
MemberDto mem = (MemberDto)session.getAttribute("login");
%>

//level get
$(window).on('load', function(){
	var level = g_level('${login.point}');
	var point = ${login.point};
	
	var exp_persent = g_percent(level, point);
	
	var profileImg = "/img/${login.id}/${login.pic}";

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

</script>
<body>
<div class="row-fluid">
	<div class="page-header span12" style="margin-top:0; height:60px; margin-bottom: 5px;">
		<p class="span1">Lv:</p><img class="levelImg span1" style="margin-left:0; width:30px; height:20px;">
		<span class="span3"></span>
		<p class="span1">Exp:</p>
		<div class="progress progress-striped active span6" style="margin-left:0;">
		  		<div class="bar"></div>
		</div>
		<p class="expPercent span1" style="margin-left:3px;"></p>
	</div>
	<div class="row-fluid">
	<form class="form-signin" method="post" enctype="multipart/form-data" style="height:100%;">
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
    				<tr class="span11" style="margin-left:0;">   
    					<td>
    						<input name="picFile" id="pic" type="file" style="width:280px; height:30px;">
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
                  	<td style="vertical-align: middle;">아이디 :</td>
                  	<td><input type="text" id="_id" name="id" class="span12" style="ime-mode: disabled; margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">비밀번호 :</td>
                  	<td colspan="2"><input type="password" name="pwd" class="span12" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">닉네임 :</td>
                  	<td><input type="text" name="nickname" class="span12" style="margin:auto; height:30px;"></td>
                </tr>
                <tr>
                  	<td style="vertical-align: middle;">e-mail :</td>
                  	<td><input type="email" name="email" class="span12" style="margin:auto; height:30px;"></td>
                </tr>
<!--                 <tr>
                  	<td style="vertical-align: middle;">프로필 이미지 :</td>
                  	<td>
             			<input name="picFile" id="pic" type="file">
                  		<img id="profile" onclick="document.all.pic.click();" alt="" alt="260x120" style="width: 200px; height: 150px;">
                  	</td>
                </tr> -->
                <tr>
                  	<td style="vertical-align: middle;">자기 소개 :</td>
					<td><textarea rows="3" class="span12" placeholder="intro" name="intro"></textarea></td>
                </tr>
                <tr>
                	<td colspan="2" style="text-align:right;">
                		<a href="#" class="btn" style="margin:auto;" onclick="window.close();">닫기</a>
                		<a href="#" class="btn" id="_btnRegi" style="margin:auto;">수정</a>
                	</td>
                </tr>
              </tbody>
            </table>
 		</form><!-- /container -->
	
	
<!-- 		<div class="span4">
			<img id=profile class="span4">
		</div>
		<div class="span8">
			 -->
		</div>
	</div>

</body>
</html>