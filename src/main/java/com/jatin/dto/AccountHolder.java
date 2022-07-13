package com.jatin.dto;

public class AccountHolder 
{
	String acc_holder;
	String acc_no;
	String kyc;
	String son_of;
	String dob;
	String address;
	String phone;
	String acc_type;
	public String getAcc_type() 
	{
		return acc_type;
	}
	public void setAcc_type(String acc_type) 
	{
		this.acc_type = acc_type;
	}
	
	public AccountHolder(String acc_holder, String acc_no)
	{
		this.acc_holder=acc_holder;
		this.acc_no=acc_no;
	}
	public String getAcc_holder() 
	{
		return acc_holder;
	}
	public void setAcc_holder(String acc_holder) 
	{
		this.acc_holder = acc_holder;
	}
	public String getAcc_no()
	{
		return acc_no;
	}
	public void setAcc_no(String acc_no) 
	{
		this.acc_no = acc_no;
	}
	public String getKyc()
	{
		return kyc;
	}
	public void setKyc(String kyc) 
	{
		this.kyc = kyc;
	}
	public String getSon_of()
	{
		return son_of;
	}
	public void setSon_of(String son_of)
	{
		this.son_of = son_of;
	}
	public String getDob() 
	{
		return dob;
	}
	public void setDob(String dob)
	{
		this.dob = dob;
	}
	public String getAddress() 
	{
		return address;
	}
	public void setAddress(String address) 
	{
		this.address = address;
	}
	public String getPhone() 
	{
		return phone;
	}
	public void setPhone(String phone) 
	{
		this.phone = phone;
	}
	

}
