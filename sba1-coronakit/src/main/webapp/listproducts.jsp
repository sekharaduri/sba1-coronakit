<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="com.iiht.evaluation.coronokit.model.ProductMaster"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-All Products(Admin)</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<h1>List of products<h1>
<a href="newproduct.jsp">Add Item</a><br/>

<%
		// fetch the shared data
		List<ProductMaster> productMsasterList =  (List<ProductMaster>) request.getAttribute("list");
	%>
	<table border="1" style="margin:5%" class="table">
		<thead>
			<th>ID</th>
			<th>NAME</th>
			<th>DESCRIPTION</th>
			<th>COST</th>
			<th colspan="2">Action</th>
		</thead>
		<tbody>
			<% for(ProductMaster a : productMsasterList) { %>
			<tr>
				<td><%=a.getId()%></td>
				<td><%=a.getProductName()%></td>
				<td><%=a.getProductDescription()%></td>
				<td><%=a.getCost()%></td>
				<td><a href="admin?action=editproduct&id=<%=a.getId()%>&name=<%=a.getProductName()%>&description=<%=a.getProductDescription()%>&cost=<%=a.getCost()%>"><button>Edit</button></a></td>
				<td><a href="admin?action=deleteproduct&id=<%=a.getId()%>"><button>Delete</button></a></td>
			</tr>
			<% } %>
		</tbody>
	</table>

<jsp:include page="footer.jsp"/>
</body>
</html>