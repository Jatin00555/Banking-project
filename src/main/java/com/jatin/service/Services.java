package com.jatin.service;

import com.jatin.dao.AccountOperation;
import com.jatin.dto.AccountHolder;

public class Services 
{
	public String CreateAccount(AccountHolder ah)
	{
		String result=null;
		AccountOperation ao=new AccountOperation();
		result=ao.addAccount(ah);
		return result;
	}
	public AccountHolder ViewDetails(String acc_no)
	{
		AccountOperation ao=new AccountOperation();
		AccountHolder ah=ao.Viewaccount(acc_no);
		
		
		return ah;
	}
	public String UpdateDetails(AccountHolder ah)
	{
		String result=null;
		AccountOperation ao=new AccountOperation();
		result=ao.Updateaccount(ah);
		return result;
	}
	public String DeleteAccount(String acc_no)
	{
		String result=null;
		AccountOperation ao=new AccountOperation();
		result=ao.Deleteaccount(acc_no);
		return result;
	
	}
	
	

}
