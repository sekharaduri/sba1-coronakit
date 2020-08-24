<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-Add New Product(Admin)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>

<%-- Required View Template --%>
<form action="admin?action=insertproduct" method="post"">
  
  <label for="pname">Name</label>
  <input type="text" id="pname" name="pname"><br><br>
  <label for="pdesc">Description</label>
  <input type="text" id="pdesc" name="pdesc"><br><br>
  <label for="cost">Cost</label>
  <input type="text" id="cost" name="cost"><br><br>
  <input type="submit" value="Submit">
</form>

<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>