package com.davaohome.utils.validate;


import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;


/**
 * <pre>
 * 각종 Validate를 체크하는 static 함수
 * </pre>
 * @author
 */
public class Validate {
	
	private static String NUMBER_CHAR = "0123456789";
	
	private Validate(){}
	
	
	
	/**
	 * 공백을 가지고 있는지 체크하는 함수 <br/>
	 * 반각,전각 공백을 모두 체크한다
	 * @param val string to check
	 * @return true - 공백포함 안함 , false - 공백을 가지고 있음
	*/
	public static boolean checkBlank( String val ){
		// because null has not blank data.
		if( val == null ) return true;
		
		for( char c : val.toCharArray() ){
			if(c == 0x20 || c == 0x3000)
				return false;
		}
		return true;
	}
	

	/**
	* 첫글자가 영문자로 시작되는지 체크
	* @param val string to check
	* @return boolean true - 첫글자가 영문자 , false - 첫글자가 영문자가 아님
	*/
	public static boolean isFirstAlphabet( String val ){
		// if val is null , invalid data.
		if( val == null || val.length() == 0) return true;
		
		return Character.isLetter(val.charAt(0));
	}
	
	public static boolean isNumberStr(String val){
		return checkConsistChar(val, NUMBER_CHAR) == null;
	}
	
	/**
	 * 입력한 String값에 지정한 예외문자(허용하지 않는 문자)가 존재하는지 체크
	 * checkExceptionChar("1234%^&","%") => % <br>
	 * checkExceptionChar("1234%^&","!*") => -1 <br>
	 * @param val
	 * @param charList 예외 문자열
	 * @return null=>예외문자가 없음. Character[] 포함된 예외문자 배열 
	 * */
	public static Character[] checkExceptionChar( String val, String charList ){
		if( val == null || charList == null )
			throw new NullPointerException(" Given Argument is Null ");
		
		List<Character> exceptionChar = new ArrayList<Character>();
		for( int i=0 ; i<val.length() ; i++ ){
			if( charList.indexOf( val.charAt(i) ) != -1 ){
				if( !exceptionChar.contains(val.charAt(i)) )
					exceptionChar.add(val.charAt(i));
			}
		}		
		return exceptionChar.size() == 0 ? null : (Character[])exceptionChar.toArray(new Character[exceptionChar.size()]);
	}
	
	/**
	* 입력된 String이 checkChar에 기술된 문자로만 구성되어 있는지 체크  
	* @param val string to check
	* @param checkChar character array
	* @return true-입력된 checkChar[]로만 구성된 문자열,false-그외 문자가 있음
	*/
	public static Character[] checkConsistChar( String val , char[] checkChar ){
		return checkConsistChar( val , String.valueOf( checkChar ) );
	}
	
	/**
	* 입력된 String이 checkChar에 기술된 문자로만 구성되어 있는지 체크 
	* @param val string to check
	* @param checkChar 체크할 문자열
	* @return boolean true - string has consist of given check string.
	*		  false - not.
	*/
	public static Character[] checkConsistChar( String val , String checkString ){
		if( val == null || checkString == null )
			throw new NullPointerException(" Given Argument is Null ");
		
		List<Character> exceptionChar = new ArrayList<Character>();
		for( int i=0 ; i < val.length() ; i++ ){
			if( checkString.indexOf( val.charAt(i) ) == -1 )
				if( !exceptionChar.contains(val.charAt(i)) )
					exceptionChar.add(val.charAt(i));
		}
		return exceptionChar.size() == 0 ? null : (Character[])exceptionChar.toArray(new Character[exceptionChar.size()]);
	}
	
	/**
	 * <pre>
	 * 입력한 문자열이 숫자(정수,실수)인지 판별 
	 * NumberUtils.isNumber와의 차이점은 문자열 맨앞에 '0'이 오면 false return 
	 * 0x9E 같은 16진수가와도 false를 리턴한다. 
	 * 0123 => false 
	 * 0. => false 
	 * -0123 => false 
	 * -0. => false
	 * </pre> 
	 * @param val
	 * @return true - 숫자 , false - 숫자이외값
	 */
	public static boolean isNumber(String val){
		try{
			// check 0. , -0.
			if( val.equals("0.") || val.equals("-0.") )
				return false;
			// check 0123 
			if( val.length() >= 2 && val.startsWith("0") && val.charAt(1) != '.' )
				return false;
			// check -0123 
			if( val.length() >= 3 && val.startsWith("-0") && val.charAt(2) != '.' )
				return false;
			// 숫자인지 체크
			Double.parseDouble(val);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
	/**
	 * 입력한 문자열이 양수값인지 체크 <br/>
	 * 0일경우 true 리턴
	 * @param val
	 * @return true - 0이상의 값 , false - 숫자가 아니거나 0 이하의 값
	 */
	public static boolean isPositiveNumber( String val ){
		if( !isNumber(val) )
			return false;
		return Double.parseDouble(val) >= 0 ;
	}
	
	/**
	 * <pre>
	 * 입력한 문자열이 정수인지 판별
	 * NumberUtils.isNumber와의 차이점은 문자열 맨앞에 '0'이 오면 false return
	 * 0x9E 같은 16진수가와도 false를 리턴한다.
	 * 0123 => false
	 * </pre>
	 * @param val
	 * @return true - 0이상의 값 , false - 숫자가 아니거나 0 이하의 값
	 */
	public static boolean isInteger( String val ){
		try{
			// check 0123 
			if( val.length() >= 2 && val.startsWith("0") )
				return false;
			// check -0123 
			if( val.length() >= 3 && val.startsWith("-0") )
				return false;
			// 숫자인지 체크
			Integer.parseInt(val);
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력된 숫자가 min,max값 사이에 있는지 체크
	 * @param val
	 * @param min null일 경우 조건체크 안함
	 * @param max null일 경우 조건체크 안함
	 * @return
	 */
	public static boolean checkNumberSize(Integer val, Integer min, Integer max){
		
		if( min != null && val < (int)min )
			return false;
		if( max != null && val > (int)max )
			return false;
		
		return true;
	}
	/**
	 * 입력된 문자열의 길이가 min,max 조건에 만족하는지 
	 * @param val
	 * @param min null일 경우 조건체크 안함
	 * @param max null일 경우 조건체크 안함
	 * @return
	 */
	public static boolean checkLength(String val, Integer min, Integer max){
		
		if( val == null )
			return false;
		if( min != null && val.length() < (int)min )
			return false;
		if( max != null && val.length() > (int)max )
			return false;
		
		return true;
	}
	
	/**
	* <pre>
	* 입력된 문자가 Email형식인지 체크하는 함수
	* percus@naver.com -> true
	* percus@naver -> false
	* percus@.com -> false
	* percus@aa.aa..com -> true
	* </pre>
	* @param email 
	* @return true - Email형식 , false - Email형식이 아닌경우
	*/
	public static boolean checkEmail(String email){
		// null is not email data!
		if( email == null ) return false;
		
		Pattern pattern = Pattern.compile("\\w+([-+.]\\w+)*@\\w+([-.]\\w+)*\\.\\w+([-.]\\w+)*");
		return pattern.matcher(email).find();
	}	
	
	/**
	* 입력한 문자열이 HTTPHeader형식(http,https)인지 체크
	* http:// , https:// 가 앞에 있는지만 체크한다.
	* @param val 
	* @return boolean  true - URL형식 , false - URL형식이 아닌경우
	*/
	public static boolean checkHasHTTPHeader( String val ){
		// null is not http address!
		if( val == null ) return false;
		
		return ( val.length() > 7 && val.toLowerCase().startsWith("http://") ) ||
			   ( val.length() > 8 && val.toLowerCase().startsWith("https://") );
	}
	/**
	* 입력한 문자열이 URL 형식인지 체크한다.
	* @param val 
	* @return boolean  true - URL형식 , false - URL형식이 아닌경우
	*/	
	public static boolean checkURL(String url){
		// null is not url data!
		if( url == null ) return false;
		
		Pattern pattern = Pattern.compile("^(http|https)://([a-z0-9.\\-&%=?:@~\\_]+)",Pattern.CASE_INSENSITIVE);
		return pattern.matcher(url).find();
	}
	
	/**
	 * 입력한 URL이 접속 가능한 유효한 URL인지 체크한다.
	 * @param url 유효성 검사를 할 url 
	 * @return boolean  true - 유효한 URL형식 , false - 유효하지 않은 URL형식
	 */	
	public static boolean checkValidURL(String url){
		// 접속 가능한 url 인지 체크
		boolean result = false;
		if(checkURL(url)) {
			try {
				URL myURL = new URL(url);
				HttpURLConnection url_con = (HttpURLConnection)myURL.openConnection();
				int n_response_code = url_con.getResponseCode();
				if(n_response_code == 200)
					result = true;
			} catch (MalformedURLException e) {
				// TODO Auto-generated catch block
				result = false;
				
			} catch (IOException e) {
				// TODO Auto-generated catch block
				result = false;
			}
		}
		return result;
	}
	/**
	 * 입력 value가 YYYYMMDD 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkYYYYMMDD(String val){
		if( val == null || val.length() != 8 )
			return false;
		try{
			Integer year = Integer.parseInt(val.substring(0,4));
			Integer month = Integer.parseInt(val.substring(4,6));
			Integer day = Integer.parseInt(val.substring(6,8));
			if( year > 3000 || year <= 0 )
				return false;
			if( month > 12 || month <= 0 )
				return false;
			if( day > 31 || day <= 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력 value가 YYYY 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkYYYY(String val){
		if( val == null || val.length() != 4 )
			return false;
		try{
			Integer year = Integer.parseInt(val);
			if( year > 3000 || year <= 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력 value가 YYYYMM 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkYYYYMM(String val){
		if( val == null || val.length() != 6 )
			return false;
		try{
			Integer year = Integer.parseInt(val.substring(0,4));
			Integer month = Integer.parseInt(val.substring(4,6));
			if( year > 3000 || year <= 0 )
				return false;
			if( month > 12 || month <= 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력 value가 MMDD 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkMMDD(String val){
		if( val == null || val.length() != 4 )
			return false;
		try{
			Integer month = Integer.parseInt(val.substring(0,2));
			Integer day = Integer.parseInt(val.substring(2,4));
			if( month > 12 || month <= 0 )
				return false;
			if( day > 31 || day <= 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력 value가 HHMM 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkHHMM(String val){
		if( val == null || val.length() != 4 )
			return false;
		try{
			Integer hour = Integer.parseInt(val.substring(0,2));
			Integer minute = Integer.parseInt(val.substring(2,4));
			if( hour > 23 || hour < 0 )
				return false;
			if( minute > 59 || minute < 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력 value가 HH 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkHH(String val){
		if( val == null || val.length() != 2 )
			return false;
		try{
			Integer hour = Integer.parseInt(val);
			if( hour > 23 || hour < 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	/**
	 * 입력 value가 MM 형태인지 체크
	 * @param val
	 * @return
	 */
	public static boolean checkMM(String val){
		if( val == null || val.length() != 2 )
			return false;
		try{
			Integer minute = Integer.parseInt(val);
			if( minute > 59 || minute < 0 )
				return false;
			return true;
		}catch(Exception e){
			return false;
		}
	}
	
}
