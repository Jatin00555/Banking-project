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
<title>Account Statement</title>
</head>
<body bgcolor=lightyellow text=black>
<%
String acno=request.getParameter("acno");
Connection con;
try{
	con=ConnectionFactory.getconnection();
	Statement st=con.createStatement();
	ResultSet rs=st.executeQuery("select balance from avalible_balance where accno='"+acno+"'");
	if(rs.next())
	{
		double bal=rs.getDouble(1);
		try{
			
			Statement st1=con.createStatement();
			ResultSet rs1=st.executeQuery("select * from transaction where accno='"+acno+"'");
			out.println("<center><font color=light yellow font size=5>Avalible Balance : "+bal+"</font></center><br>");
%>
<table  align=center cellspacing=0 cellpadding=5 bordercolor=green border=1>
<tr><th>Transaction no</th><th>Date</th><th>Details</th><th>Transaction Type</th><th>Amount</th></tr>
<% 
			while(rs1.next())
			{
%>
				<tr><td><%=rs1.getString(1)%></td><td><%=rs1.getString(5)%></td><td><%=rs1.getString(6)%></td><td><%=rs1.getString(2)%></td><td><%=rs1.getString(3)%></td></tr>
<%
			}
       
			
		}catch(Exception e)
		{
			out.println("<center><font color=light yellow font size=5>Can't Show Due to Exception</font></center><br>");
			out.println("<center><font color=light yellow font size=5>Please Try Again Or contact Support</font></center><br>");
			out.println("<center><a href=\"showtransaction.jsp\"><button> TRY Again</button></a></center>");
			
		}
		 out.println("<center><a href=\"showtransaction.jsp\"><button> View Another</button></a></center>");
	}else
	{
		out.println("<center><font color=light yellow font size=5>Nothing TO show</font></center><br>");
		out.println("<center><a href=\"showtransaction.jsp\"><button> TRY Again</button></a></center>");
	}
	
	
}catch(Exception e)
{
	out.println("<center><font color=light yellow font size=5>Can't Show Due to Exception</font></center><br>");
	out.println("<center><font color=light yellow font size=5>Please Try Again Or contact Support</font></center><br>");
	out.println("<center><a href=\"showtransaction.jsp\"><button> TRY Again</button></a></center>");
	
}
%>


</body>
</html>