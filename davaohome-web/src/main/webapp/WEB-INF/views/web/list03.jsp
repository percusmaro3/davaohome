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
            <span><a href="/${language}/list03">Two Lakeshore Drive</a></span>
        </div>

        <div class="list">
            <p class="sub_title_center">Two Lakeshore Drive</p>
            <p class="sub_text_center">SP Dacudao Loop Agdao, Davao City Davao del Sur</p>
            <img src="${resouceUrl}/images/list03/main.png">
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
                    <li class="high">26.5m²</li>
                    <li class="tbg_color">7천2백만원<br>(2,940,012PHP)</li>
                    <li class="high">60만원</li>
                </ul>
                <!--1line-->
                <ul class="table_cont">
                    <li class="tbg_color high">2 Bed Room</li>
                    <li class="high">52m²</li>
                    <li class="tbg_color">1억6천만원<br>(6,428,405PHP)</li>
                    <li class="high">130만원</li>
                </ul>
                <!--2line-->
                <ul class="table_cont">
                    <li class="tbg_color high">2 Bed Room</li>
                    <li class="high">76m²</li>
                    <li class="tbg_color">2억 1천만원<br>(8,641,723PHP)</li>
                    <li class="high">180만원</li>
                </ul>
                <!--3line-->
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
            <div class="cont01">
                <div class="subtit_line"></div>
                <h2 class="sub_title2">주변환경</h2>
                <ul class="inner_picture">
                    <li><img src="${resouceUrl}/images/list03/cont1-1.png"></li>
                    <li><img src="${resouceUrl}/images/list03/cont1-2.png"></li>
                    <li><img src="${resouceUrl}/images/list03/cont1-3.png"></li>
                    <li><img src="${resouceUrl}/images/list03/cont1-4.png"></li>
                </ul>
                <p class="sub_text">SM 라낭은 공원, 호텔이 바로 옆이 있는 거대한 쇼핑몰입니다. 많은 이동인구, 레스토랑, 슈퍼마켓뿐만 아니라 하루 종일 즐길 수있는 3D 및 IMAX 영화관이
                    있습니다. 이벤트와 파티가 열리는 컨벤션 센터도 있습니다. 파크 인 호텔은 매우 깨끗하고 현대적인 비즈니스 호텔입니다. 객실 키로 엘리베이터가 이동하는
                    보안이 견고한 추천 호텔입니다. 1층에는 뷔페 레스토랑이, 중간층에는 야외 수영장이 있습니다. 또한 주변에는 부동산 개발 회사인 다모사 랜드
                    DAMOSA LAND)의 사무실이 있는 상업 시설입니다. 은행, 슈퍼마켓, 푸드 코트 및 IT 파크 사무실 지구가 있습니다. 푸드 코트는 항상 인근 민다나오 국제
                    대학의 학생들과 IT 파크에서 일하는 사람들로 붐빈니다. 민다나오 국제 대학은 일본인이 설립한 일본어 교육을 받을 수 있는 역사적인 대학입니다.
                    아베 신조 총리도 방문했다.
                </p>
            </div>
            <!---->

            <div class="cont01">
                <div class="cont01_in">
                    <h2 class="sub_title2">■ 스튜디오 유닛</h2>
                    <p class="sub_text">거실, 침대, 작업 공간이라는 호텔 콘도 같은 구조로 되어 있습니다. 발코니 의자 등을 둘 넓은 테라스 풍.
                        눈앞의 바다를 바라 체류하는 동안 편안한 시간을 만끽할 수 있습니다.</p><br>

                    <p class="sub_text_bold">
                        [부엌]
                    </p>
                    <p class="sub_text">
                        부엌 수납이 넓습니다. 부엌에서 식사 공간과 가깝기 때문에 요리하면서 대화를 즐기고 식사를 할 수 있습니다. </p>
                    <ul class="inner_picture">
                        <li><img src="${resouceUrl}/images/list03/cont2-1.png"></li>
                        <li><img src="${resouceUrl}/images/list03/cont2-2.png"></li>
                    </ul>

                    <p class="sub_text_bold">
                        [침실]
                    </p>
                    <p class="sub_text">
                        침실 옆에 있는 발코니에서 푸른 하늘, 바다, 다바오 시의 전망을 감상하며 침대에서 휴식을 취할 수 있습니다. 침대 뒤쪽에는 샤워시설과
                        화장실공간이 마련되어 있습니다. </p>
                    <ul class="inner_picture">
                        <li><img src="${resouceUrl}/images/list03/cont2-3.png"></li>
                        <li><img src="${resouceUrl}/images/list03/cont2-4.png"></li>
                    </ul>
                </div>

                <div class="cont01_in">
                    <h2 class="sub_title2">■2 Bed Room 유닛</h2>

                    <p class="sub_text_bold">
                        [L자형의 넓은 부엌]
                    </p>
                    <p class="sub_text">
                        카운터 키친으로 사용이 간편합니다. 거실에서 침실, 카운터를 통해 메이드 룸까지 모든 객실을 볼 수 있습니다.
                    </p>
                    <ul class="inner_picture">
                        <li><img src="${resouceUrl}/images/list03/cont2-5.png"></li>
                        <li><img src="${resouceUrl}/images/list03/cont2-6.png"></li>
                    </ul>

                    <p class="sub_text_bold">
                        [화장실 및 욕실]
                    </p>
                    <p class="sub_text">
                        샤워, 화장실, 세면대가 컴팩트한 방식으로 모이는 공간입니다. 샤워실과 화장실은 분리되어 있어 깨끗하게 사용할 수 있습니다. 시스루이기 때문에 밝고
                        개방감이 가득합니다.
                    </p>
                    <ul class="inner_picture">
                        <li><img src="${resouceUrl}/images/list03/cont2-7.png"></li>
                        <li><img src="${resouceUrl}/images/list03/cont2-8.png"></li>
                    </ul>

                    <p class="sub_text_bold">
                        [침실]
                    </p>
                    <p class="sub_text">
                        이 침실은 도시가 내려다보이는 대형 창문을 갖추고 있습니다. 침대 옆과 상단에 충분한 수납 공간이 있어 방을 넓게 사용할 수 있습니다
                    </p>
                    <ul class="inner_picture">
                        <li><img src="${resouceUrl}/images/list03/cont2-9.png"></li>
                        <li><img src="${resouceUrl}/images/list03/cont2-10.png"></li>
                    </ul>
                </div>

            </div>


            <div class="tab_cont_wrap">
                <ul class="tab">
                    <li class="sub_title2" id="white">도면</li>
                    <li class="sub_title2" id="white">지도</li>
                </ul>
                <div class="tab_cont">
                    <div class="tab_cont_in">
                        <div>
                            <img src="${resouceUrl}/images/list03/floor.png">
                        </div>
                    </div>
                    <div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3959.229250107898!2d125.62773751470765!3d7.099406918169913!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x32f96c49e77785ab%3A0xc029e19b33d10b44!2zU1AgRGFjdWRhbyBMb29wLCBBZ2RhbywgRGF2YW8gQ2l0eSwgRGF2YW8gZGVsIFN1ciwg7ZWE66as7ZWA!5e0!3m2!1sko!2skr!4v1591181626617!5m2!1sko!2skr" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <!--main_cont-->

<%@include file="../base/footer.jsp" %>
</body>

</html>
