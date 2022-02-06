<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="ko"><head>


    <html lang="ko">
    <head>
        <title>Wise Holdings</title>
        <%@include file="../../base/includeMeta.jsp" %>
        <%@include file="../../base/includeResources.jsp" %>

    </head>

<body class="wrap">
<section id="sub">
<%@include file="../../base/header.jsp" %>

    <c:set var="title"><fmt:message key="menu.companyInfo"/></c:set>
    <c:set var="backImg" value="${resouceUrl}/images/infomation/infomationTitle.jpg" />
    <c:set var="titleSubText"><fmt:message key="company.title"/></c:set>
    <c:set var="depth1Text"><fmt:message key="menu.companyInfo"/></c:set>
<c:set var="depth1Url" value="/${language}/company" />
    <c:set var="depth2Text"><fmt:message key="menu.companyHistory"/></c:set>
<c:set var="depth2Url" value="/${language}/company/history" />

<%@include file="../../base/subTitle.jsp" %>


<div class="history">
    <div class="title"><fmt:message key="menu.companyHistory"/><span>HISTORY</span></div>

    <div class="centerLine"></div>

    <dl class="hitoryList">
        <dd>
            <ul>
                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum01.jpg">
                </li>
                <li class="rightText">
                    <div class="year">2010</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2010"/></div>
                    <div class="encont">WISE SOLUTIONS CO.,LTD</div>
                </li>
            </ul>
        </dd>

        <dd>
            <ul>

                <li class="leftText">
                    <div class="year">2011</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2011"/></div>
                    <div class="encont">SCO CO.,LTD</div>
                </li>

                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum02.jpg">
                </li>
            </ul>
        </dd>



        <dd>
            <ul>
                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum03.jpg">
                </li>
                <li class="rightText">
                    <div class="year">2012</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2012"/></div>
                    <div class="encont">BLUE OCEAN CO.,LTD</div>
                </li>
            </ul>
        </dd>

        <dd>
            <ul>

                <li class="leftText">
                    <div class="year">2013</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2013"/></div>
                    <div class="encont">WISEIN CORPORATION CO., LTD</div>
                </li>

                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum04.jpg">
                </li>
            </ul>
        </dd>



        <dd>
            <ul>
                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum05.jpg">
                </li>
                <li class="rightText">
                    <div class="year">2014</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2014"/></div>
                    <div class="encont">LE WANG TONG ENTERPRISE CO., LTD</div>
                </li>
            </ul>
        </dd>

        <dd>
            <ul>

                <li class="leftText">
                    <div class="year">2016</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2016"/></div>
                    <div class="encont">UUSIM LIMITED CO., LTD</div>
                </li>

                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum06.jpg">
                </li>
            </ul>
        </dd>

        <dd>
            <ul>
                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum07.jpg">
                </li>
                <li class="rightText">
                    <div class="year">2017</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2017"/></div>
                    <div class="encont">LE WANG TONG ENTERPRISE CO., LTD.</div>
                </li>
            </ul>
        </dd>

        <dd>
            <ul>

                <li class="leftText">
                    <div class="year">2018</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2018"/></div>
                    <div class="encont">WKRINVESTMENTS LIMITED CO., LTD</div>
                </li>

                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum08.jpg">
                </li>
            </ul>
        </dd>


        <dd>
            <ul>
                <li class="thum">
                    <img src="${resouceUrl}/images/infomation/historyThum09.jpg">
                </li>

                <li class="rightText">
                    <div class="year">2019</div>
                    <div class="cont"><fmt:message key="company.companyHistory.desc2019"/> </div>
                    <div class="encont">LINTON JAPAN CO., LTD</div>
                </li>
            </ul>
        </dd>

    </dl>
</div>


<%@include file="../../base/footer.jsp" %>
</section>

</body>
<%@include file="../../base/includeJsResources.jsp" %>
</html>