<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Amount Deposite</title>
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
%>
 <form method="post" action="depositeamount1.jsp">
      <center> <h2><u>Amount Deposite</u></h2></center>
      <center> <h1><u>Please Collect Amount Before Proceding... </u></h1></center>
      <table align=center>
      <tr><td>Enter Ac No:</td><td><input required type=number name=acno></td></tr>
      <tr><td>Enter Amount:</td><td><input required type=number name=amount></td></tr>
       <tr><td>Enter Details:</td><td><input required type=text name=details></td></tr>
      <tr><td><input type=submit value="Deposite">
</table>
</form>

<% 
session.setAttribute("username",username);
} %>

</body>
</html>