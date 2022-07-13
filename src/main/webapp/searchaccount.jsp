<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Customer Search</title>
</head>
<body>
 
 <%
String username=(String)session.getAttribute("username");
if(username==null)
{
	out.println("<font color=blue size=5>You are Not Logged In...</font>");
	%>
	<center><a href="loginnew.html" target="_top"><button>Login Again</button></a></center>
	<%
	
}else{
%><form method="post" action="searchaccount1.jsp">
      <center> <h2><u>Customer Search</u></h2></center>
      <table align=center>
     
      <tr><td>Enter Ac No:</td><td><input required type=number name=acno></td></tr>
      <tr><td><input type=submit value="Search">
</table>
</form>

<% } %>

</body>
</html>