package com.davaohome.utils;

import java.text.DecimalFormat;

public class WiseCallUtil {
	
	public static String getNumberByComma(Integer number){
		if( number != null )
			return new DecimalFormat("##,###").format(number);
		else
			return "";
	}
	public static String getNumberByComma(Float number){
		if( number != null )
			return new DecimalFormat("##,###.#").format(number);
		else
			return "";
	}
	public static String getNumberByComma(Double number){
		if( number != null )
			return new DecimalFormat("##,###.#").format(number);
		else
			return "";
	}
	public static String getNumberByCommaForGBDisplay(double number){
		return new DecimalFormat("##,##0.00").format(number); 
	}

}
