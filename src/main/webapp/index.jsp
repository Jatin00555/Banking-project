<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Frameset//EN" "http://www.w3.org/TR/html4/frameset.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome</title>
</head>

<%
String username=(String)session.getAttribute("username");
session.setAttribute("username",username);
%>
<frameset rows="15%,75%,10%">
<frame src="header.html">
<frameset cols="10%,90%">
<frame src="menu.html">
<frame src="welcome.jsp" name="body">
</frameset>
<frame src="footer.html">
    
</frameset>

</html>