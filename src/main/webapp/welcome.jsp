<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body bgcolor="cyan">
<br>
<%
    String username=(String)session.getAttribute("username");
    session.setAttribute("username",username);
    if(username==null)
    {
    	out.println("<font color=blue size=5>You are Not Logged In...</font>");
 %>	
 <center><a href="loginnew.html" target="_top"><button>Login Again</button></a></center>
    <% 
    }else
    {
    out.println("<font color=blue size=5>Hello!   "+username+", Have a Good Day</font>");
    }   %><br><br><br><br><br>
<h1 align="center" style="color:red;">
<marquee>Welcome to X Bank</marquee>
</h1>

</body>
</html>