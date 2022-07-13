package com.jatin.functions;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jatin.service.loginaction;


@WebServlet("/login")
public class loginservlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		String uname=request.getParameter("username");
		String upwd=request.getParameter("userpassword");
		loginaction log=new loginaction();
		String status=log.checklogin(uname, upwd);
		HttpSession session=request.getSession();
		if(status.equalsIgnoreCase("success"))
		{
			session.setAttribute("username",uname);
			response.sendRedirect("index.jsp");
			out.println("success");
		}
		else
		{
			out.println("<html><body>");
			   out.println("<h1 align=center color=red>");
			   out.println("Login Failed <br>User name Or Password Invalid");
			   out.println("</h1>");
			   out.println("<center><a href=\"loginnew.html\"><button>Try Login Again</button></a></center>");
			   out.println("</body></html>");
		}
	}

}
