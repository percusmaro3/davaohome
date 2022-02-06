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
    <c:set var="depth2Text"><fmt:message key="menu.outline"/></c:set>
<c:set var="depth2Url" value="/${language}/company/outline" />

<%@include file="../../base/subTitle.jsp" %>

<div class="infomation">
    <div class="contents-wrap">
        <div class="explain">
            <div class="thumnail"><img src="${resouceUrl}/images/infomation/infomation01.jpg"></div>
            <div class="textBox">
                <div class="subjectLine">
                    <div class="subject"><fmt:message key="menu.outline"/></div>
                    <div class="en">NETWORK</div>
                </div>

                <div class="substance">
                    <fmt:message key="company.outline.titleSub"/>
                </div>

                <div class="contText">
                    <fmt:message key="company.outline.desc"/>
                </div>
            </div>
        </div>

        <div class="infoList">
            <ul>
                <li>
                    <div class="subject"><fmt:message key="company.outline.companyName"/></div>
                    <div class="line"></div>
                    <div class="subs">
                        <fmt:message key="company.outline.corporation"/> </br>
                        Wise Solutions
                    </div>
                </li>

                <li>
                    <div class="subject">CEO</div>
                    <div class="line"></div>
                    <div class="subs">
                        Wise Solution</br>
                        <fmt:message key="company.outline.eiji"/>
                    </div>
                </li>

                <li>
                    <div class="subject"><fmt:message key="common.address"/></div>
                    <div class="line"></div>
                    <div class="subs">
                        <fmt:message key="common.wiseAddress"/>
                    </div>
                </li>

                <li>
                    <div class="subject"><fmt:message key="company.outline.employNumber"/></div>
                    <div class="line"></div>
                    <div class="subs">
                        <fmt:message key="company.outline.domestic"/> 10<fmt:message key="company.outline.person"/></br>
                        <fmt:message key="company.outline.overseas"/> 74<fmt:message key="company.outline.person"/>
                    </div>
                </li>

                <li>
                    <div class="subject"><fmt:message key="company.outline.businessField"/></div>
                    <div class="line"></div>
                    <div class="subs">
                        <fmt:message key="menu.communication"/>/<fmt:message key="menu.realstate"/></br>
                        <fmt:message key="menu.fashion"/>/<fmt:message key="menu.tour"/>/<br/><fmt:message key="menu.franchise"/>
                    </div>
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