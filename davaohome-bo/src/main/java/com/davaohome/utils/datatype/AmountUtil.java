package com.davaohome.utils.datatype;

public class AmountUtil {

	// vatPercent 1 ~ 100. ex) 10% -> 10
	public static Integer getVatAmount(Integer amount, Integer vatPercent){
		return amount*vatPercent/100;
	}
	
	public static Integer getAmountFloorLastOne(Integer amount){
		
		return (int)Math.floor(amount*0.1)*10;
	}
}
