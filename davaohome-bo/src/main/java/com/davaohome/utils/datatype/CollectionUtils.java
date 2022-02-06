package com.davaohome.utils.datatype;

import java.util.List;

public class CollectionUtils {
	
	public static String getListStr(List<String> list){
		StringBuffer sb = new StringBuffer();
		for( int i=0 ; i<list.size() ; i++ ){
			sb.append(list.get(i));
			if( i != list.size()-1 ){
				sb.append(",");
			}
		}
		
		return sb.toString();
	}
}
