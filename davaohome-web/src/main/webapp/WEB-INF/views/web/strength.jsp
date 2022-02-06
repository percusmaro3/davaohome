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
            <p>당사의 강점</p>
        </div>
        <div class="location">
            <span><a href="/${language}/home"><img src="${resouceUrl}/images/home_btn.png"> HOME</a></span>
            <span>></span>
            <span><a href="/${language}/strength">당사의 강점</a></span>
        </div>

        <div class="stren_cont stren_cont_top">
            <p class="sub_title2">1. 다바오에 뿌리내린 회사</p>
            <p class="sub_text">저희 회사는 다바오에 사무실이 있는 법인 회사 및 관리 팀입니다. 저희는 더 나은 정보와 서비스를 계속 제안할 것입니다.</p>
        </div>

        <div class="stren_cont">
            <p class="sub_title2">2. 신뢰할 수 있는 개발자와의 파트너쉽</p>
            <p class="sub_text">우리는 과거에 콘도를 짓는 실적을 가지고 있거나 자금이 잘 조달된 주요 개발자 (개발 회사)와만 파트너십을 맺어 있습니다. 안심하고 구입할 수 있는 부동산을 소개합니다.
            </p>
        </div>
        <div class="stren_cont">
            <p class="sub_title2">3. 한국인 거주자와 실시간으로 최신 정보를 배포</p>
            <p class="sub_text">두테르테 대통령이 태어났고 다바오의 이름이 높아졌지만, 현재 급속히 발전하고 있는 다바오에 대한 정보는 아직 충분하지 않다고 생각합니다.<br>또한 미공개 재산 정보와 같이
                현지에서만 확인할 수 있는 정보도 제공합니다.</p>
        </div>
        <div class="stren_cont">
            <p class="sub_title2">4. 불분명한 점은 한국어로 지원될 수 있습니다.</p>
            <p class="sub_text">저희는 구입 후에도 원격 관리를 지원하며, 지역의 강점을 활용합니다. 우리는 실제로 우리 회사가 소유한 부동산을 임대하기 때문에 다양한 제안과 지원이 가능합니다.<br>필요에
                맞는 지원 플랜을 선택할 수도 있습니다.<br>이미 유닛이 있는 고객도 사용할 수 있습니다.</p>
        </div>

        <div class="stren_cont">
            <p class="sub_title2">5. 구매 후 신뢰할 수 있는 관리 및 지원 시스템</p>
            <p class="sub_text">저희는 구입 후에도 원격 관리를 지원하며, 지역의 강점을 활용합니다.<br>우리는 실제로 우리 회사가 소유한 부동산을 임대하기 때문에 다양한 제안과 지원이 가능합니다.<br>필요에 맞는 지원 플랜을 선택할 수도 있습니다. 이미 유닛이 있는 고객도 사용할 수 있습니다. </p>
        </div>
        <div class="stren_cont">
            <p class="sub_title2">6. 지속적인 개별 상담</p>
            <p class="sub_text">고객의 상황과 요구가 다르다고 생각합니다. 질문이 있거나 더 듣고 싶은 경우, 저희에게 연락하시기 바랍니다. 세미나에서 듣기 어려운 질문을 해도 괜찮습니다. </p>
        </div>
        
        <div class="cont_btn"><a href="/${language}/partner">제휴건설사 보러가기 ▶</a></div>
        
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
