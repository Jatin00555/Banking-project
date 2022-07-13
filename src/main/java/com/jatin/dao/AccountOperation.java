package com.jatin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jatin.dto.AccountHolder;
import com.jatin.factory.ConnectionFactory;

public class AccountOperation 
{
	
	public AccountHolder Viewaccount(String accno)
	{
		AccountHolder ah = null;
		Connection con;
		/*Statement st;*/
		ResultSet rs;
		try
		{
			con=ConnectionFactory.getconnection();
			/*st=con.createStatement();*/
			
			PreparedStatement pr=con.prepareStatement("select * from account where accno=?");
			pr.setString(1, accno);
			rs=pr.executeQuery();
			if(rs==null)
			{
				 System.out.println("if");
				ah=null;
			}
			else
			{
				if(rs.next())
				{
				   
				   String acno=rs.getString(1);
				   String holder=rs.getString(2);
				   String type=rs.getString(3);
				   String kyc=rs.getString(4);
				   String dob=rs.getString(5);
				   String so=rs.getString(6);
				   String address=rs.getString(7);
				   String phone=rs.getString(8);
				   
				
				   
				   ah=new AccountHolder(holder,acno);
				   ah.setAcc_type(type);
				   ah.setKyc(kyc);
				  ah.setDob(dob);
				  ah.setSon_of(so);
				  ah.setAddress(address);
				  ah.setPhone(phone);
				 
				   
				   System.out.println("else");
				   
				   return ah;
				}
			}
		
		
		
		
		
		
		}catch(Exception e)
		{
			 System.out.println("exc");
			ah=null;
			e.printStackTrace();
		}
		return ah;
	}
	public String Updateaccount(AccountHolder ah)
	{
		String result="";
		Connection con=null;
		
		
		String accno=ah.getAcc_no();
		String holder=ah.getAcc_holder();
		
		String kyc=ah.getKyc();
		String dob=ah.getDob();
		String so=ah.getSon_of();
		String address=ah.getAddress();
		String phone=ah.getPhone();
		try
		{
			con=ConnectionFactory.getconnection();
			Statement st=con.createStatement();
			int rowcount=st.executeUpdate("update account set holder='"+holder+"', kyc='"+kyc+"',dob='"+dob+"',sonof='"+so+"',phone='"+phone+"',address='"+address+"' where accno='"+accno+"'");
			if(rowcount==1)
			{
				result="SucceSS";
				System.out.println(result);
			}
			else
			{
				System.out.println(result);
				result="failed";
			}
			
		}catch(Exception e)
		{
			
			result="failed";
			System.out.println(result);
			e.printStackTrace();
			
		}
		return result;
	}
	public String Deleteaccount(String acc_no)
	{
		String result="";
		Connection con=null;
		try
		{
			con=ConnectionFactory.getconnection();
			Statement st=con.createStatement();
			int rowcount=st.executeUpdate("delete from account where accno='"+acc_no+"'");
			if(rowcount==1)
			{
				result="SucceSS";
				System.out.println("succ");
			}
			else
			{
				System.out.println("fail");
				result="failed";
			}
			
		}catch(Exception e)
		{
			
			result="failed";
			System.out.println("ex");
			e.printStackTrace();
			
		}
		return result;
		
	}
	
	public String addAccount(AccountHolder ah) 
	{
		String result="";
		Connection con=null;
		PreparedStatement ps;
		
		
		String accno=ah.getAcc_no();
		String holder=ah.getAcc_holder();
		String type=ah.getAcc_type();
		String kyc=ah.getKyc();
		String dob=ah.getDob();
		String so=ah.getSon_of();
		String address=ah.getAddress();
		String phone=ah.getPhone();
		try
		{
			con=ConnectionFactory.getconnection();
			PreparedStatement pr=con.prepareStatement("insert into account values(?,?,?,?,?,?,?,?)");
			Statement st=con.createStatement();
			
			
			pr.setString(1,accno);
			pr.setString(2,holder);
			pr.setString(3,type);
			pr.setString(4,kyc);
			pr.setString(5,dob);
			pr.setString(6,so);
			pr.setString(7,address);
			pr.setString(8,phone);
			int rowcount=pr.executeUpdate();
			if(rowcount==1)
			{
				result="SucceSS";
				System.out.println(result);
			}
			else
			{
				System.out.println(result);
				result="failed";
			}
			
		}catch(Exception e)
		{
			
			result="failed";
			System.out.println(result);
			e.printStackTrace();
			
		}
		
		
		return result;
	}

}
