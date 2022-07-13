<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.jatin.factory.DateFactory" %>
 <%@ page import="com.jatin.dto.Transactiondto" %>
 <%@ page import="com.jatin.service.TransactionServices" %>
 <%@ page import="java.sql.*"%>
<%@ page import="com.jatin.factory.ConnectionFactory" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Withdraw Amount</title>
</head>
<body>
<%
String username=(String)session.getAttribute("username");
String acno=request.getParameter("acno");
String amount=request.getParameter("amount");
String details=request.getParameter("details");
String conf=request.getParameter("conf");
String type="Debit";
String dt=DateFactory.getdate();
String tno="";
if(conf.equalsIgnoreCase("yes"))
{
try
{  

Connection con=ConnectionFactory.getconnection();
Statement st=con.createStatement();
String acc_no="";
ResultSet rs=st.executeQuery("select nvl(max(transaction_no),0)+1 from transaction");
if(rs.next())
{
tno=rs.getString(1);

}  
}catch(Exception e)
{
	
	e.printStackTrace();
}

Transactiondto td=new Transactiondto(acno);
td.setAmount(amount);
td.setTdate(dt);
td.setTdetails(details);
td.setTtype(type);
td.setEmployee(username);
td.setTno(tno);
TransactionServices ts=new TransactionServices();
Transactiondto td1=ts.withdrawFund(td);
String ac1=td1.getAccno();
String result=td1.getResult();
String amount1=null;
if(result.equalsIgnoreCase("success"))
{
	Connection con=ConnectionFactory.getconnection();
	Statement st=con.createStatement();
	
	ResultSet rs=st.executeQuery("select balance from avalible_balance where accno='"+acno+"'");
	if(rs.next())
	{
	amount1=rs.getString(1);
	}
	out.println("<center><font color=light yellow font size=5>Please Give Customer Amount</font></center><br>");
	out.println("<center><font color=light yellow font size=5>Amount of   Rs:   "+amount+"   Withdrawn successfully..</font></center><br>");
	out.println("<center><font color=light yellow font size=5>From Account No  [   "+ac1+"  ]</font></center><br>");
	out.println("<center><font color=light yellow font size=5>Avalible Balance  [ "+amount1+" ]</font></center><br>");
	out.println("<center><a href=\"withdrawamount.jsp\"><button> Withdraw Again</button></a></center>");
}
if(result.equalsIgnoreCase("failed"))
{
	out.println("<center><font color=light yellow font size=5>Amount of   Rs:   "+amount+"  Withdraw Failed..</font></center><br>");
	out.println("<center><font color=light yellow font size=5>Please Check Account No Or Contact Support</font></center><br>");
	out.println("<center><a href=\"withdrawamount.jsp\"><button> Withdraw Again</button></a></center>");
	
}
if(result.equalsIgnoreCase("Exfailed"))
{
	out.println("<center><font color=light yellow font size=5>Amount of   Rs: "+amount+"  Withdraw Failed Due To Exception..</font></center><br>");
	out.println("<center><font color=light yellow font size=5>Please Check Account Try Again</font></center><br>");
	out.println("<center><a href=\"withdrawamount.jsp\"><button> Withdraw Again</button></a></center>");
	
}
if(result.equalsIgnoreCase("insufficient fund"))
{
	out.println("<center><font color=light yellow font size=5>Amount of   Rs: "+amount+"  Withdraw Failed Due To Insufficient Fund Or Account doesn't exists..</font></center><br>");
	
	out.println("<center><a href=\"withdrawamount.jsp\"><button> Withdraw Again</button></a></center>");
	
}

}else
{
	out.println("<center><font color=light yellow font size=5>Please Confirm YES to Withdraw</font></center><br>");
	out.println("<center><a href=\"withdrawamount.jsp\"><button> Try Again</button></a></center>");
}

%>

</body>
</html>