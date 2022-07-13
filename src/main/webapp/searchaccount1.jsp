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
<title>Customer Details</title>
</head>
<body>
<% 
String acno=request.getParameter("acno");
Services sr=new Services();
AccountHolder ah=sr.ViewDetails(acno);
if(ah==null)
{
	 out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Account Does Not Exists");
	   out.println("</h1><br>");
	   out.println("<center><a href=\"searchaccount.jsp\"><button>Search Again</button></a></center>");
	   out.println("</body></html>");
}else
{
	   String accno=ah.getAcc_no();
	   String holder=ah.getAcc_holder();
	   String type=ah.getAcc_type();
	   String kyc=ah.getKyc();
	   String dob=ah.getDob();
	   String so=ah.getSon_of();
	   String address=ah.getAddress();
	   String phone=ah.getPhone();
	   session.setAttribute("accno",accno);
	 
	   out.println("<html><body><center><h1><u>Account Details</u></h1><center>");
	   out.println("<table align=center>");
	   out.println("<tr><td>Account no:</td><td>"+accno);
	   out.println("<tr><td>Holder Name:</td><td>"+holder);
	   out.println("<tr><td>Account Type:</td><td>"+type);
	   out.println("<tr><td>Aadhar no:</td><td>"+kyc);
	   out.println("<tr><td>DOB:</td><td>"+dob);
	   out.println("<tr><td>C/O:</td><td>"+so);
	   out.println("<tr><td>Contact No:</td><td>"+phone);
	   out.println("<tr><td>Address:</td><td>"+address);
	   out.println("</table><br><br>");
	   out.println("<center><a href=\"searchaccount.jsp\"><button>Search Another</button></a></center><br>");
	   out.println("<center><a href=\"updateaccount1.jsp\"><button>Update These Details</button></a></center>");
	   out.println("</body></html>");
}
%>
</body>
</html>