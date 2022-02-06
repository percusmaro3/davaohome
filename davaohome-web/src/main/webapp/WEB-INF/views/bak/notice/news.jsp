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

    <c:set var="title"><fmt:message key="menu.companyNotice"/></c:set>
    <c:set var="backImg" value="${resouceUrl}/images/company/companyTitleimg.jpg" />
    <c:set var="titleSubText"><fmt:message key="notice.promotionMaterial.title"/></c:set>
    <c:set var="depth1Text" ><fmt:message key="menu.companyNotice"/></c:set>
    <c:set var="depth1Url" value="" />
    <c:set var="depth2Text">News</c:set>
    <c:set var="depth2Url" value="/${language}/notice/news" />

    <%@include file="../../base/subTitle.jsp" %>


    <div class="promote">
        <div class="titleArea">
            <div class="title"><fmt:message key="news.title"/></div>
            <div class="subtitle"><fmt:message key="news.desc"/></div>
        </div>

        <ul class="promoteList">
            <li>
                <a href="http://news.mtn.co.kr/v/2016022511214680938">
                    <div class="thum">
                        <img src="http://dav.gg-trip.com/dav/wisehome/news/news1.png"></div>
                    <div class="textArea">
                        <div class="date">2016.02.25</div>
                        <div class="subject"><fmt:message key="news.news1.title"/></div>
                    </div>
                </a>
            </li>
        </ul>
    </div>


    <%@include file="../../base/footer.jsp" %>
</section>

</body>
<%@include file="../../base/includeJsResources.jsp" %>
</html>