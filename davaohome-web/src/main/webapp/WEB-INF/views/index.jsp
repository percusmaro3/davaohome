<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="ko"><head>


<html lang="ko">
<head>
    <title>Wise Holdings</title>
    <%@include file="./base/includeMeta.jsp" %>
    <%@include file="./base/includeResources.jsp" %>


</head>

<body id="main">
<%@include file="./base/header.jsp" %>

<div class="fullpage">
    <section id="mainVisual">
        <div class="inner">
            <ul class="bxslider">
                <li>
                    <a href="/${language}/company">
                        <div class="cont">
                            <div class="graph">
                                <img src="${resouceUrl}/images/visual01Graph_${language}.png">
                            </div>

                            <div class="textArea">
                                <div class="subject"><span>Growing</span> Rapidly</div>
                                <div class="subs">
                                    <fmt:message key="main.slogan1_1"/> </br>
                                    <fmt:message key="main.slogan1_2"/> </br>
                                    <fmt:message key="main.slogan1_3"/>
                                </div>
                            </div>
                        </div>

                        <div class="bg"><img src="${resouceUrl}/images/visual01Bg.jpg"></div>
                    </a>
                </li>

                <li>
                    <a href="/${language}/company">
                        <div class="cont">
                            <div class="textArea-2nd textArea">
                                <div class="subject">Various Businesses</div>
                                <div class="subs">
                                    <fmt:message key="main.slogan2_1"/>
                                    <fmt:message key="main.slogan2_2"/>
                                    <fmt:message key="main.slogan2_3"/>
                                </div>
                            </div>
                        </div>

                        <div class="bg"><img src="${resouceUrl}/images/visual01Bg.jpg"></div>
                    </a>
                </li>
            </ul>
        </div>
    </section>

    <section id="shortcut">
        <ul>
            <li>
                <div class="textArea">
                    <div class="title"><a href="/${language}/business/comm">COMMUNICATION</a></div>
                    <div class="line"></div>
                    <div class="subject"><fmt:message key="common.communication"/></div>

                    <c:choose>
                        <c:when test="${Device == 'PC'}">
                            <div class="substance"><fmt:message key="main.communicationSub"/></div>
                        </c:when>
                        <c:otherwise>
                            <div class="substance"><fmt:message key="main.communicationSubMobile"/></div>
                        </c:otherwise>
                    </c:choose>

                </div>
                <div class="bg">
                    <img src="${resouceUrl}/images/shortcut01.jpg"></div>
            </li>

            <li>
                <div class="textArea">
                    <div class="title"><a href="/${language}/business/fashion">FASHION</a></div>
                    <div class="line"></div>
                    <div class="subject"><fmt:message key="common.fashion"/></div>
                    <div class="substance"><fmt:message key="main.fashionSub"/></div>
                </div>
                <div class="bg"><img src="${resouceUrl}/images/shortcut02.jpg"></div>
            </li>

            <li>
                <div class="textArea">
                    <div class="title"><a href="/${language}/business/realEstate">LAND</a></div>
                    <div class="line"></div>
                    <div class="subject"><fmt:message key="common.realstate"/></div>
                    <div class="substance"><fmt:message key="main.realstateSub"/></div>
                </div>
                <div class="bg"><img src="${resouceUrl}/images/shortcut03.jpg"></div>
            </li>

            <li>
                <div class="textArea">
                    <div class="title"><a href="/${language}/business/franchise">FRANCHISE</a></div>
                    <div class="line"></div>
                    <div class="subject"><fmt:message key="common.franchise"/></div>
                    <div class="substance"><fmt:message key="main.franchiseSub"/></div>
                </div>
                <div class="bg"><img src="${resouceUrl}/images/shortcut04.jpg"></div>
            </li>

            <li>
                <div class="textArea">
                    <div class="title"><a href="/${language}/business/tour">TOUR</a></div>
                    <div class="line"></div>
                    <div class="subject"><fmt:message key="common.tour"/></div>
                    <div class="substance"><fmt:message key="main.tourSub"/></div>
                </div>
                <div class="bg"><img src="${resouceUrl}/images/shortcut05.jpg"></div>
            </li>
        </ul>
    </section>

    <section id="network">
        <div class="inner">

            <div class="cont">
                <div class="mainTitle">
                    <a href="/${language}/company/globalNetwork"><div class="title">GLOBAL <span class="keycolor">NETWORK</span></div></a>
                    <a href="/${language}/company/globalNetwork"><div class="substance"><fmt:message key="main.globalNetworSub"/></div></a>
                </div>
            </div>
            <div class="wordmap"><img src="${resouceUrl}/images/wordmap_${language}.png"></div>
            <div class="bg">
                <div class="background"><img src="${resouceUrl}/images/networkBg.jpg"></div>
            </div>
        </div>
    </section>

    <section id="news">
        <div class="inner">
            <Div class="cont">
                <div class="mainTitle">
                    <div class="title"><fmt:message key="menu.companyNotice"/></div>
                    <div class="substance"><span class="keycolor"><fmt:message key="main.companyNoticeSub"/></div>
                </div>


                <ul class="newsList">
                    <%--<a href="http://news.mtn.co.kr/v/2016022511214680938">--%>
                    <li>
                        <div class="category keycolor">MTN NEWS</div>
                        <div class="subject">
                            <fmt:message key="news.news1.title"/></div>
                        <div class="contText">
                            <fmt:message key="news.news1.desc"/>
                        </div>

                        <div class="date">2016-02-25</div>
                    </li>
                    <%--</a>--%>
                    <li>
                    </li>
                    <li>
                    </li>
                    <li>
                    </li>
                </ul>

            </div>
            <div class="bg"><img src="${resouceUrl}/images/news.jpg"></div>
        </div>
    </section>
</div>


<%@include file="./base/footer.jsp" %>
</body>

<%@include file="./base/includeJsResourcesMain.jsp" %>


</html>