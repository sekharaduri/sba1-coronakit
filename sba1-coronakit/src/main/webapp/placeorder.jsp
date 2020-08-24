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
<title>Corona Kit-Place Order(user)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>

<%-- Required View Template --%>
<form action="user?action=ordersummary" method="post">
<%
	ServletContext app=request.getSession().getServletContext();

		// fetch the shared data
		List<KitDetail> kitDetails =  (List<KitDetail>) app.getAttribute("addedproductList");
		
	int totalCost = 0;
%>
	
<%-- Required View Template --%>
<h1>Kit Details - In progress<h1><br>

<a href="placeorder.jsp"><button>Add to cart</button></a><br>
	
	<table border="1" width="50%" class="table">
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
<label>The total order value:<%= totalCost%></label>
<br>
<label>Address:</label>
<textarea rows="5" id="address" name="address"></textarea>

  <input type="submit" value="Place Order" />

</form>
</hr>
	<jsp:include page="footer.jsp"/>	

</body>
</html>