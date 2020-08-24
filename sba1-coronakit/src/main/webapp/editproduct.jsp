<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.lang.String"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Edit Product(Admin)</title>
</head>s
<body>
<jsp:include page="header.jsp"/>
<hr/>

<%-- Required View Template --%>
<% String editproductId = (String) request.getAttribute("id").toString(); %>
<% String editproductname = (String) request.getAttribute("name").toString(); %>
<% String editproductDescription = (String) request.getAttribute("description").toString(); %>
<% String editproducCost = (String) request.getAttribute("cost").toString(); %>

<h2>Edit Product <%=editproductId %></h2>
<form action="admin?action=updateproduct&editproductId=<%=editproductId %>" method="post">
  <!-- <label for="epid">Edit Product <%=editproductId %>></label> -->
  <!-- <input type="text" id="epid" name="fname"><br><br> -->
  <label for="epname">Name</label>
  <input type="text" id="epname" name="epname" value="<%=editproductname%>"><br><br>
  <label for="epdesc">Description</label>
  <input type="text" id="epdesc" name="epdesc" value="<%=editproductDescription%>"><br><br>
  <label for="ecost">Cost</label>
  <input type="text" id="ecost" name="ecost" value="<%=editproducCost%>"><br><br>
  <input type="submit" value="Submit">
</form>
<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>