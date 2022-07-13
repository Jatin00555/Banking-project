package com.jatin.service;

import com.jatin.dao.TransactionOperation;
import com.jatin.dto.Transactiondto;

public class TransactionServices 
{
	public Transactiondto depositeFund(Transactiondto td)
	{
		TransactionOperation to=new TransactionOperation();
		Transactiondto td1=to.depositeAmount(td);
		return td1;
		
	}
	
	public Transactiondto withdrawFund(Transactiondto td)
	{
		TransactionOperation to=new TransactionOperation();
		Transactiondto td1=to.withdrawAmount(td);
		return td1;
	}

}
