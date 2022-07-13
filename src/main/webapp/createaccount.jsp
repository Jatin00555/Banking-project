<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ page import="java.sql.*"%>
<%@ page import="com.jatin.factory.ConnectionFactory" %>
<%@ page import="com.jatin.dto.AccountHolder" %>
<%@ page import="com.jatin.service.Services" %>
<html>
<body>
<%
   
   String accno=(String)session.getAttribute("acc_no");
   String holder=request.getParameter("accname");
   String type=request.getParameter("acctype");
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
   ah.setAcc_type(type);
   
   String result="";
   Services sr=new Services();
   result=sr.CreateAccount(ah);
   
   if(result.equalsIgnoreCase("success"))
   {
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("Account Opened Successfully");
	   out.println("</h1>");
	   out.println("<center><a href=\"addaccount.jsp\"><button>Open Another Account</button></a></center>");
	   out.println("</body></html>");
   }
   else
   {
	   out.println("<html><body>");
	   out.println("<h1 align=center color=red>");
	   out.println("SORRY ! Can't open Account");
	   out.println("</h1>");
	   out.println("<center><a href=\"addaccount.jsp\"><button>Open Another Account</button></a></center>");
	   out.println("</body></html>");
   }
 
 
 
 %>
   
    
    
    
</body>
</html>