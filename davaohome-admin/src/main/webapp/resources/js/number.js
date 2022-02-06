/*
 * 숫자 콤마 처리 123456 -> 123,456
 */
function toCurrency(amount){
	if( amount == undefined) {
		return amount;
	}
	if(typeof amount == "number"){
		amount = amount + "";
	}
	var data = amount.split('.');
	var sign = "";

	var firstChar = data[0].substr(0,1);
	if(firstChar == "-"){
		sign = firstChar;
		data[0] = data[0].substring(1, data[0].length);
	}

	data[0] = data[0].replace(/\D/g,"");
	if(data.length > 1){
		data[1] = data[1].replace(/\D/g,"");
	}

	firstChar = data[0].substr(0,1);

	//0으로 시작하는 숫자들 처리
	if(firstChar == "0"){
		if(data.length == 1){
			return sign + parseFloat(data[0]);
		}
	}

	var comma = new RegExp('([0-9])([0-9][0-9][0-9][,.])');

	data[0] += '.';
	do {
		data[0] = data[0].replace(comma, '$1,$2');
	} while (comma.test(data[0]));

	//소수점으로 들어올때, 소수점 아래 버림 처리 1000.00 -> 1,000
	//if (data.length > 1) {
	//	return sign + data.join('');
	//} else {
		return sign + data[0].split('.')[0];
	//}
}

/*
 * 숫자 콤마 제거   123,456 -> 123456
 */
function CurrencytoString(amount){
	if( amount == undefined) {
		return amount;
	} else {
		return amount.replace(/,/g,'');
	}
}


Number.prototype.toCurrency = function(){
    if(this==0) return 0;

    var reg = /(^[+-]?\d+)(\d{3})/;
    var n = (this + '');

    while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

    return n;
};

String.prototype.fromCurrencyToNumber = function(amount){
	return paraseInt(CurrencytoString(amount));
}

/*
 * 전화번호/휴대폰 번호 포맷으로  변경하기
 */
function makePhoneFormat(num){
	if( num == undefined ) {
		return num;
	} else {
		return num.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3");
	}
}



/* 
 * 숫자 0 으로 채우기 
 */
function leadingZeros(n, digits) {
	var zero = '';
	n = n.toString();
	if (n.length < digits) {
		for (var i = 0; i < digits - n.length; i++) {
			zero += '0';
		}
	}
	return zero + n;
}
