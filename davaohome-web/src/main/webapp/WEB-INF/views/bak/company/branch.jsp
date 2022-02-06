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
    <c:set var="depth2Text"><fmt:message key="menu.branch"/></c:set>
    <c:set var="depth2Url" value="/${language}/company/branch" />

    <%@include file="../../base/subTitle.jsp" %>

<div class="infomation" style="padding-top:0">
    <dl class="network-wrap">
        <div class="inner">
            <div class="centerLine"></div>
        </div>

        <dd class="bg">
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.japan"/></div>
                    <div class="name"><fmt:message key="company.branch.japan"/> </br><span><fmt:message key="company.branch.wiseSolutions"/></span></div>
                </div>

                <div class="substance"><fmt:message key="company.branch.japanDesc1"/></div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.korea"/></div>
                    <div class="name"><fmt:message key="company.branch.korea"/> </br><span><fmt:message key="company.branch.sco"/></span></div>
                </div>

                <div class="substance"><fmt:message key="company.branch.koreaDesc"/></div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.america"/></div>
                    <div class="name"><fmt:message key="company.branch.america"/> </br> <fmt:message key="company.branch.blue"/></div>
                </div>

                <div class="substance"><fmt:message key="company.branch.americaDesc"/></div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.thai"/></div>
                    <div class="name"><fmt:message key="company.branch.thai"/> </br> <fmt:message key="company.branch.wiseInCorp"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.thaiDesc1"/>
                </div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.thai"/></div>
                    <div class="name"><fmt:message key="company.branch.thai"/> </br><fmt:message key="company.branch.gogoTrip"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.thaiDesc2"/>
                </div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.thai"/></div>
                    <div class="name"><fmt:message key="company.branch.wataCafe"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.thaiDesc3"/>
                </div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.taiwan"/></div>
                    <div class="name"><fmt:message key="company.branch.taiwan"/> </br><fmt:message key="company.branch.rungwa"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.taiwanDesc"/>
                </div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.hongkong"/></div>
                    <div class="name"><fmt:message key="company.branch.hongkong"/> </br><fmt:message key="company.branch.yuyusim"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.hongkongDesc"/>
                </div>
            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.phillippine"/></div>
                    <div class="name"><fmt:message key="company.branch.phillippine"/> </br><fmt:message key="company.branch.hAndY"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.phillippineDesc"/>
                </div>
            </div>
        </dd>


        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.england"/></div>
                    <div class="name"><fmt:message key="company.branch.england"/> </br><fmt:message key="company.branch.wkr"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.englandDesc"/>
                </div>
            </div>
        </dd>


        <dd>
            <div class="inner">
                <div class="subject">
                    <div class="loca"><fmt:message key="common.japan"/></div>
                    <div class="name"><fmt:message key="company.branch.linton"/></div>
                </div>

                <div class="substance">
                    <fmt:message key="company.branch.japanDesc2"/>
                </div>
            </div>
        </dd>
    </dl>
</div>


<%@include file="../../base/footer.jsp" %>
</section>

</body>
<%@include file="../../base/includeJsResources.jsp" %>
</html>