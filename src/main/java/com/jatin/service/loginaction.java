package com.jatin.service;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jatin.factory.ConnectionFactory;

public class loginaction 
{
	public String checklogin(String name,String password)
	{
		String status="";
		try
		{
			
			Connection con=ConnectionFactory.getconnection();
			Statement st=con.createStatement();
			ResultSet rs=st.executeQuery("select * from employee where username='"+name+"' and userpassword='"+password+"'");
			if(rs.next())
			{
				status="success";
			}
			else
			{
				status="failure";
			}
		}catch(Exception e)
		{
			status="failureex";
			e.printStackTrace();
		}
		System.out.println(status);
		return status;
	}

}
