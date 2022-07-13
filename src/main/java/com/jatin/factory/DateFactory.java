package com.jatin.factory;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateFactory 
{
	public static String getdate()
	{
		Date dt=new Date();
		SimpleDateFormat fr=new SimpleDateFormat("dd/mm/yy");
		String str=fr.format(dt);
		return str;
	}

}
