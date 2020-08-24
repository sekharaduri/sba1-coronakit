<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.iiht.evaluation.coronokit.model.ProductMaster"%>
<%@page import="java.util.List"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-All Products(user)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>

<%-- Required View Template --%>

<%
		// fetch the shared data
		List<ProductMaster> productMsasterList =  (List<ProductMaster>) request.getAttribute("list");
	%>
	
<!-- <form action="user?action=showkit" method="post"> -->
	<table border="1" width="100%" margin="left" class="table">
		<thead>
			<th>ID</th>
			<th>NAME</th>
			<th>DESCRIPTION</th>
			<th>COST</th>
			<th>COUNT</th>
			<th>ACTION</th>
		</thead>
		<tbody>
			<% for(ProductMaster a : productMsasterList) { %>
			<tr style="height: 10px !important;">
				<td><%=a.getId()%></td>
				<td><%=a.getProductName()%></td>
				<td><%=a.getProductDescription()%></td>
				<td><%=a.getCost()%></td>
				<form id =<%=a.getId()%> action="user?action=showkit&id=<%=a.getId()%>" method="post">
				<td width="20%"><input type="text" name="pcount<%=a.getId()%>"><br><br></td>
				<td width="30%"><input type = "submit" value = "Add Item"/></td>				
								
				</form>				
			</tr>
			<% } %>
		</tbody>
			
	</table>
<!-- </form> -->
	
<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>