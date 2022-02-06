<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <%@include file="../base/includeJsResources.jsp" %>
    <link rel="stylesheet" href="${resouceUrl}/css/strength.css${tag}">
    <link rel="stylesheet" href="${resouceUrl}/css/responsive.css${tag}">
</head>

<script>
    function goQuestion(){
        var f = document.question;

        if( f.userName.value == '' ){
            alert("이름을 입력해 주시기 바랍니다.");
            return;
        }
        if( f.userEmail.value.trim() == ''){
            alert("이메일을 입력해 주시기 바랍니다.");
            return;
        }
        if( f.question.value.trim() == ''){
            alert("문의사을 입력해 주시기 바랍니다.");
            return;
        }
        if( !f.checkAgree.checked) {
            alert("동의를 체크해 주시기 바랍니다.");
            return;
        }

        if( !confirm("문의를 접수 하시겠습니까?")){
            return;
        }

        f.submit();
    }
</script>

<%@include file="../base/header.jsp" %>
    <!--header-->

    <div class="main">
        <div class="page_tit">
            <p>문의사항</p>
        </div>
        <div class="location">
            <span><a href="/${language}/home"><img src="${resouceUrl}/images/home_btn.png"> HOME</a></span>
            <span>></span>
            <span><a href="/${language}/question">문의사항</a></span>
        </div>
<div class="guide_banner_wrap">
                <div class="guide_banner">
                    <ul>
                        <li>
                            <h2 class="sub_title2" id="no_margin">다바오 인베스트</h2>
                            <p class="small_text">Divao City Condominium</p>
                            <div class="cont_btn2"><a href="/${language}/question">문의</a></div>
                        </li>
                        <li>
                            <h2 class="sub_text">디바오 부동산 가이드 주식회사</h2>
                            <p class="small_text">대한민국 울산 중구 약사동 삼성래미안 201</p>
                            <p class="table_text emp">프리 다이얼 [평일 10:00 ~ 18:00]</p>
                            <h2 class="emp">070-7789-2228</h2>
                        </li>
                    </ul>
                </div>
            </div>
            <!--가이드-->
           
 <form name="question" class="question" method="post" action="/${language}/sendQuestion">
<p class="sub_text">아래의 문의 양식을 기입하신 후, [확인]을 누르십시오.</p>
 <div class="question_table">
            <div class="q_table_cont">
                <div class="q_title">이름</div>
                <div class="q_cont"><input type="text" name="userName" value="이름"></div>

            </div>
            <div class="q_table_cont">
                <div class="q_title">이메일 주소</div>
                <div class="q_cont"><input type="text" name="userEmail" value="이메일 주소"></div>

            </div>
            <div class="q_table_cont">
                <div class="q_title" id="line_high">문의사항</div>
                <div class="q_cont"><input type="text" name="question" id="question_cont"></div>

            </div>
</div>

	<p class="sub_text">제공해 주신 개인 정보는 당사에서 엄중하게 관리하고 회사의 업무 범위 내에서만 이용하겠습니다.<br>
또한 개인 정보를 당사에서 제3자에게 제공하는 것은 없습니다. <br><br>
<label><input type="checkbox" name="checkAgree">위 내용에 괜찮으시면[확인]을 눌러주세요</label></p>
	<div class="cont_btn"><a href="#" onclick="javascript:goQuestion()">문의하기 ▶</a></div>
        </form>
       
    </div><!--main_cont-->

<%@include file="../base/footer.jsp" %>

</body>

</html>
