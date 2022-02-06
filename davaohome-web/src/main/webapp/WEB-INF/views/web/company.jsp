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

<%@include file="../base/header.jsp" %>
    <!--header-->

    <div class="main">
        <div class="page_tit">
            <p>회사개요</p>
        </div>
        <div class="location">
            <span><a href="/${language}/home"><img src="${resouceUrl}/images/home_btn.png"> HOME</a></span>
            <span>></span>
            <span><a href="/${language}/company">회사개요</a></span>
        </div>

        <div class="company_table">
            
            <div class="c_table_cont">
                <div class="c_title">상호</div>
                <div class="c_cont">Wise Solutions Ltd</div>

            </div>
            <div class="c_table_cont">
                <div class="c_title">위치</div>
                <div class="c_cont">대한민국 울산 중구 약사동 삼성래미안 201</div>

            </div>
            <div class="c_table_cont">
                <div class="c_title">대표이사</div>
                <div class="c_cont">Eiji Uchinuma</div>

            </div>
            <div class="c_table_cont">
                <div class="c_title" id="line_4">사업내용</div>
                <div class="c_cont">
                    • 해외 부동산의 현지 시찰에 관한 지원<br>
• 해외 투자 컨설팅<br>
• 해외 부동산 매매 지원<br>
• 해외 인턴쉽, 해외 연수의 기획 • 실시<br>
• 외국어 번역 및 통역<br>
• 해외 마케팅 조사, 정보 자료의 제공, 판매<br>
                </div>

            </div>
            
            <div class="c_table_cont">
                <div class="c_title"  id="line_2">해외거점</div>
                <div class="c_cont">
                   Japan, Taiwan, Thailand, Philippines-Davao<br>S.Korea
                </div>
            </div>
              <div class="c_table_cont">
                <div class="c_title"  id="line_2">문의처</div>
                <div class="c_cont">
                   한국 : 070.7789.2228<br> 필리핀:082.236.9508
                </div>
            </div>
            <div class="c_table_cont">
                <div class="c_title">카카오톡</div>
                <div class="c_cont">
                   davaoinvest
                </div>
            </div>
            <div class="c_table_cont">
                <div class="c_title">메일</div>
                <div class="c_cont">
                   eiji@wise-ss.jp
 
                </div>
            </div>
        </div>

        <div class="question_banner">
            <p class="sub_text_center">이미 디바오에서 물건을 가지고 계신 분은 임대 관리 안의 의뢰도 받습니다.<br>
                문의 양식에서 신청하십시오.</p>
            <div class="cont_btn"><a href="/${language}/question">문의 ▶</a></div>
        </div>
    </div>
    <!--main_cont-->

<%@include file="../base/footer.jsp" %>

</body>

</html>
