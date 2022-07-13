<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<%@ page import="com.jatin.factory.ConnectionFactory" %>
<%@ page import="com.jatin.dto.AccountHolder" %>
<%@ page import="com.jatin.service.Services" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Change Password</title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String password=request.getParameter("password");
try
{  

Connection con=ConnectionFactory.getconnection();
Statement st=con.createStatement();
int rowcount=st.executeUpdate("update employee set userpassword='"+password+"' where username='"+username+"'");
if(rowcount==1)
{
	 out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Password Updated Successfully");
	   out.println("</h1>");
	   out.println("</body></html>");
}
else
{
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Password Updated Failed");
	   out.println("</h1>");
	   out.println("<center><a href=\"changepassword.jsp\"><button>Update again</button></a></center>");
	   out.println("</body></html>");
	
}
}catch(Exception e)
{
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Password Updated Failed");
	   out.println("</h1>");
	   out.println("<center><a href=\"changepassword.jsp\"><button>Update again</button></a></center>");
	   out.println("</body></html>");
	e.printStackTrace();
}


%>

</body>
</html>