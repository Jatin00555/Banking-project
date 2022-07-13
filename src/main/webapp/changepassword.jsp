<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body bgcolor=cyan text=green>
<%
String username=(String)session.getAttribute("username");
session.setAttribute("username", username);
if(username==null)
{
	out.println("<font color=blue size=5>You are Not Logged In...</font>");
	%>
	<center><a href="loginnew.html" target="_top"><button>Login Again</button></a></center>
	<%
	
}else{
%>

<form method="post" action="changepassword1.jsp">
<center><table bgcolor=yellow>
<tr><td>User Name:</td><td><%=username %></td></tr>
<tr><td>New Password:</td><td><input required type=text name=password></td></tr>
<tr><td><input bgcolor=red type=submit value="Update Password">
</table>
</center>
</form>
<%} %>

</body>
</html>