<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<%@ page import="java.sql.*"%>
<%@ page import="com.jatin.factory.ConnectionFactory" %>


<html>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>New Account</title>
<body bgcolor=lightyellow text=green>
    
<%
String username=(String)session.getAttribute("username");
if(username==null)
{
	out.println("<font color=blue size=5>You are Not Logged In...</font>");
	%>
	<center><a href="loginnew.html" target="_top"><button>Login Again</button></a></center>
	<%
	
}else
{
  try
       {  
  
 Connection con=ConnectionFactory.getconnection();
 Statement st=con.createStatement();
String acc_no="";
ResultSet rs=st.executeQuery("select nvl(max(Accno),0)+1 from account");
if(rs.next())
{
 acc_no=rs.getString(1);
 session.setAttribute("acc_no",acc_no);
}  
%>
<form method="post" action="createaccount.jsp">
      <center> <h2><u>Account Opening Form </u></h2></center>
      <table align=center>
<tr><td>Account no:</td><td><%=acc_no %></td></tr>
<tr><td>Holder name:</td><td><input required type=text name=accname></td></tr>
<tr><td>Account Type:</td><td><select name=acctype>
  <option value=saving>Saving</option>
  <option value=current>Current</option>
  <option value=loan>Loan</option></select></td></tr>
 
<tr><td>Aadhar No:</td><td><input type=text name=kyc></td></tr>
<tr><td>DOB:</td><td><input type="date" name=dob></td></tr>
<tr><td>S/W of:</td><td><input type=text name=so></td></tr>
<tr><td> Phone no:</td><td><input required type=number name=phone></td></tr>
<tr><td> Address:</td><td><input type=text name=address></td></tr>
<%
   }
   catch(Exception e)
    {
      out.println(e);
   }

%>
<tr><td><input type=submit value="process">
</table>
</form>
<%} %>
</body>
</html>