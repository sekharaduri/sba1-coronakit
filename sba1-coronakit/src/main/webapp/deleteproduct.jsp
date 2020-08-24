<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Delete Product(Admin)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>

<%-- Required View Template --%>
<h1>The product <% request.getAttribute("delete");%>has been deleted</h1>

<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>