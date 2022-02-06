/* 파일 업로드 시, 원하는 div에 이미지 미리보기 */ 
function previewImage(targetObj, previewImgId) {
    if (targetObj.files && targetObj.files[0]) {
        var reader = new FileReader(); //파일을 읽기 위한 FileReader객체 생성
        reader.onload = function (e) {
        //파일 읽어들이기를 성공했을때 호출되는 이벤트 핸들러
            $('#'+previewImgId).attr('src', e.target.result);
            //이미지 Tag의 SRC속성에 읽어들인 File내용을 지정
            //(아래 코드에서 읽어들인 dataURL형식)
        };                  
        reader.readAsDataURL(targetObj.files[0]);
        //File내용을 읽어 dataURL형식의 문자열로 저장
    }
}
