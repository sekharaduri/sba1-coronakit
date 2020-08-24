<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Corona Kit-New User(user)</title>
</head>
<body>
<jsp:include page="header.jsp"/>
<hr/>

<%-- Required View Template --%>

<form action="user?action=showproducts" method="post">
  <label for="pname">User Name</label>
  <input type="text" id="pname" name="pname"><br><br>
  <label for="pemail">Email Id</label>
  <input type="text" id="pemail" name="pemail"><br><br>
  <label for="pcontact">Contact No</label>
  <input type="text" id="pcontact" name="pcontact"><br><br>
  <input type="submit" value="Submit">
</form>
<hr/>	
	<jsp:include page="footer.jsp"/>
</body>
</html>