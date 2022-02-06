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

    <c:set var="title"><fmt:message key="menu.recruit"/></c:set>
<c:set var="backImg" value="${resouceUrl}/images/recruit/recruitTitleimg.jpg" />
    <c:set var="titleSubText"><fmt:message key="recruit.title"/></c:set>
    <c:set var="depth1Text"><fmt:message key="menu.recruit"/></c:set>
<c:set var="depth1Url" value="" />
    <c:set var="depth2Text"><fmt:message key="menu.rightPeople"/></c:set>
<c:set var="depth2Url" value="/${language}/recruit/homeFuture" />

<%@include file="../../base/subTitle.jsp" %>


<div class="recruit">
    <div class="talented-wrap">
        <dl class="list">
            <dd>
                <div class="cir">
                    <div class="sloganKr"><fmt:message key="recruit.rightPeople.integrity"/></div>
                    <div class="sloganEn">Integrity</div>
                </div>

                <div class="line"></div>

                <div class="subs"><fmt:message key="recruit.rightPeople.integrityDesc"/></div>
            </dd>


            <dd>
                <div class="cir">
                    <div class="sloganKr"><fmt:message key="recruit.rightPeople.communication"/></div>
                    <div class="sloganEn">Communication</div>
                </div>

                <div class="line"></div>

                <div class="subs">
                    <fmt:message key="recruit.rightPeople.communicationDesc"/>
                </div>
            </dd>


            <dd>
                <div class="cir">
                    <div class="sloganKr"><fmt:message key="recruit.rightPeople.vocation"/></div>
                    <div class="sloganEn">Vocation</div>
                </div>

                <div class="line"></div>

                <div class="subs">
                    <fmt:message key="recruit.rightPeople.vocationDesc"/>
                </div>
            </dd>

        </dl>
    </div>

</div>



<%@include file="../../base/footer.jsp" %>
</section>

</body>
<%@include file="../../base/includeJsResources.jsp" %>
</html>