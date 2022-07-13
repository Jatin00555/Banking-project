package com.jatin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import com.jatin.dto.Transactiondto;
import com.jatin.factory.ConnectionFactory;

public class TransactionOperation 
{
	public Transactiondto depositeAmount(Transactiondto td1)
	{
		Connection con =ConnectionFactory.getconnection();
		PreparedStatement ps;
		ResultSet rs;
		Transactiondto td2 = null;
		String acno=td1.getAccno();
		String amount=td1.getAmount();
		String dt=td1.getTdate();
		String type=td1.getTtype();
		String tno=td1.getTno();
		String employee=td1.getEmployee();
		String details=td1.getTdetails();
		double avalible = 0 ;
		double actual;
		double am=Float.parseFloat(amount);
		
		try
		{
			ps=con.prepareStatement("select * from avalible_balance where accno=?");
			ps.setString(1,acno);
			rs=ps.executeQuery();
			boolean b=rs.next();
			
			if(b==false)
			{
				PreparedStatement ps1=con.prepareStatement("insert into avalible_balance values(?,?)");
				ps1.setString(1,amount);
				ps1.setString(2,acno);
				int rowcount=ps1.executeUpdate();
				PreparedStatement ps2=con.prepareStatement("insert into transaction values(?,?,?,?,?,?,?)");
				ps2.setString(1,tno);
				ps2.setString(2,type);
				ps2.setString(3,amount);
				ps2.setString(4,employee);
				ps2.setString(5,dt);
				ps2.setString(6,details);
				ps2.setString(7,acno);
				int rowcount1=ps2.executeUpdate();
				if(rowcount==1&&rowcount1==1)
				{
					td2=new Transactiondto(acno);
					td2.setResult("success");
					td2.setAmount(amount);
					System.out.println("if if");
				}
				else
				{
					td2=new Transactiondto(acno);
					td2.setResult("Failed");
					td2.setAmount(amount);
					System.out.println("if else");
				}
			}
			else
			{
				ps=con.prepareStatement("select * from avalible_balance where accno=?");
				ps.setString(1,acno);
				rs=ps.executeQuery();
				while(rs.next())
				{
					avalible=Double.parseDouble(rs.getString(1));
					System.out.println(avalible);
				}
				PreparedStatement ps2=con.prepareStatement("insert into transaction values(?,?,?,?,?,?,?)");
				ps2.setString(1,tno);
				ps2.setString(2,type);
				ps2.setString(3,amount);
				ps2.setString(4,employee);
				ps2.setString(5,dt);
				ps2.setString(6,details);
				ps2.setString(7,acno);
				int rowcount1=ps2.executeUpdate();
				
				
				actual=am+avalible;
				Statement st=con.createStatement();
				int rowcount=st.executeUpdate("update avalible_balance set balance='"+actual+"' where accno='"+acno+"'");
				if(rowcount==1&&rowcount1==1)
				{
					td2=new Transactiondto(acno);
					td2.setResult("success");
					td2.setAmount(amount);
					System.out.println("else if");
					
				}
				else
				{
					td2=new Transactiondto(acno);
					td2.setResult("Failed");
					td2.setAmount(amount);
					System.out.println("else else");
					
				}
				
			}
			
			
			
			
		}catch(Exception e)
		{
			td2=new Transactiondto(acno);
			td2.setResult("ExFailed");
			td2.setAmount(amount);
			System.out.println("ex");
			
			e.printStackTrace();
		}
		
		return td2;
	}
	
	public Transactiondto withdrawAmount(Transactiondto td1)
	{
		Connection con =ConnectionFactory.getconnection();
		PreparedStatement ps;
		PreparedStatement ps1;
		ResultSet rs;
		ResultSet rs1;
		Transactiondto td2 = null;
		String acno=td1.getAccno();
		String amount=td1.getAmount();
		String dt=td1.getTdate();
		String type=td1.getTtype();
		String tno=td1.getTno();
		String employee=td1.getEmployee();
		String details=td1.getTdetails();
		
		
		double am=Float.parseFloat(amount);
		
		try
		{
			ps=con.prepareStatement("select * from transaction where accno=?");
			ps.setString(1,acno);
			rs=ps.executeQuery();
			ps1=con.prepareStatement("select * from avalible_balance where accno=?");
			ps1.setString(1,acno);
			if(rs.next())
			{
				rs1=ps1.executeQuery();
				double avalible=0;
				while(rs1.next())
				{
					avalible=rs1.getDouble("balance");
				}
				if(avalible>=am)
				{
					double actual=avalible-am;
					PreparedStatement ps2=con.prepareStatement("insert into transaction values(?,?,?,?,?,?,?)");
					ps2.setString(1,tno);
					ps2.setString(2,type);
					ps2.setString(3,amount);
					ps2.setString(4,employee);
					ps2.setString(5,dt);
					ps2.setString(6,details);
					ps2.setString(7,acno);
					int rowcount1=ps2.executeUpdate();
					
					Statement st=con.createStatement();
					int rowcount=st.executeUpdate("update avalible_balance set balance='"+actual+"' where accno='"+acno+"'");
					if(rowcount==1 && rowcount1==1)
					{
						td2=new Transactiondto(acno);
						td2.setResult("success");
						td2.setAmount(amount);
						System.out.println("actual"+actual);
						System.out.println("avalible"+avalible);
						
					}else
					{
						td2=new Transactiondto(acno);
						td2.setResult("Failed");
						td2.setAmount(amount);
						System.out.println("else else");
						
					}
					
					
				}
				else
				{
					td2=new Transactiondto(acno);
					td2.setResult("insufficient fund");
					td2.setAmount(amount);
					
				}
				
				
			}
			else
			{
				td2=new Transactiondto(acno);
				td2.setResult("insufficient fund");
				td2.setAmount(amount);
			}
			
		}
		catch(Exception e)
		{
			td2=new Transactiondto(acno);
			td2.setResult("ExFailed");
			td2.setAmount(amount);
			System.out.println("ex");
			
			e.printStackTrace();
		}
		
		return td2;
		
	}
	

}
