﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

    <c:set var="title"><fmt:message key="menu.businessPart"/></c:set>
<c:set var="backImg" value="${resouceUrl}/images/business/businessTitle.jpg" />
    <c:set var="titleSubText"><fmt:message key="business.title"/></c:set>
    <c:set var="depth1Text"><fmt:message key="menu.businessPart"/></c:set>
<c:set var="depth1Url" value="/${language}/business" />
    <c:set var="depth2Text"><fmt:message key="menu.fashion"/></c:set>
<c:set var="depth2Url" value="/${language}/business/fashion" />

<%@include file="../../base/subTitle.jsp" %>


<div class="business">
    <div class="fashion business-wrap">
        <div class="inner">
            <div class="thum"><img src="${resouceUrl}/images/business/business05Thum.jpg"></div>
            <div class="textbox">
                <div class="subjectLine">
                    <div class="KR"><fmt:message key="menu.fashion"/></div>
                    <div class="EN">Fashion</div>
                </div>

                <div class="subs">
                    <fmt:message key="business.fashion.desc"/>
                </div>
            </div>
        </div>
    </div>
</div>



<%@include file="../../base/footer.jsp" %>
</section>

</body>
<%@include file="../../base/includeJsResources.jsp" %>
</html>