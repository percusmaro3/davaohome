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
    <c:set var="depth2Text"><fmt:message key="menu.ceoMessage"/></c:set>
<c:set var="depth2Url" value="/${language}/company/ceo" />

<%@include file="../../base/subTitle.jsp" %>


<div class="infomation" style="padding-bottom:0;">
    <div class="ceo-wrap">
        <div class="inner">
            <div class="thumLine">
                <div class="ceo"><img src="${resouceUrl}/images/infomation/ceo.jpg"></div>

                <div class="whitebox">
                    <div class="text">
                        <div class="slogan">
                            <fmt:message key="company.ceoMessage.title"/>
                        </div>

                        <div class="name"><fmt:message key="company.ceoMessage.name"/></div>
                        <div class="sign"><img src="${resouceUrl}/images/infomation/sign.png"></div>
                    </div>
                </div>

                <div class="greenbox"></div>
            </div>

            <div class="textBox">
                <div class="subjectLine">
                    <div class="subject"><fmt:message key="menu.ceoMessage"/></div>
                    <div class="en">Ceo MESSAGE</div>
                </div>

                <div class="contText">
                    <fmt:message key="company.ceoMessage.desc1"/> </br>
                    <fmt:message key="company.ceoMessage.desc2"/>
                    </br></br>
                    <fmt:message key="company.ceoMessage.desc3"/>
                    </br></br>
                    <fmt:message key="company.ceoMessage.desc4"/>
                    </br></br>
                    <fmt:message key="company.ceoMessage.desc5"/>
                    </br></br>
                    <fmt:message key="company.ceoMessage.desc6"/>
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