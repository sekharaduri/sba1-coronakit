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
<title>Corona Kit-My Kit(user)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<%
	ServletContext app=request.getSession().getServletContext();

		// fetch the shared data
		List<KitDetail> kitDetailList = (List<KitDetail>) app.getAttribute("addedproductList");
	int totalCost = 0;
%>
	
<%-- Required View Template --%>
<h1>Kit Details - In progress<h1><br>

<a href="placeorder.jsp"><button>Add to cart</button></a><br><br>
	
	<table border=1"" width="50%" class="table">
		<thead>
			
			<th>PRODUCT ID</th>
			<th>COST</th>
			<th>COUNT</th>
		
		</thead>
		<tbody>
		<% for(KitDetail kit : kitDetailList) { %>
		
			<tr>
			<% totalCost+=kit.getAmount()*kit.getQuantity();%>
				<td><%=kit.getProductId()%></td>
				<td><%=kit.getAmount()%></td>
				<td><%=kit.getQuantity()%></td>
			</tr>
			
			<% } %>
		</tbody>
	</table>
	<br>
	<label>The total order value:<%= totalCost%></label>
	<br>
	<br>
<!-- <a href="showproductstoadd.jsp"><button>BACKTOSHOPPING</button></a> -->
<form method="post" action="user?action=showproducts">

    <button type="submit">BACK TO SHOPPING</button>
    
</form>
<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>