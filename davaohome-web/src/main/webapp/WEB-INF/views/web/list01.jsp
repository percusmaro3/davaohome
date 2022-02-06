<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <%@include file="../base/includeJsResources.jsp" %>
    <link rel="stylesheet" href="${resouceUrl}/css/list01.css${tag}">
    <link rel="stylesheet" href="${resouceUrl}/css/responsive.css${tag}">
</head>

<%@include file="../base/header.jsp" %>
    <!--header-->

    <div class="main">
        <div class="page_tit">
            <p>부동산 소개</p>
        </div>
        <div class="location">
            <span><a href="/${language}/home"><img src="${resouceUrl}/images/home_btn.png"> HOME</a></span>
            <span>></span>
            <span><a href="/${language}/introduce">부동산 소개</a></span>
            <span>></span>
            <span><a href="/${language}/list01">MALDIVES Oasis</a></span>
        </div>

        <div class="list">
            <p class="sub_title_center">MALDIVES Oasis</p>
            <p class="sub_text_center">Quimpo Blvd corner, Ecoland Dr, Davao City</p>
            <img src="${resouceUrl}/images/list01/main.png">
            <div class="list_table">
                <ul class="table_tit">
                    <li>구조/객식유형</li>
                    <li>넓이(m²)</li>
                    <li>참고가격</li>
                    <li>매달 참고가격</li>
                </ul>
                <!--table 타이틀-->
                <ul class="table_cont">
                    <li class="tbg_color high thin">스튜디오(STUDIO)</li>
                    <li class="high">22.11m²</li>
                    <li class="tbg_color">7천7백만원<br>(3.135.000PHP)</li>
                    <li class="high">51만원</li>
                </ul>
                <!--1line-->
                <ul class="table_cont">
                    <li class="tbg_color high">2 Bed Room</li>
                    <li class="high">35.76m²</li>
                    <li class="tbg_color">1억 2천 9백만원<br>(5,241,100PHP)</li>
                    <li class="high">86.5만원</li>
                </ul>
                <!--2line-->
            </div>
            <!--table01-->
            <p class="table_text">※ 원형 표기에 관해서는 1php = 24.54원으로 산출하고 있습니다. 어디 까지나 참고로 표시하고 있기 때문에 실제 가격에 따라 변동됩니다.<br>
                ※ 가격은 객실 유형,시기에 따라 변경 될 수 있습니다.<br>
                ※ 매달의 참고 가격은 1 부 부동산 대금 (20-50 %)을 개발자 분할 (금리 없음) 한 경우 매달 지불 기준입니다.<br>
                ※ 자세한 내용은 문의하시기 바랍니다. 시뮬레이션도 내놓아드립니다
            </p>
            <div class="guide_banner_wrap">
                <div class="guide_banner">
                    <ul>
                        <li>
                            <h2 class="sub_title2">다바오 인베스트</h2>
                            <p class="small_text" id="no_margin">Divao City Condominium</p>
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
            <div class="cont01">
                <div class="subtit_line"></div>
                <h2 class="sub_title2">글로벌 타운 쉽 (Business Park) 건설 예정지 주변 지역</h2>
                <p class="sub_text">개발자는 메트로 마닐라에 본사를 둔 상장사 FilInvest 입니다. 여기 물건의 특필해야 할 것은 그 입지입니다. 500 미터 전후의 위치에 향후 개발 계획의
                    약 22 헥타르에 달하는 글로벌 타운 쉽 (현재는 다바오 골프 코스)가 있습니다. 또한 대형 쇼핑몰 인 SM 쇼핑몰도 거리를 사이에 두고 눈앞에 있습니다.
                    완공은 2023 년말을 예정하고 있습니다.
                </p>
                <img src="${resouceUrl}/images/list01/img01.png">
                <p class="sub_text">마닐라 BGC 다바오 판으로 알려져 있다. 다바오 글로벌 타운 쉽의 완성 예상 CG.개발 후 땅값 상승이 기대되고 있습니다. </p>
                <img src="${resouceUrl}/images/list01/img02.png">
            </div>
            <!--주변지역-->
            <div class="cont01">
                <div class="subtit_line"></div>
                <h2 class="sub_title2">해방감 넘치는 구조로 풍부한 시설</h2>
                <img src="${resouceUrl}/images/list01/img03.png">
                <p class="sub_text">2.2 헥타르의 전체 부지에 760㎡의 수영장 부지의 65 %는 열린 공간으로 되어있어 개방감 넘치는 구조를 하고 있습니다.
                    다음 공용 시설이 부지 내에 있습니다.</p>
                <div class="cont_list">
                    <ul>
                        <li class="sub_text thin">
                            • 풀 (성인 • 어린이) <br>
                            • 바베큐 그릴 부착 피크닉 공간<br>
                            • 체육관<br>
                            • 어린이 놀이터
                        </li>
                        <li class="sub_text">
                            • 연회장 (파티 공간)<br>
                            • 오디오 룸<br>
                            • 게임 룸<br>
                            • 농구 코트
                        </li>
                    </ul>
                </div>
                <!--시설 리스트-->
                <ul class="inner_picture">
                    <li><img src="${resouceUrl}/images/list01/img05.png"></li>
                    <li class="pic_even"><img src="${resouceUrl}/images/list01/img06.png"></li>
                    <li><img src="${resouceUrl}/images/list01/img07.png"></li>
                    <li class="pic_even"><img src="${resouceUrl}/images/list01/img08.png"></li>
                    <li><img src="${resouceUrl}/images/list01/img09.png"></li>
                    <li class="pic_even"><img src="${resouceUrl}/images/list01/img10.png"></li>
                </ul>
            </div>
            <div class="tab_cont_wrap">
                <ul class="tab">
                    <li class="sub_title2" id="white">도면</li>
                    <li class="sub_title2" id="white">지도</li>
                </ul>
                <div class="tab_cont">
                    <div class="tab_cont_in">
                        <div>
                            <img src="${resouceUrl}/images/list01/floor.png">
                        </div>
                    </div>
                    <div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3959.620203057619!2d125.59653191433875!3d7.053835194905318!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x32f97284cc8fbf57%3A0x85c324c5636dd3d5!2zUXVpbXBvIEJsdmQgJiBFY29sYW5kIERyLCBUYWxvbW8sIERhdmFvIENpdHksIERhdmFvIGRlbCBTdXIsIO2VhOumrO2VgA!5e0!3m2!1sko!2skr!4v1591108723094!5m2!1sko!2skr" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--main_cont-->

<%@include file="../base/footer.jsp" %>
</body>

</html>
