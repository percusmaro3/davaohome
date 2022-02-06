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
    <c:set var="depth2Text"><fmt:message key="menu.companyMap"/></c:set>
<c:set var="depth2Url" value="/${language}/company/contact" />

<%@include file="../../base/subTitle.jsp" %>

<div class="location">
    <div class="inner">
        <div class="title"><fmt:message key="menu.companyMap"/><span>LOCATION</span></div>

        <div class="map">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3240.492950109171!2d139.70481766527092!3d35.689485180192335!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x60188cc3518f6c25%3A0x6002fa967c9d42bf!2zMi1jaMWNbWUtNSBTaGluanVrdSwgU2hpbmp1a3Uta3UsIFTFjWt5xY0tdG8gMTYwLTAwMjIg7J2867O4!5e0!3m2!1sko!2skr!4v1561385067109!5m2!1sko!2skr" width="100%" height="100%" frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>

        <div class="info">
            <ul>
                <li>
                    <div class="subject"><fmt:message key="common.address"/></div>
                    <div class="subs"><fmt:message key="common.wiseAddress"/></div>
                </li>

                <li>
                    <div class="subject"><fmt:message key="common.tel"/></div>
                    <div class="subs">03-6233-8723</div>
                </li>

                <li>
                    <div class="subject"><fmt:message key="common.email"/></div>
                    <div class="subs">kanri@wise-ss.jp</div>
                </li>
            </ul>
        </div>
    </div>

</div>

<%@include file="../../base/footer.jsp" %>
</section>


</body>
<%@include file="../../base/includeJsResources.jsp" %>
</html>