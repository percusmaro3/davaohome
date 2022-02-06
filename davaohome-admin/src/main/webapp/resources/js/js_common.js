// ================================================================================
// common.js
// ================================================================================
// 화면 중앙에 표시
function _openWindowAtCenter(url,width,height,title){
	if( title == null || title == "" ){
		var title = "POPUP.._"+Math.random();
		title = title.replace(/\./g,"");
	}
	
	var x = (screen.availWidth - width) / 2;
	var y = (screen.availHeight - height) / 2;
	return window.open(url, title , "toolbar=0,status=0,resizable=yes,scrollbars=yes,location=0,menubar=0,width="+width+", height="+height+", left="+x+", top="+y);
}

// 지정된 위치에 표시
function _openWindow(url,width,height,x,y){
	var randomPopupName = "POPUP.._"+Math.random();
	randomPopupName = randomPopupName.replace(/\./g,"");
	
	return window.open(url, randomPopupName , "toolbar=0,status=0,resizable=yes,scrollbars=yes,location=0,menubar=0,width="+width+", height="+height+", left="+x+", top="+y);
}

// 선택된 Options들을 삭제하는 함수
function deleteSelectedOptions(selectObj){

	for( var i=selectObj.length-1 ; i>=0 ; i-- ){
		if( selectObj.options[i].selected )
			selectObj.remove(i);		
	}
}

// select의 모든 option을 삭제하는 함수
function removeAllSelectOption(selectObj,exceptFirst){
	var lastIndex = exceptFirst ? 1 : 0;
	for( var i=selectObj.length-1 ; i>=lastIndex ; i-- )
		selectObj.remove(i);
}

// 새로운 option을 만드는 함수
function makeOption( selectObj , value , text ){
	for( var i=0 ; i<selectObj.length ; i++ ){
		if( selectObj.options[i].value == value )
			return;
	}
	var opt = document.createElement("OPTION");
	selectObj.options.add(opt);
	opt.text = text;
	opt.value = value;
	
	return opt;
}
// Select박스의 모든값을 선택으로 변경 - multiple일 경우
function selectAllOption( selectObj ){
	for( var i=0 ; i<selectObj.length ; i++ )
		selectObj.options[i].selected = true;
}
// Select박스에 선택된 값이 있는지 체크
function hasSelectedOption(selectObj){
	for( var i=0 ; i<selectObj.length ; i++ )
		if( selectObj.options[i].selected )
			return true;
	return false;
}
// 해당 객체 위치로 스크롤 이동
function moveScroll( obj ){
	po = 0;
	for( p=obj ; p.nodeName != "BODY" ; p=p.offsetParent ){
		po += p.offsetTop;
	}
	halfSize = document.body.offsetHeight/2;
	if ( po - halfSize > 0 )
		po = po - halfSize;
	else
		po = 0;
	window.scroll(0, po );
}


function Param(key, value){
	this.key = key;
	this.value = value;
}

function URLParamManager(){
	
	this.paramArray = new Array();
	this.addParam = addParam;
	this.getURLParamStr = getURLParamStr;
}

function addParam(key, value){
	this.paramArray[this.paramArray.length] = new Param(key, value); 
}

function getURLParamStr(){
	var paramStr = "";
	for( var i=0 ; i<this.paramArray.length ; i++ ){
		paramStr += "&"+this.paramArray[i].key+"="+this.paramArray[i].value;
	}
	
	return paramStr;
}

function callAjaxFromJQuery(url, paramManager, callbackFunc){
	$.get(url+paramManager.getURLParamStr() , null , function callbackAjax(data){ 
			var jsonObj = JSON.parse(data);
			callbackFunc(jsonObj);
		} 
	);
}

function callAjaxFromJQueryPost(url, paramManager, callbackFunc){
	
	$.ajax({
		type: "POST",
		url: url,
		data: paramManager.getURLParamStr(),
		success: function callbackAjax(data){ 
			var jsonObj = JSON.parse(data);
			callbackFunc(jsonObj);
		}
	});
}

Number.prototype.format = function(){
    if(this==0) return 0;
 
    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');
 
    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');
 
    return n;
};
 
// 문자열 타입에서 쓸 수 있도록 format() 함수 추가
String.prototype.format = function(){
    var num = parseFloat(this);
    if( isNaN(num) ) return "0";
 
    return num.format();
};

/// Date Format ///

// Sample SomeDiv.innerText = (new Date()).format('dddd, mmmm dd, yyyy.');

var gsMonthNames = new Array(
	    'January',
	    'February',
	    'March',
	    'April',
	    'May',
	    'June',
	    'July',
	    'August',
	    'September',
	    'October',
	    'November',
	    'December'
	);

	 

	// a global day names array
	var gsDayNames = new Array(
	    'Sunday',
	    'Monday',
	    'Tuesday',
	    'Wednesday',
	    'Thursday',
	    'Friday',
	    'Saturday'
	);

	 

	// the date format prototype
	Date.prototype.format = function(f)
	{
	    if (!this.valueOf())
	        return '&nbsp;';
	 
	    var d = this;
	 
	    return f.replace(/(yyyy|mmmm|mmm|mm|dddd|ddd|dd|hh|nn|ss|a\/p)/gi,

	        function($1)
	        {
	            switch ($1)
	            {
	            case 'yyyy': return d.getFullYear();
	            case 'mmmm': return gsMonthNames[d.getMonth()];
	            case 'mmm':  return gsMonthNames[d.getMonth()].substr(0, 3);
	            case 'mm':   return (d.getMonth() + 1).zf(2);
	            case 'dddd': return gsDayNames[d.getDay()];
	            case 'ddd':  return gsDayNames[d.getDay()].substr(0, 3);
	            case 'dd':   return d.getDate().zf(2);
	            case 'hh':   return ((h = d.getHours() % 12) ? h : 12).zf(2);
	            case 'nn':   return d.getMinutes().zf(2);
	            case 'ss':   return d.getSeconds().zf(2);
	            case 'a/p':  return d.getHours() < 12 ? 'a' : 'p';
	            }
	        } 
	    );
	}
	
	String.prototype.zf = function(l) { return '0'.string(l - this.length) + this; }
	String.prototype.string = function(l) { var s = '', i = 0; while (i++ < l) { s += this; } return s; }
	Number.prototype.zf = function(l) { return this.toString().zf(l); }


// ================================================================================
// encoding.js
// ================================================================================

/**  
*  
*  URL encode / decode  
*  http://www.webtoolkit.info/  
*  
**/  
  
var Url = {   
  
    // public method for url encoding   
    encode : function (string) {   
        return escape(this._utf8_encode(string));   
    },   
  
    // public method for url decoding   
    decode : function (string) {   
        return this._utf8_decode(unescape(string));   
    },   
  
    // private method for UTF-8 encoding   
    _utf8_encode : function (string) {   
        string = string.replace(/\r\n/g,"\n");   
        var utftext = "";   
  
        for (var n = 0; n < string.length; n++) {   
  
            var c = string.charCodeAt(n);   
  
            if (c < 128) {   
                utftext += String.fromCharCode(c);   
            }   
            else if((c > 127) && (c < 2048)) {   
                utftext += String.fromCharCode((c >> 6) | 192);   
                utftext += String.fromCharCode((c & 63) | 128);   
            }   
            else {   
                utftext += String.fromCharCode((c >> 12) | 224);   
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);   
                utftext += String.fromCharCode((c & 63) | 128);   
            }   
  
        }   
  
        return utftext;   
    },   
  
    // private method for UTF-8 decoding   
    _utf8_decode : function (utftext) {   
        var string = "";   
        var i = 0;   
        var c = c1 = c2 = 0;   
  
        while ( i < utftext.length ) {   
  
            c = utftext.charCodeAt(i);   
  
            if (c < 128) {   
                string += String.fromCharCode(c);   
                i++;   
            }   
            else if((c > 191) && (c < 224)) {   
                c2 = utftext.charCodeAt(i+1);   
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));   
                i += 2;   
            }   
            else {   
                c2 = utftext.charCodeAt(i+1);   
                c3 = utftext.charCodeAt(i+2);   
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));   
                i += 3;   
            }   
  
        }   
  
        return string;   
    }   
  
}  


/**  
*  
*  UTF-8 data encode / decode  
*  http://www.webtoolkit.info/  
*  
**/  
  
var Utf8 = {   
  
    // public method for url encoding   
    encode : function (string) {   
        string = string.replace(/\r\n/g,"\n");   
        var utftext = "";   
  
        for (var n = 0; n < string.length; n++) {   
  
            var c = string.charCodeAt(n);   
  
            if (c < 128) {   
                utftext += String.fromCharCode(c);   
            }   
            else if((c > 127) && (c < 2048)) {   
                utftext += String.fromCharCode((c >> 6) | 192);   
                utftext += String.fromCharCode((c & 63) | 128);   
            }   
            else {   
                utftext += String.fromCharCode((c >> 12) | 224);   
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);   
                utftext += String.fromCharCode((c & 63) | 128);   
            }   
  
        }   
  
        return utftext;   
    },   
  
    // public method for url decoding   
    decode : function (utftext) {   
        var string = "";   
        var i = 0;   
        var c = c1 = c2 = 0;   
  
        while ( i < utftext.length ) {   
  
            c = utftext.charCodeAt(i);   
  
            if (c < 128) {   
                string += String.fromCharCode(c);   
                i++;   
            }   
            else if((c > 191) && (c < 224)) {   
                c2 = utftext.charCodeAt(i+1);   
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));   
                i += 2;   
            }   
            else {   
                c2 = utftext.charCodeAt(i+1);   
                c3 = utftext.charCodeAt(i+2);   
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));   
                i += 3;   
            }   
  
        }   
  
        return string;   
    }   
  
}  


/**  
*  
*  Base64 encode / decode  
*  http://www.webtoolkit.info/  
*  
**/  
  
var Base64 = {   
  
    // private property   
    _keyStr : "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=",   
  
    // public method for encoding   
    encode : function (input) {   
        var output = "";   
        var chr1, chr2, chr3, enc1, enc2, enc3, enc4;   
        var i = 0;   
  
        input = Base64._utf8_encode(input);   
  
        while (i < input.length) {   
  
            chr1 = input.charCodeAt(i++);   
            chr2 = input.charCodeAt(i++);   
            chr3 = input.charCodeAt(i++);   
  
            enc1 = chr1 >> 2;   
            enc2 = ((chr1 & 3) << 4) | (chr2 >> 4);   
            enc3 = ((chr2 & 15) << 2) | (chr3 >> 6);   
            enc4 = chr3 & 63;   
  
            if (isNaN(chr2)) {   
                enc3 = enc4 = 64;   
            } else if (isNaN(chr3)) {   
                enc4 = 64;   
            }   
  
            output = output +   
            this._keyStr.charAt(enc1) + this._keyStr.charAt(enc2) +   
            this._keyStr.charAt(enc3) + this._keyStr.charAt(enc4);   
  
        }   
  
        return output;   
    },   
  
    // public method for decoding   
    decode : function (input) {   
        var output = "";   
        var chr1, chr2, chr3;   
        var enc1, enc2, enc3, enc4;   
        var i = 0;   
  
        input = input.replace(/[^A-Za-z0-9\+\/\=]/g, "");   
  
        while (i < input.length) {   
  
            enc1 = this._keyStr.indexOf(input.charAt(i++));   
            enc2 = this._keyStr.indexOf(input.charAt(i++));   
            enc3 = this._keyStr.indexOf(input.charAt(i++));   
            enc4 = this._keyStr.indexOf(input.charAt(i++));   
  
            chr1 = (enc1 << 2) | (enc2 >> 4);   
            chr2 = ((enc2 & 15) << 4) | (enc3 >> 2);   
            chr3 = ((enc3 & 3) << 6) | enc4;   
  
            output = output + String.fromCharCode(chr1);   
  
            if (enc3 != 64) {   
                output = output + String.fromCharCode(chr2);   
            }   
            if (enc4 != 64) {   
                output = output + String.fromCharCode(chr3);   
            }   
  
        }   
  
        output = Base64._utf8_decode(output);   
  
        return output;   
  
    },   
  
    // private method for UTF-8 encoding   
    _utf8_encode : function (string) {   
        string = string.replace(/\r\n/g,"\n");   
        var utftext = "";   
  
        for (var n = 0; n < string.length; n++) {   
  
            var c = string.charCodeAt(n);   
  
            if (c < 128) {   
                utftext += String.fromCharCode(c);   
            }   
            else if((c > 127) && (c < 2048)) {   
                utftext += String.fromCharCode((c >> 6) | 192);   
                utftext += String.fromCharCode((c & 63) | 128);   
            }   
            else {   
                utftext += String.fromCharCode((c >> 12) | 224);   
                utftext += String.fromCharCode(((c >> 6) & 63) | 128);   
                utftext += String.fromCharCode((c & 63) | 128);   
            }   
  
        }   
  
        return utftext;   
    },   
  
    // private method for UTF-8 decoding   
    _utf8_decode : function (utftext) {   
        var string = "";   
        var i = 0;   
        var c = c1 = c2 = 0;   
  
        while ( i < utftext.length ) {   
  
            c = utftext.charCodeAt(i);   
  
            if (c < 128) {   
                string += String.fromCharCode(c);   
                i++;   
            }   
            else if((c > 191) && (c < 224)) {   
                c2 = utftext.charCodeAt(i+1);   
                string += String.fromCharCode(((c & 31) << 6) | (c2 & 63));   
                i += 2;   
            }   
            else {   
                c2 = utftext.charCodeAt(i+1);   
                c3 = utftext.charCodeAt(i+2);   
                string += String.fromCharCode(((c & 15) << 12) | ((c2 & 63) << 6) | (c3 & 63));   
                i += 3;   
            }   
  
        }   
  
        return string;   
    }   
  
}  
