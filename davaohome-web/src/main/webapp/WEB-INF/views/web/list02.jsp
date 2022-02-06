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
            <span><a href="/${language}/list02">Dusit Thani RESIDENCE DAVAO</a></span>
        </div>

        <div class="list">
            <p class="sub_title_center">Dusit Thani RESIDENCE DAVAO</p>
            <p class="sub_text_center">Maryknoll Road, Buhangin, Davao City, Davao del SurCity</p>
            <img src="${resouceUrl}/images/list02/main.png">
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
                    <li class="high">34.84m²</li>
                    <li class="tbg_color">2억 4만원<br>(9,902,520PHP)</li>
                    <li class="high">340만원</li>
                </ul>
                <!--1line-->
                <ul class="table_cont">
                    <li class="tbg_color high">1 Bed Room</li>
                    <li class="high">72.72m²</li>
                    <li class="tbg_color">4억 4천만원<br>(17,967,290PHP)</li>
                    <li class="high">650만원</li>
                </ul>
                <!--2line-->
                <ul class="table_cont">
                    <li class="tbg_color high">2 Bed Room</li>
                    <li class="high">106.86m²</li>
                    <li class="tbg_color">6억 7천만원<br>(27,112,078PHP)</li>
                    <li class="high">980만원</li>
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
                <h2 class="sub_title2">태국 고급 호텔 체인에서 투자하여 건설하는 첫 호텔 콘도</h2>
                <p class="sub_text">태국의 고급 호텔 체인 dusit이 약 530억원 을 투자하여 건설하는 첫 다바오의 호텔 콘도입니다. 호텔의 시설을 사용할 수 있는 것은 물론, 호텔로 관리 받
                    수 있는 것이 특징입니다. 소유자가 되면 각국의 dusit 계열의 호텔의 서비스와 dusit 소유의 리조트 섬 LUBI PLANTATION의 이용 등 다양한 혜택이 있는
                    것도 매력 중 하나입니다. 공항에 근접해 향후 VIP의 숙소로서 기대되고 있습니다. 컨벤션 센터도 같은 시기에 건물 옆에 완성하기 위해 결혼식이나 회의 등
                    고객의 숙박을 기대할 수 있습니다. 부동산 대금은 모델 룸 같은 호텔 사양의 인테리어 (가구, 가전 세트)도 포함됩니다 (객실 사진 참조) STUDIO 유형은7 일,
                    1 BED 이상은 14 일간의 소유자 무료 숙박 혜택도 즐거운 매력입니다. 투자의 경우 두시타니에서 관리되며 전체 숙박 수익을 객실 당 넓이로 분배됩니다.
                    호텔 컨벤션 센터가 먼저 오픈 예정입니다. (2019 년 3 월에 호텔이 오픈했습니다) 그러므로 부동산 완성시에서 고객 유치를 기대할 수 있습니다.
                </p>
                <ul class="inner_picture">
                    <li><img src="${resouceUrl}/images/list02/cont1-1.png"></li>
                    <li><img src="${resouceUrl}/images/list02/cont1-2.png"></li>

                </ul>
            </div>
            <!---->

            <div class="cont01">
                <div class="subtit_line"></div>
                <h2 class="sub_title2">주변환경</h2>
                <ul class="inner_picture">
                    <li><img src="${resouceUrl}/images/list02/cont2-1.png"></li>
                    <li><img src="${resouceUrl}/images/list02/cont2-2.png"></li>
                    <li><img src="${resouceUrl}/images/list02/cont2-3.png"></li>
                    <li><img src="${resouceUrl}/images/list02/cont2-4.png"></li>

                </ul>
                <p class="sub_text">물건은 JP 로렐대로 바로 옆에 있으며, 바다와 가까이에 있습니다. 부동산의 바다 측에있는 선착장은 부동산에서 도보 3 분 거리에 있습니다. 여기에서
                    옆 섬의 사말 섬의 Blue jazz하는 비치 리조트에 액세스 할 수 있습니다. 배는 10 분 정도 사마르 섬에 도착하고 왕복 승선료 • 입장료 포함 1 인 210 페소
                    (약 430 0원)입니다. Blue jazz는 바다 뿐만 아니라 워터 슬라이더와 바나나 보트 (요금 별도) 등 놀 수 있는 시설에 충실하고 있습니다. 선착장에서 수속을
                    한 후 선착장에서 배를 타고 있습니다. 눈앞에 사마르 섬이 펼쳐져, 바다 위를 걷는 듯한 기분 좋은 공간이 퍼지고 있습니다. 길 건너편에서 도보 3 분 거리에
                    상업 시설이 있습니다. 여기에는 슈퍼, 약국, 편의점이 들어가 있어 대부분의 생활 용품을 여기서 구할 수 있습니다. 편의점은 물론 24 시간 영업이므로
                    매우 편리합니다. 부동산에서 거리로 향하는 왼쪽에 맥도날드가 있습니다. 멀리 필리핀의 인기 패스트푸드 점인 jolibee도 있으므로 꼭 한번 맛보십시오.

                </p>
            </div>
            <!--주변환경-->

            <div class="cont01">
                <div class="cont01_in">
                    <h2 class="sub_title2">■ 거실, 침실 공간 <STUDIO 유형>
                    </h2>
                    <ul class="inner_picture2">
                        <li><img src="${resouceUrl}/images/list02/cont2-5.png"></li>
                        <li><img src="${resouceUrl}/images/list02/cont2-6.png"></li>
                        <li><img src="${resouceUrl}/images/list02/cont2-7.png"></li>
                    </ul>
                    <p class="sub_text">거실, 침대, 작업 공간이라는 호텔 콘도 같은 구조로 되어 있습니다. 발코니 의자 등을 둘 넓은 테라스 풍. 눈앞의 바다를 바라 체류하는 동안 편안한 시간을
                        만끽할 수 있습니다.</p>
                </div>

                <div class="cont01_in">
                    <h2 class="sub_title2">■ 현관에서 <STUDIO 유형>
                    </h2>
                    <ul class="inner_picture2">
                        <li></li>
                        <li><img src="${resouceUrl}/images/list02/cont2-8.png"></li>
                        <li></li>
                    </ul>
                    <p class="sub_text">현관을 들어 서면 왼쪽에 샤워, 화장실 공간. 안쪽에 거실, 발코니가 있습니다.</p>

                </div>
                <div class="cont01_in">
                    <h2 class="sub_title2">■ 거실, 주방 <1 BED ROOM 유형>
                    </h2>
                    <ul class="inner_picture2">
                        <li></li>
                        <li><img src="${resouceUrl}/images/list02/cont2-9.png"></li>
                        <li></li>
                    </ul>
                    <p class="sub_text">세련된 카운터 주방에서 거실 식당은 물론, 자녀와 즐겁게 대화를 하면서 발코니까지 감상 할 수 있습니다. 또한 푸른 바다와 사마르 섬을 임하면서 만든
                        요리는 반드시 맛도 각별합니다.
                    </p>
                </div>
                <div class="cont01_in">
                    <h2 class="sub_title2">■ 침실, 욕실 <1 BED ROOM 유형>
                    </h2>
                    <ul class="inner_floor">
                        <li><img src="${resouceUrl}/images/list02/cont2-10.png"></li>
                        <li><img src="${resouceUrl}/images/list02/cont2-11.png"></li>

                    </ul>
                    <p class="sub_text">침실에는 화장실, 샤워 실이 인접. 침대는 편안 퀸즈 크기. 발코니 측면에는 의자를 배치하여 최고의 휴식 공간을 제공합니다.
                    </p>

                </div>

            </div>

            <div class="cont01">
                <div class="subtit_line"></div>
                <h2 class="sub_title2">도면</h2>
                <div class="cont01_in">
                    <h2 class="sub_title2">■ Studio Type</h2>
                    <ul class="inner_floor">
                        <li><img src="${resouceUrl}/images/list02/floor01.png"></li>
                        <li><img src="${resouceUrl}/images/list02/floor02.png"></li>

                    </ul>
                </div>
                <div class="cont01_in">
                    <h2 class="sub_title2">■ 1 Bed Room</h2>
                    <ul class="inner_floor">
                        <li><img src="${resouceUrl}/images/list02/floor03.png"></li>
                        <li><img src="${resouceUrl}/images/list02/floor04.png"></li>

                    </ul>
                </div>
                <div class="cont01_in">
                    <h2 class="sub_title2">■ 2 Bed Room</h2>
                    <ul class="inner_floor2">
                        <li><img src="${resouceUrl}/images/list02/floor05.png"></li>
                        <li><img src="${resouceUrl}/images/list02/floor06.png"></li>
                        <li><img src="${resouceUrl}/images/list02/floor07.png"></li>
                    </ul>
                    <ul class="inner_floor">
                        <li><img src="${resouceUrl}/images/list02/floor08.png"></li>
                        <li><img src="${resouceUrl}/images/list02/floor09.png"></li>
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
                            <img src="${resouceUrl}/images/list02/floor.png">
                        </div>
                    </div>
                    <div>
                        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3959.149045321932!2d125.64847471470783!3d7.1087201180555155!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x32f96c1f5f3eb8f3%3A0x73e811d90f3a5667!2zTWFyeWtub2xsIERyLCBCdWhhbmdpbiwgRGF2YW8gQ2l0eSwgRGF2YW8gZGVsIFN1ciwg7ZWE66as7ZWA!5e0!3m2!1sko!2skr!4v1591177448478!5m2!1sko!2skr" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!--main_cont-->

<%@include file="../base/footer.jsp" %>
</body>

</html>
