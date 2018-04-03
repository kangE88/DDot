<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<title>DevDot</title>
<head>
	<tiles:insertAttribute name="header"/>
</head>

<body> 

<!-- Main ================================== -->
	<div class="row-fluid" style="height:100%;">
		<tiles:insertAttribute name="main" />
	</div>


</body>



</html>