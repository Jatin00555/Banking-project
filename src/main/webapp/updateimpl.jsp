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
String accno=(String)session.getAttribute("accno");
String holder=request.getParameter("accname");
String kyc=request.getParameter("kyc");
String dob=request.getParameter("dob");
String so=request.getParameter("so");
String address=request.getParameter("address");
String phone=request.getParameter("phone");

AccountHolder ah=new AccountHolder(holder,accno);
ah.setKyc(kyc);
ah.setAddress(address);
ah.setDob(dob);
ah.setPhone(phone);
ah.setSon_of(so);
Services sr=new Services();
String result=sr.UpdateDetails(ah);
if(result.equalsIgnoreCase("success"))
{
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Account Updated Successfully");
	   out.println("</h1>");
	   out.println("<center><a href=\"addaccount.jsp\"><button>Open Another Account</button></a></center><br>");
	   out.println("<center><a href=\"searchaccount.jsp\"><button>Search Another Account</button></a></center>");
	   out.println("</body></html>");
}
else
{
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("SORRY ! Can't Update Account");
	   out.println("</h1>");
	   out.println("<center><a href=\"searchaccount.html\"><button>Search Another Account</button></a></center>");
	   out.println("</body></html>");
}

%>
</body>
</html>