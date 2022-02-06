var koreanDate = ['일', '월', '화', '수', '목', '금', '토'];
var englishShortDate = ['SUN', 'MON', 'TUE', 'WED', 'THU', 'FRI', 'SAT'];
var englishDate = ['SUNDAY', 'MONDAY', 'TUESDAY', 'WEDNESDAY', 'THURSDAY', 'FRIDAY', 'SATURDAY'];

/**
 * 
 * @param val date_string
 * @param format format_string
 * return string
 * date format을 format에 맞춰서 return
 *		  
 */
function getDateFromFormat(val,format) {
	if( val == null) return "";
	var strToDay = "";
	var i_format=0;
	var c="";
	var token="";
	var date = new Date(val);
	//default format set
	if( format == null) {
		format = "yyyy.MM.dd";
	}
	while (i_format < format.length) {
		// format 분리하기
		c=format.charAt(i_format);
		token="";
		while ((format.charAt(i_format)==c) && (i_format < format.length)) {
			token += format.charAt(i_format++);
		}
		// format token의 값에 따라 날짜 string 만들기
		if (token=="yyyy" || token=="yy" || token=="y") {
			strToDay += date.getFullYear();
		}
		else if (token=="MM"||token=="M") {			
			if (date.getMonth()+1 < 10) {
			 	strToDay += "0"+ (parseInt(date.getMonth())+1);
			} else {
			 	strToDay += (parseInt(date.getMonth())+1);
			}
		}
		else if (token=="dd"||token=="d") {
			if (date.getDate() < 10){
				strToDay += "0"+date.getDate();
			} else {
				strToDay += date.getDate();
			}
		}
		else if (token=="hh"||token=="h") {
			if (date.getHours() < 10){
				strToDay += "0"+date.getHours();
			} else {
				strToDay += date.getHours();
			}
			}
		else if (token=="HH"||token=="H") {
			if (date.getHours() < 10){
				strToDay += "0" + date.getHours();
			} else {
				strToDay += date.getHours();
			}
		}
		else if (token=="mm"||token=="m") {
			if (date.getMinutes() < 10){
				strToDay += "0"+date.getMinutes();
			} else {
					strToDay += ""+date.getMinutes();
			}
		}
		else if (token=="ss"||token=="s") {
			if (date.getSeconds() < 10){
				strToDay += "0"+date.getSeconds();
			} else {
					strToDay += ""+date.getSeconds();
			}
		} else if(token=='e'||token=='E'){
			strToDay += koreanDate[date.getDay()];
		} else {
			strToDay +=token;
		}
	}
	return strToDay;
}

/**
 * 
 * @param String fullDateString ex) 2014.01.01
 * return Date
 * yyyy.MM.dd 형식의 스트링을 javascript Date 타입으로 반환
 *		  
 */
function getDateFromFullDateString(fullDateString){
	var dateElements = fullDateString.split('.');
	dateElements[1] = parseInt(dateElements[1]) - 1;
	
	return new Date(dateElements[0], dateElements[1], dateElements[2]);
}


/**
 * 
 * @param datetimeString
 * @returns {Date}
 * 
 * yyyy.MM.dd hh:mm 형식의 스트링을 javascript Date 타입으로 반환
 */
function getDateFromDatetimeString(datetimeString){
	var datetime = datetimeString.split(' ');
	var dateElements = datetime[0].split('.');
	var timeElements = datetime[1].split(':');
	
	return new Date(dateElements[0], parseInt(dateElements[1]) - 1, dateElements[2], timeElements[0], timeElements[1], 0);
}

/**
 * 
 * @param Date date
 * @param String timeString ex) 00:00, 23:59
 * return Date
 * 
 * Date에 hh:mm 형식의 시간 스트링을 세팅하여 Date 타입으로 반환 
 *		  
 */
function getTimeSettedDate(date, timeString){
	var timeElements = timeString.split(':');
	
	date.setHours(timeElements[0]);
	date.setMinutes(timeElements[1]);
	date.setSeconds(0);
	date.setMilliseconds(0);
	
	return date;
}

/**
 * 
 * @param Date 
 * return Date
 * 기존의 Date를 복사한 Date 오브젝트 반환
 *		  
 */
function cloneDate(date){
	return new Date(date.getTime());
}

/**
 * 
 * @param startDate
 * @param endDate
 * @param days 요일 정보(0-6)를 boolean값으로 가지고 있는 배열 파라미터
 * @returns {Array}
 * 
 * 첫 날과 마지막 날의 범위에서 유효한 요일값을 가진 Date의 리스트를 반환
 */
function getValidDateList(startDate, endDate, days){
	
	var validDateList = [];
	
	
	for(var indexDate = cloneDate(startDate); indexDate.getTime() <= endDate.getTime(); indexDate = getTommorow(indexDate)){
		
		for(var j=0; j<days.length; j++){
			
			var dayIndex = indexDate.getDay(); 
			if(dayIndex == days[j]){
				validDateList.push(indexDate);
				break;
			}
		}
	}	
	
	return validDateList;
}

/**
 * 
 * @param date
 * @returns {Date}
 * 
 * 파라미터로 입력된 Date의 다음날을 반환
 */
function getTommorow(date){
	return new Date(date.getTime() + (24 * 60 * 60 * 1000));
}

/**
 * 
 * @param date
 * @returns {Date}
 * 
 * 오늘 날짜 반환
 */
function getStrToday() {
	 var today=new Date();
	 var strToDay = today.getFullYear();
	 if (today.getMonth()+1 < 10)
	 	strToDay += ".0"+ (parseInt(today.getMonth())+1);
	 else
	 	strToDay += "." + (parseInt(today.getMonth())+1);

	 if (today.getDate() < 10)
	 	strToDay += ".0"+today.getDate();
	 else
	 	strToDay += "." + today.getDate();

	 return strToDay;
}

/**
 * 
 * 날짜에서 특정 일수를 더하고 빼서 리턴해줌
 * 
 * 
 *
 * @param date 원하는 날짜
 * @param num  특정일수 
 */
function addDate(date, num) {
	var from = new Date(date);
	var to = new Date();
	to.setDate(from.getDate() + num);
	return to;
}