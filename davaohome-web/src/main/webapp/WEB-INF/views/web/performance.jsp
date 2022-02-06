<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <%@include file="../base/includeJsResources.jsp" %>
    <link rel="stylesheet" href="${resouceUrl}/css/performance.css${tag}">
    <link rel="stylesheet" href="${resouceUrl}/css/responsive.css${tag}">
</head>

<%@include file="../base/header.jsp" %>
    <!--header-->

    <div class="main">
        <div class="page_tit">
            <p>운용실적</p>
        </div>
        <div class="location">
            <span><a href="/${language}/home"><img src="${resouceUrl}/images/home_btn.png"> HOME</a></span>
            <span>></span>
            <span><a href="/${language}/introduce">운용실적</a></span>
        </div>

        <div class="pf_cont">
            <img src="${resouceUrl}/images/performance/top.png">

            <div class="pt_cont_in">
                <h2 class="sub_title2">■ 부동산 운영 실적 예시</h2>
                <p class="sub_text">
                    프리세일 (건설 전에 물건)에서 구입 한 건물이 완성시에는 약 30 %의 가격이 상승 되었습니다. 완공 후 내장 인테리어 후에 임대로 수익을 올리고 있습니다.

                </p><br>

                <p class="sub_text_bold">
                    [프리세일 (건설 전 부동산)의 구매 실적]
                </p>
                <div class="pt_table">
                    <ul class="pt_table_tit">
                        <li>건물명</li>
                        <li>넓이(m²)</li>
                        <li>개발자 이름</li>
                    </ul>
                    <!--table 타이틀-->
                    <ul class="pt_cont">
                        <li class="tbg_color thin">Abreeza place Tower 1</li>
                        <li>53sqm(m²)</li>
                        <li class="tbg_color">alveo</li>
                    </ul>
                    <!--1line-->
                </div>
                <!--table01-->
                <div class="pt_img1"><img src="${resouceUrl}/images/performance/main.png"></div>
                <h2 class="sub_title2">■ 구매~임대까지 흐름</h2>
                <div class="pt_img2"><img src="${resouceUrl}/images/performance/course.png"></div><br>

                <h2 class="sub_title2">■ 프리세일 (완성 전에 구매)</h2>
                <p class="sub_text_bold">1) 구입시기 2014년10월</p>
                <div class="pt_table">
                    <ul class="pt_table_tit4">
                        <li>&nbsp;</li>
                        <li>페소</li>
                        <li class="thin">원 (1 페소 24.65원 환산)</li>
                    </ul>
                    <!--table 타이틀-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">금액</li>
                        <li>5399502.71</li>
                        <li class="tbg_color">133,097,741</li>
                        <li>5399502.71</li>
                    </ul>
                </div>
                <!--table02-->
                <p class="sub_text">- 결제 내역 예약</p>
                <div class="pt_table">
                    <ul class="pt_table_tit4">
                        <li>DATA</li>
                        <li>CHECK NUMBER</li>
                        <li>페소</li>
                        <li>&nbsp;</li>
                    </ul>
                    <!--table 타이틀-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">10/24/14</li>
                        <li>CARD</li>
                        <li class="tbg_color">50,000.00</li>
                        <li>예약금</li>
                    </ul><!--1-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">11/14/14</li>
                        <li>30401</li>
                        <li class="tbg_color">467,800.00</li>
                        <li>계약금</li>
                    </ul><!--2-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">12/14/14</li>
                        <li>6302</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--3-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">01/14/15</li>
                        <li>6303</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--4-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">02/14/15</li>
                        <li>6304</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--5-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">03/14/15</li>
                        <li>6305</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--6-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">04/14/15</li>
                        <li>6306</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--7-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">05/14/15</li>
                        <li>30402</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--8-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">06/14/15</li>
                        <li>30403</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--9-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">07/15/15</li>
                        <li>30404</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--10-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">08/14/15</li>
                        <li>30405</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--11-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">09/14/15</li>
                        <li>30406</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--12-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">10/14/15</li>
                        <li>30407</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--13-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">11/14/15</li>
                        <li>30408</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--14-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">12/14/15</li>
                        <li>30409</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--15-->
                     <ul class="pt_cont4">
                        <li class="tbg_color">01/14/16</li>
                        <li>30410</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--16-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">02/14/16</li>
                        <li>30411</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--16-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">03/14/16</li>
                        <li>30412</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--17-->
                    <ul class="pt_cont4">
                        <li class="tbg_color">04/14/16</li>
                        <li>30413</li>
                        <li class="tbg_color">115,100.00</li>
                        <li>&nbsp;</li>
                    </ul><!--17-->
                    <ul class="pt_cont4">
                        <li class="tbg_color high3">05/14/16</li>
                        <li>Registration,Documentary,<br>Stamp, Tax</li>
                        <li class="tbg_color high3">221502.71</li>
                        <li>각종 세금 지불<br>+매월 지불</li>
                    </ul><!--17-->
                </div><!--결제내역-->
                
                <p class="sub_text_bold">2) 2017년2월 시점</p>
                <div class="pt_table">
                    <ul class="pt_table_tit">
                        <li>&nbsp;</li>
                        <li>페소</li>
                        <li class="thin2">원(1 페소 24.65원 환산)</li>
                    </ul>
                    <!--table 타이틀-->
                    <ul class="pt_cont">
                        <li class="tbg_color table_bold">완성시 판매금액</li>
                        <li>7150650</li>
                        <li class="tbg_color">176,263,522</li>
                    </ul>
                </div>
                <p class="table_text">※ 현지 브로커 실제 판매 금액</p>
                <!--table02-->
                <div class="pt_img1"><img src="${resouceUrl}/images/performance/detail.png"></div>

                <p class="sub_text_bold">3) 완성시점</p>
                <div class="pt_table">
                    <ul class="pt_table_tit">
                        <li>&nbsp;</li>
                        <li>페소</li>
                        <li class="thin2">원(1 페소 24.65원 환산)</li>
                    </ul>
                    <!--table 타이틀-->
                    <ul class="pt_cont">
                        <li class="tbg_color table_bold">완성 시점에서의 이익 1)-2)</li>
                        <li>1751147.29</li>
                        <li class="tbg_color">199,281,301</li>
                    </ul>
                </div><!--table-->
            </div><!--pt_cont_in--><br>
            <div class="pt_cont_in">
                 <h2 class="sub_title2">■ 임대의 장점</h2>
                <p class="sub_text">
                    대부분의 물건이 골조 상태로 전달됩니다.
용도에 맞게 장식을 넣는 것이 좋습니다. 당사 구입 물건은 당사 제휴 업체를 통하여 인테리어를 넣었습니다.
                </p>
                <div class="pt_table">
                    <ul class="pt_table_tit">
                        <li>&nbsp;</li>
                        <li>페소</li>
                        <li class="thin2">원(1 페소 24.65원 환산)</li>
                    </ul>
                    <!--table 타이틀-->
                    <ul class="pt_cont">
                        <li class="tbg_color table_bold thin">인테리어 대금<br>(가구, 가전, 생활 용품)</li>
                        <li class="high">508022</li>
                        <li class="tbg_color high">12,522,742</li>
                    </ul>
                </div><!--table-->
                <p class="sub_text_bold">[인테리어 사진]</p>
                <div class="pt_img2"><img src="${resouceUrl}/images/performance/interior.png"></div><br>
                <h2 class="sub_title2">■ 단기 임대 실적</h2>
                <p class="sub_text_bold">4월 18일 개시 시작</p>
                <div class="pt_table">
                    <ul class="pt_table_tit2">
                        <li>&nbsp;</li>
                        <li>모집매체</li>
                        <li>이용기간</li>
                        <li>이용 인원수</li>
                        <li>이용 임대료(페소)</li>
                        <li class="thin2">원(1페소 24.65원 환산)</li>
                    </ul>
                    <ul class="pt_cont2">
                        <li>4월</li>
                        <li>airbnb</li>
                        <li>4/24~4/30</li>
                        <li>2명 이용</li>
                        <li>12,000</li>
                        <li>295,800</li>
                    </ul>
                    <ul class="pt_cont2">
                        <li>5월</li>
                        <li>현지 SNS</li>
                        <li>5/3~5/8</li>
                        <li>2명 이용</li>
                        <li>14,000</li>
                        <li>345,100</li>
                    </ul>
                    <ul class="pt_cont2">
                        <li>5월</li>
                        <li>airbnb</li>
                        <li>5/11~5/26</li>
                        <li>2명 이용</li>
                        <li>34,161</li>
                        <li>842,068</li>
                    </ul>
                    <ul class="pt_cont3">
                        <li class="sub_text_bold">5월 단월 총</li>
                        <li class="sub_text_bold">48,161</li>
                        <li class="sub_text_bold"> 1,187,168</li>
                    </ul>
                    <ul class="pt_cont2">
                         <li class="sub_text_bold">&nbsp;</li>
                        <li class="sub_text_bold">&nbsp;</li>
                        <li class="sub_text_bold">&nbsp;</li>
                        <li class="sub_text_bold">&nbsp;</li>
                        <li class="sub_text_bold thin2"> 수익률(그로스)</li>
                        <li class="sub_text_bold">11%</li>
                    </ul>
                </div><!--table-->
            </div><!--cont_in-->
             <div class="pt_cont_in">
                  <div class="subtit_line"></div>
                <h2 class="sub_title2">투자 비용 회수</h2>
                 <h2 class="sub_title2">■ 투자 비용 회수의 절차</h2>
                <p class="sub_text">
                    임대를 하지 않고 사정이 있어 투자 비용을 회수 하셔야 한다면 저희 회사의 에이전트와 파트너를 맺은 에이전시를 통해 콘도를 매매해드립니다. 또한 콘도 매매후 회사의 통장을 통해 한국으로 해외송금을 해드립니다.

                </p>
            </div>
        </div>
    </div>

        <!--main_cont-->

<%@include file="../base/footer.jsp" %>
</body>

</html>
