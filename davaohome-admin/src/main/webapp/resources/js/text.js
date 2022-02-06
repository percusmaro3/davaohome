
/* onKeyOn 이벤트에 해당 textarea에 length를 체크해 intMax 이상일 경우, alert
 * 넘는 length의 글자를 자동으로 지워줌
 */
function chkMsgLength(intMax,objMsg,st) {
	var length = lengthMsg(objMsg.value);
    
    st.innerHTML = length;//현재 byte수를 넣는다
    
    if (length > intMax) {
        alert("글자수 초과입니다\n");
        objMsg.value = objMsg.value.replace(/\r\n$/, "");
        objMsg.value = assertMsg(intMax,objMsg.value, st);                
    }
}   
 
// 현재 메시지 바이트 수 계산
function lengthMsg(objMsg) 
{

    var nbytes = 0;
    for (var i=0; i<objMsg.length; i++) {
        var ch = objMsg.charAt(i);
        if(escape(ch).length > 4)  {
            nbytes += 2;
        } else if (ch == '\n') {
            if (objMsg.charAt(i-1) != '\r') {
                nbytes += 1;
            }
        } else if (ch == '<' || ch == '>') {
            nbytes += 4;
        } else {
            nbytes += 1;
        }
    }
    return nbytes;
}

// 글자수 넘는 문자열 자르기
function assertMsg(intMax, objMsg, st) 
{
    var inc = 0;
    var nbytes = 0;
    var msg = "";

    var msglen = objMsg.length;
    
    for (var i=0; i < msglen; i++) {
        var ch = objMsg.charAt(i);
        
        if (escape(ch).length > 4) {
            inc = 2;
        } else if (ch == '\n') {
            if (objMsg.charAt(i-1) != '\r') {
                inc = 1;
            }
        } else if (ch == '<' || ch == '>') {
            inc = 4;
        } else {
            inc = 1;
        }
        
        if ((nbytes + inc) > intMax) {
            break;
        }
        
        nbytes += inc;
        msg += ch;
    }
    
    st.innerHTML = nbytes; //현재 byte수를 넣는다
    
    return msg;
}