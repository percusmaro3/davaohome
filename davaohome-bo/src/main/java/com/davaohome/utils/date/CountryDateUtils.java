package com.davaohome.utils.date;

import org.apache.commons.lang.StringUtils;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class CountryDateUtils {
	
	private static SimpleDateFormat dbDateFormat = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
	
	public static Date getDate(String dateStr, SimpleDateFormat format) throws ParseException{
		if( StringUtils.isEmpty(dateStr) ){
			return null;
		}
		return format.parse(dateStr);
	}
	
	public static String getDateStr(Date date, SimpleDateFormat format){
		if( date == null ){
			return "";
		}
		return format.format(date);
	}
	
	public static String getDateTimeStr(Date date, SimpleDateFormat format){
		if( date == null ){
			return "";
		}
		return format.format(date);
	}
	
	public static String getDateStrForDB(Date date){
		
		return dbDateFormat.format(date);
	}
}
