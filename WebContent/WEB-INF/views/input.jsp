﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<!-- 애니메이션 끄는부분 시작 -->

<script type="text/javascript">
	_386 = {fastLoad: true};
</script>

<!-- 애니메이션 끄는부분 끝 -->

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h4>Hello! Final Project</h4>
<br>


<table class="table table-hover">
<thead>
<tr>
	<th>Header1</th>
	<th>Header2</th>
	<th>Header3</th>
	<th>Header4</th>
</tr>
</thead>
<tbody>
<tr>
	<td>Testing1</td>
	<td>Testing1-1</td>
	<td>Testing1-2</td>
	<td>Testing1-3</td>
</tr>
<tr>
	<td>Testing2</td>
	<td>Testing2-1</td>
	<td>Testing2-2</td>
	<td>Testing2-3</td>
</tr>
<tr>
	<td>Testing3</td>
	<td>Testing3-1</td>
	<td>Testing3-2</td>
	<td>Testing3-3</td>
</tr>
</tbody>
</table>
<br><br><br>
<div class="control-group warning">
  <label class="control-label" for="inputWarning">Input with warning</label>
  <div class="controls">
    <input type="text" id="inputWarning">
    <span class="help-inline">Something may have gone wrong</span>
  </div>
</div>
 
<div class="control-group error">
  <label class="control-label" for="inputError">Input with error</label>
  <div class="controls">
    <input type="text" id="inputError">
    <span class="help-inline">Please correct the error</span>
  </div>
</div>
 
<div class="control-group info">
  <label class="control-label" for="inputInfo">Input with info</label>
  <div class="controls">
    <input type="text" id="inputInfo">
    <span class="help-inline">Username is already taken</span>
  </div>
</div>
 
<div class="control-group success">
  <label class="control-label" for="inputSuccess">Input with success</label>
  <div class="controls">
    <input type="text" id="inputSuccess">
    <span class="help-inline">Woohoo!</span>
  </div>
</div>

<!-- Button to trigger modal -->
<button type="button" data-toggle="modal" data-target="#myModal">Launch modal</button>
 
<!-- Modal -->
<div id="myModal" class="modal hide fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
    <h3 id="myModalLabel">Modal header</h3>
  </div>
  <div class="modal-body">
    <p>One fine body…</p>
  </div>
<div class="modal-footer">	
	<button class="btn btn-danger" data-dismiss="modal">Close</button>
</div>
</div>



<br><br><br>

<div class="alert">
  <button type="button" class="close" data-dismiss="alert">&times;</button>
  <strong>Warning!</strong> Best check yo self, you're not looking too good.
</div>

<br>


<textarea id="testcode" style="width: 500px; height: 150px"></textarea>

<button class="testinputbtn">Click Me! Append Code</button>
<button class="testclearbtn">Click Me! Empty Code</button>

<div style="width: 500px; height: 500px;" id="testbody">

</div>

<script type="text/javascript">
$(".testinputbtn").click(function() {
	
	var testsource = $("#testcode").val();
	alert(testsource);
	
	$("#testbody").append(testsource);

});
$(".testclearbtn").click(function() {
	$("#testbody").empty();
});
</script>



</body>
</html>