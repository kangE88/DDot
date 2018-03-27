<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<fmt:requestEncoding value="utf-8"/>
<html>
<title>layouts-tiles</title>

<tiles:insertAttribute name="header"/>

<link rel="stylesheet" type="text/css"  
	href="<%=request.getContextPath() %>/css/style.css"/>

</head>
<body>

<table border="1" width="100%" height="100%">
	<tr>
		<td height="20%" style="background-color: red">
			<tiles:insertAttribute name="header"/>
		</td>
	</tr>
	<tr>
		<td height="75%" style="background-color: yellow">
			<tiles:insertAttribute name="main"/>
		</td>
	</tr>
	<tr>
		<td height="5%" style="background-color: purple">
			<tiles:insertAttribute name="footer"/>
		</td>
	</tr>
</table>

<script type="text/javascript">
$(document).ready(function() {
	$("#content_title_wrap div.title").css("background-image",
							"url('<%=request.getContextPath() %>/image/ico_sub_sb.gif')");	
});

</script>      
</body>
</html>
