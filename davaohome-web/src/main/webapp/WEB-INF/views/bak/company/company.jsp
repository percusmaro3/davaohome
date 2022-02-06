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

<div class="sub-B-TitleImg">
    <div class="cont">
        <div class="krTitle"><fmt:message key="menu.companyInfo"/></div>
        <div class="enTitle">COMPANY</div>
        <div class="substance"><fmt:message key="company.title"/></div>
    </div>

    <div class="bg"><img src="${resouceUrl}/images/infomation/infomation-B-Title.jpg"></div>
</div>


<div class="infomation" style="padding:0;">
    <div class="info-B-Wrap">
        <dl class="infoList">
            <dd class="imgBgSec">
                <div class="inner">
                    <div class="textArea">
                        <div class="num">
                            <img src="${resouceUrl}/images/infomation/num01.png">
                        </div>
                        <div class="subject"><fmt:message key="menu.ceoMessage"/></div>
                        <div class="line"></div>
                        <div class="enSubject">CEO Message</div>
                        <div class="substance"><fmt:message key="company.ceoMessageSub"/></div>
                        <div class="moreView"><a href="/${language}/company/ceo"><img src="${resouceUrl}/images/infomation/moreview_${language}.png"></a></div>
                    </div>

                    <div class="threeThum textright">
                        <div><img src="${resouceUrl}/images/infomation/infoSec01Thum01.jpg"></div>
                        <div><img src="${resouceUrl}/images/infomation/infoSec01Thum02.jpg"></div>
                        <div><img src="${resouceUrl}/images/infomation/infoSec01Thum03.jpg"></div>
                    </div>
                </div>
            </dd>

            <dd>
                <div class="inner">
                    <div class="thum"><img src="${resouceUrl}/images/infomation/infoSec02.png"></div>
                    <div class="textArea">
                        <div class="num">
                            <img src="${resouceUrl}/images/infomation/num02.png">
                        </div>

                        <div class="subject"><fmt:message key="menu.companyHistory"/></div>
                        <div class="line"></div>
                        <div class="enSubject">HISTORY</div>
                        <div class="substance"><fmt:message key="company.historySub"/></div>
                        <div class="moreView"><a href="/${language}/company/history"><img src="${resouceUrl}/images/infomation/moreview_${language}.png"></a></div>
                    </div>
                </div>
            </dd>

            <dd class="bgSec">
                <div class="inner">
                    <div class="textArea">
                        <div class="num">
                            <img src="${resouceUrl}/images/infomation/num03.png">
                        </div>

                        <div class="subject"><fmt:message key="menu.globalNetwork"/></div>
                        <div class="line"></div>
                        <div class="enSubject">Global Network</div>
                        <div class="substance"><fmt:message key="company.globalNetworkSub"/></div>
                        <div class="moreView"><a href="/${language}/company/globalNetwork"><img src="${resouceUrl}/images/infomation/moreview_${language}.png"></a></div>
                    </div>

                    <div class="thum"><img src="${resouceUrl}/images/infomation/infoSec03.jpg"></div>
                </div>
            </dd>


            <dd>
                <div class="inner">
                    <div class="thum"><img src="${resouceUrl}/images/infomation/infoSec04.png"></div>
                    <div class="textArea">

                        <div class="num">
                            <img src="${resouceUrl}/images/infomation/num04.png">
                        </div>

                        <div class="subject"><fmt:message key="menu.managementIdea"/></div>
                        <div class="line"></div>
                        <div class="enSubject">Value Innovation</div>
                        <div class="substance"><fmt:message key="company.managementIdeaSub"/></div>
                        <div class="moreView"><a href="/${language}/company/management"><img src="${resouceUrl}/images/infomation/moreview_${language}.png"></a></div>
                    </div>
                </div>
            </dd>

            <dd class="imgBgSec mar_t80" >

                <div class="inner">
                    <div class="threeThum">
                        <div><img src="${resouceUrl}/images/infomation/infoSec05Thum01.jpg"></div>
                        <div><img src="${resouceUrl}/images/infomation/infoSec05Thum02.jpg"></div>
                        <div><img src="${resouceUrl}/images/infomation/infoSec05Thum03.jpg"></div>
                    </div>

                    <div class="textArea">
                        <div class="num">
                            <img src="${resouceUrl}/images/infomation/num05.png">
                        </div>
                        <div class="subject"><fmt:message key="menu.branch"/></div>
                        <div class="line"></div>
                        <div class="enSubject">Global Branch</div>
                        <div class="substance"><fmt:message key="company.branchSub"/></div>
                        <div class="moreView"><a href="/${language}/company/branch"><img src="${resouceUrl}/images/infomation/moreview_${language}.png"></a></div>
                    </div>
                </div>
            </dd>


            <dd>
                <div class="inner">
                    <div class="textArea">
                        <div class="num">
                            <img src="${resouceUrl}/images/infomation/num06.png">
                        </div>

                        <div class="subject"><fmt:message key="menu.companyMap"/></div>
                        <div class="line"></div>
                        <div class="enSubject">Location</div>
                        <div class="substance"><fmt:message key="company.companyMapSub"/></div>
                        <div class="moreView"><a href="/${language}/company/contact"><img src="${resouceUrl}/images/infomation/moreview_${language}.png"></a></div>
                    </div>

                    <div class="thum"><img src="${resouceUrl}/images/infomation/infoSec06.png"></div>
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