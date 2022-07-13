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
<title>Update Details</title>
</head>
<body>
<% 
String acno=request.getParameter("acno");
String accno=(String)session.getAttribute("accno");
String realacno;
if(acno==null)
{
	realacno=accno;
}else
{
	realacno=acno;
}
Services sr=new Services();
AccountHolder ah=sr.ViewDetails(realacno);
if(ah==null)
{
	 out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Account Does Not Exists");
	   out.println("</h1><br>");
	   out.println("<center><a href=\"updateaccount.jsp\"><button>Search Again</button></a></center>");
	   out.println("</body></html>");
}else
{
	   String accno1=ah.getAcc_no();
	   String holder=ah.getAcc_holder();
	   String type=ah.getAcc_type();
	   String kyc=ah.getKyc();
	   String dob=ah.getDob();
	   String so=ah.getSon_of();
	   String address=ah.getAddress();
	   String phone=ah.getPhone();
	   session.setAttribute("accno",accno1);
%>
<form method="post" action="updateimpl.jsp">
<center> <h2><u>Account Update Form </u></h2></center>
<table align=center>
<tr><td>Account no:</td><td><%=accno1 %></td></tr>
<tr><td>Holder name:</td><td><input required type=text   value=<%=holder%>  name=accname></td></tr>
<tr><td>Account Type:</td><td><td><%=type %></td>
<tr><td>Aadhar No:</td><td><input type=text  value=<%=kyc%> name=kyc></td></tr>
<tr><td>DOB:</td><td><input type="date"   value=<%=dob%> name=dob></td></tr>
<tr><td>S/W of:</td><td><input type=text value=<%=so%> name=so></td></tr>
<tr><td> Phone no:</td><td><input required type=number value=<%=phone%> name=phone></td></tr>
<tr><td> Address:</td><td><input type=text value=<%=address%> name=address></td></tr>
<tr><td><center><input  type=submit value="Update Details"></center>
</table>
</form>
<%
}
%>
</body>
</html>