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
    <c:set var="depth2Text"><fmt:message key="menu.promotionMaterial"/></c:set>
    <c:set var="depth2Url" value="/${language}/notice/promotion" />

<%@include file="../../base/subTitle.jsp" %>


<div class="promote">
    <div class="titleArea">
        <div class="title"><fmt:message key="menu.promotionMaterial"/></div>
        <div class="subtitle"><fmt:message key="notice.promotionMaterial.sub"/></div>
    </div>

    <ul class="promoteList">
        <li>
            <a href="http://dav.gg-trip.com/dav/wisehome/pdf/Wise%20brochure_${language}.pdf">
                <div class="thum">
                    <img src="http://dav.gg-trip.com/dav/wisehome/pdf/brochure_${language}.png"></div>
                <div class="textArea">
                    <div class="date">2019.04.14</div>
                    <div class="subject"><fmt:message key="notice.promotionMaterial.pdf1"/></div>
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