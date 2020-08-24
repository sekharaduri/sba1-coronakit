<%@ page import="java.time.LocalDateTime"%>

<%-- <h3><%=LocalDateTime.now().toString() %></h3><br>

<h1><%=application.getServletContextName()%> </h1> --%>

<nav class="navbar navbar-default" style="margin: 50px;">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand"><%=LocalDateTime.now().toString() %>   <%=application.getServletContextName()%></a>            
    </div>
    <ul class="nav navbar-nav">
      <li class="active"></li>      
     </ul>
  </div>
</nav>