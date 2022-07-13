package com.jatin.dto;

public class Transactiondto 
{
	 String amount;
	 String accno;
	 String result;
	 String tno;
	 String tdate;
	 String ttype;
	 String tdetails;
	 String employee;
	
	public void setEmployee(String employee) {
		this.employee = employee;
	}
	public String getResult() 
	{
		return result;
	}
	public void setResult(String result) 
	{
		this.result = result;
	}
	public String getTno() {
		return tno;
	}
	public void setTno(String tno) {
		this.tno = tno;
	}
	public String getTdate() {
		return tdate;
	}
	public void setTdate(String tdate) {
		this.tdate = tdate;
	}
	public String getTtype() {
		return ttype;
	}
	public void setTtype(String ttype) {
		this.ttype = ttype;
	}
	public String getTdetails() {
		return tdetails;
	}
	public void setTdetails(String tdetails) {
		this.tdetails = tdetails;
	}
	public Transactiondto(String accno)
	{
		this.accno=accno;
		
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public String getAccno() {
		return accno;
	}
	public void setAccno(String accno) {
		this.accno = accno;
	}
	public String getEmployee() {
		// TODO Auto-generated method stub
		return employee;
	}
	

}
