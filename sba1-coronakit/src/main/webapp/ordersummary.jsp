<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@page import="java.lang.String"%>
<%@page import="com.iiht.evaluation.coronokit.model.KitDetail"%>
<%@page import="java.util.List"%>
<%@page import="javax.servlet.ServletContext"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Order Summary(user)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>
<%
	ServletContext app=request.getSession().getServletContext();

	// fetch the shared data
	List<KitDetail> kitDetails =  (List<KitDetail>) app.getAttribute("addedproductList");
	String address = app.getAttribute("address").toString();
		
	int totalCost = 0;
%>
<%-- Required View Template --%>
<table border="1" width="100%" class="table">
		<thead>
			
			<th>PRODUCT ID</th>
			<th>COST</th>
			<th>COUNT</th>
		
		</thead>
		<tbody>
		<% for(KitDetail kit : kitDetails) { %>
		
			<tr>
			<% totalCost+=kit.getAmount()*kit.getQuantity();%>
				<td><%=kit.getProductId()%></td>
				<td><%=kit.getAmount()%></td>
				<td><%=kit.getQuantity()%></td>
			</tr>
			
			<% } %>
		</tbody>
	</table>
	
	<label>The total order value:<%= totalCost%></label><br/>
	<label>Address:<%=address %></label>
	
	
<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>