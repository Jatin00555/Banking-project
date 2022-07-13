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
<title>Close Account</title>
</head>
<body>
<%
   String result="";
   String acno=request.getParameter("acno");
   String value=request.getParameter("conf"); 
   System.out.println(value);
  if(value.equalsIgnoreCase("yes"))
  {
   Services sr=new Services();
   result=sr.DeleteAccount(acno);
   
   if(result.equalsIgnoreCase("success"))
   {
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Account Closed Successfully");
	   out.println("</h1>");
	  
	   out.println("</body></html>");
   }
   else
   {
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("SORRY ! Can't Close Account");
	   out.println("</h1>");
	   out.println("<center><a href=\"closeaccount.jsp\"><button>Try Again</button></a></center>");
	   out.println("</body></html>");
   }
  }else
  {
	  out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Please ConFrom YES..");
	   out.println("</h1>");
	   out.println("<center><a href=\"closeaccount.jsp\"><button>Try Again</button></a></center>");
	   out.println("</body></html>");
  }
 
 
 
 %>

</body>
</html>