<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <%@include file="../base/includeJsResources.jsp" %>
    <link rel="stylesheet" href="${resouceUrl}/css/introduce.css${tag}">
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
        </div>
        <div class="introduce_cont">
            <div class="introduce">
                <ul>
                    <li>
                        <a href="/${language}/list01"><img src="${resouceUrl}/images/introduce/list1.png"></a>
                    </li>
                    <li>
                        <p class="sub_title_center">MALDIVES Oasis</p>
                        <div class="introduce_table">
                            <ul class="table_tit">
                                <li>구조/객식유형</li>
                                <li>넓이(m²)</li>
                                <li>참고가격</li>
                                <li>매달 참고가격</li>
                            </ul>
                            <!--table 타이틀-->
                            <ul class="table_cont">
                                <li class="tbg_color high  thin">스튜디오(STUDIO)</li>
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
                    </li>
                </ul>
                <!--1번-->

                <ul>
                    <li>
                        <a href="/${language}/list02"><img src="${resouceUrl}/images/introduce/list2.png"></a>
                    </li>
                    <li>
                        <p class="sub_title_center">Dusit Thani RESIDENCE DAVAO</p>
                        <div class="introduce_table">
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
                    </li>
                </ul>
                <!--2번-->
                <ul>
                    <li>
                        <a href="/${language}/list03"><img src="${resouceUrl}/images/introduce/list3.png"></a>
                    </li>
                    <li>
                        <p class="sub_title_center">Two Lakeshore Drive</p>
                        <div class="introduce_table">
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
                    </li>
                </ul>
                <!--3번-->
            </div>

        </div>

    </div>
    <!--main_cont-->

<%@include file="../base/footer.jsp" %>

</body>

</html>
