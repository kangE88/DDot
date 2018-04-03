<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
  <script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
  <script src="kakao.js"></script>
  <style>
   table{
    width : 500px;
/*     border:  double black 1px; */
   }
   td{
    border:  solid black 1px;
   }
  </style>
  </head>
  <body>
    <a id="kakao-login-btn"></a>
 <table>
 <tr>
  <td>
   <input id="btn" type="button" value ="이름,프로필사진" >
  </td>
  <td>
   <input id="btnLogout" type="button" value ="로그아웃" >
  </td>
  <td>
   <input id="btnStatus" type="button" value ="접속상태" >
  </td>
 </tr> 
 </table>
 <table>
 <col width="20%">
 <col width="80%">
 <tr>
  <td> 이름 </td>
  <td id="tdName"> </td>
 </tr>
 <tr>
  <td> 프로필사진 </td>
  <td><img  id="tdProfileImg" > </td>
 </tr>
 </table>
  </body>
</html>

<script>

//GET/POST /v1/user/me HTTP/1.1
//Host: kapi.kakao.com
//Authorization: Bearer {access_token}
//Content-type: application/x-www-form-urlencoded;charset=utf-8
var Kakao ;
$(document).ready(function(){
 console.log("ready");
 Kakao.init('08f9fff5a73551ee70534d1210f73132');
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
      
//      var refreshToken = Kakao.Auth.getRefreshToken();
//      console.log("*****************");
//      console.log(refreshToken);
//      Kakao.Auth.setAccessToken(refreshToken , true);
//      console.log("*****************");
  }});
     //서버 측에서 새로 발급받은 Access Token을 Javascript SDK에 설정합니다.
 var refreshToken = Kakao.Auth.getRefreshToken();
 var getAppKey = Kakao.Auth.getAppKey();
 var getAccessToken=  Kakao.Auth.getAccessToken();
 console.log("=============refreshToKen==============");
    console.log(refreshToken);
    console.log("=============refreshToKen==============");
    console.log("=============getAppKey==============");
    console.log(getAppKey);
    console.log("=============getAppKey==============");
    console.log("=============getAccessToken==============");
    console.log(getAccessToken);
    console.log("=============getAccessToken==============");
   
    //Kakao.Auth.setAccessToken(refreshToken , true);
    //var getAccessToken=  Kakao.Auth.getAccessToken();
    //console.log(getAccessToken);
 $("#btn").on("click", function(){
  aaa();
 });
 
 $("#btnStatus").on("click", function(){
  Kakao.Auth.getStatus(function(statusObj){
   if(statusObj =="connected"){
    console.log(statusObj);
   }else{
    console.log(statusObj);
   }
  });
 });
 
 $("#btnLogout").on("click", function(){
  Kakao.Auth.logout(function(result){
   if(result == true){
    alert("로그아웃성공");
    
   }else{
    alert("로그아웃시도중 오류발생!!");
   }
  });
 });
 function aaa(){
  var settings = {
   url : "/v1/user/me",
 //호출할 API URL
   
 //API에 전달할 파라미터
   success : function(resultObj){
      var result = resultObj;
   //var result = JSON.stringify(resultObj);
   var tdName  = result.properties.nickname;
   var tdProfileImg = result.properties.thumbnail_image;
   $("#tdName").text(tdName);
   $("#tdProfileImg").attr("src", tdProfileImg); 
   },
 //API 호출이 성공할 경우 결과를 받을 콜백 함수
   fail : function(errorObj){
    alert("실패" +errorObj );
    console.log(errorObj);
   },
 //API 호출이 실패할 경우 결과를 받을 콜백 함수
   always : function(obj){
    //alert("항상" +obj);
    //console.log(obj);
   },
 //     API 호출이 성공하거나 실패할 경우 항상 호출할 콜백 함
  };
  Kakao.API.request(settings);
 }

 
});
</script>