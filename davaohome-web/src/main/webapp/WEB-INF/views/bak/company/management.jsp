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
    <c:set var="depth2Text"><fmt:message key="menu.managementIdea"/></c:set>
<c:set var="depth2Url" value="/${language}/company/management" />

<%@include file="../../base/subTitle.jsp" %>


<div class="infomation">
    <div class="philosophy-wrap">
        <div class="section01">
            <div class="inner">
                <div class="thumLine"><img src="${resouceUrl}/images/infomation/infomation03Thum01.jpg"></div>
                <div class="textBox">
                    <div class="subjectLine">
                        <div class="subject"><fmt:message key="menu.managementIdea"/></div>
                        <div class="en">NETWORK</div>
                    </div>

                    <div class="num">01</div>
                    <div class="title"><fmt:message key="company.managementIdea.part1Title"/></div>
                    <div class="substance">
                        <fmt:message key="company.managementIdea.part1Desc1"/>
                        </br></br>
                        <fmt:message key="company.managementIdea.part1Desc2"/>
                    </div>
                </div>

            </div>
        </div>


        <div class="section02">
            <div class="s-o-box"></div>
            <div class="s-b-box"></div>
            <div class="textBox">
                <div class="num">02</div>
                <div class="title"><fmt:message key="company.managementIdea.part2Title"/></div>
                <div class="substance">
                    <fmt:message key="company.managementIdea.part2Desc1"/>
                </div>
            </div>
            <div class="thumLine"><img src="${resouceUrl}/images/infomation/infomation03Thum02.jpg"></div>
            <div class="s-g-box"></div>
        </div>




        <div class="section03">
            <div class="thumLine"><img src="${resouceUrl}/images/infomation/infomation03Thum03.jpg"></div>
            <div class="textBox">
                <div class="num">03</div>
                <div class="title"><fmt:message key="company.managementIdea.part3Title"/></div>
                <div class="substance">
                    <fmt:message key="company.managementIdea.part3Desc1"/>
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