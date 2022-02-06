<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!doctype html>
<html lang="ko"><head>


    <html lang="ko">
    <head>
        <title>Wise Holdings</title>
        <%@include file="../base/includeMeta.jsp" %>
        <%@include file="../base/includeResources.jsp" %>

    </head>

<body class="wrap">
<section id="sub">
<%@include file="../base/header.jsp" %>

<div class="sub-B-TitleImg">
    <div class="cont">
        <div class="krTitle"><fmt:message key="menu.businessPart"/></div>
        <div class="enTitle">BUSINESS</div>
        <div class="substance"><fmt:message key="business.title"/></div>
    </div>

    <div class="bg"><img src="${resouceUrl}/images/infomation/infomation-B-Title.jpg"></div>
</div>


<div class="business">
    <dl class="busi-B-Wrap">
        <dd>
            <div class="inner">
                <div class="textArea">
                    <div class="titleArea">
                        <div class="en"><img src="${resouceUrl}/images/business/busititle01.png"></div>
                        <div class="kr"><fmt:message key="menu.tour"/></div>
                    </div>

                    <div class="text">
                        <fmt:message key="business.tourDesc"/>
                        <%--세계 각국의 통신사와 직접 계약을 통한 </br>--%>
                        <%--네트워크를 확립, 법인 및 개인에게 </br>--%>
                        <%--통신서비스를 제공하고 있습니다.--%>
                    </div>

                    <Div class="brownMore">
                        <a href="/${language}/business/tour"><img src="${resouceUrl}/images/business/brownMore.png"></a></div>
                </div>

                <div class="thumArea"><img src="${resouceUrl}/images/business/businessThum01.jpg"></div>
            </div>
        </dd>



        <dd>
            <div class="inner">

                <div class="thumArea"><img src="${resouceUrl}/images/business/businessThum02.jpg"></div>

                <div class="textArea">
                    <div class="titleArea">
                        <div class="en"><img src="${resouceUrl}/images/business/busititle02.png"></div>
                        <div class="kr white" style="color:#fff;"><fmt:message key="menu.communication"/></div>
                    </div>

                    <div class="text white" style="color:#fff;">
                        <fmt:message key="business.communicationDesc"/>
                        <%--세계 각국의 통신사와 직접 계약을 통한 </br>--%>
                        <%--네트워크를 확립, 법인 및 개인에게</br>--%>
                        <%--통신서비스를 제공하고 있습니다.--%>
                    </div>

                    <Div class="brownMore">
                        <a href="/${language}/business/comm"><img src="${resouceUrl}/images/business/blueMore.png"></a></div>
                </div>

            </div>
        </dd>


        <dd>
            <div class="inner">
                <div class="textArea">
                    <div class="titleArea">
                        <div class="en"><img src="${resouceUrl}/images/business/busititle03.png"></div>
                        <div class="kr"><fmt:message key="menu.fashion"/></div>
                    </div>

                    <div class="text">
                        <fmt:message key="business.fashionDesc"/>
                        <%--세계 각국의 통신사와 직접 계약을 통한  </br>--%>
                        <%--네트워크를 확립, 법인 및 개인에게 </br>--%>
                        <%--통신서비스를 제공하고 있습니다.--%>
                    </div>

                    <Div class="brownMore">
                        <a href="/${language}/business/fashion"><img src="${resouceUrl}/images/business/brownMore.png"></a></div>
                </div>

                <div class="thumArea"><img src="${resouceUrl}/images/business/businessThum03.jpg"></div>
            </div>
        </dd>

        <dd>
            <div class="inner">

                <div class="thumArea"><img src="${resouceUrl}/images/business/businessThum04.jpg"></div>

                <div class="textArea">
                    <div class="titleArea">
                        <div class="en" style="color:#fff;"><img src="${resouceUrl}/images/business/busititle04.png"></div>
                        <div class="kr" style="color:#fff;"><fmt:message key="menu.realstate"/></div>
                    </div>

                    <div class="text" style="color:#fff;">
                        <fmt:message key="business.realStateDesc"/>
                        <%--동남아시아에서의 쉐어오피스--%>
                        <%--브랜드[어벤쳐즈]를 운영 및--%>
                        <%--콘도미니엄 투자를 통한 AIRBnB 진출 등 </br>--%>
                        <%--새롭게 모색하고 있습니다.--%>
                    </div>

                    <Div class="brownMore">
                        <a href="/${language}/business/realEstate"><img src="${resouceUrl}/images/business/blueMore.png"></a></div>
                </div>

            </div>
        </dd>

        <dd>
            <div class="inner">
                <div class="textArea">
                    <div class="titleArea">
                        <div class="en"><img src="${resouceUrl}/images/business/busititle05.png"></div>
                        <div class="kr"><fmt:message key="menu.franchise"/></div>
                    </div>

                    <div class="text">
                        <fmt:message key="business.franchiseDesc"/>
                        <%--태국 필리핀을 중심으로 아시안퓨젼</br>--%>
                        <%--브랜드 [WATA]를 전개, 프랜차이즈 </br>--%>
                        <%--사업을 진행하고 있습니다.--%>
                    </div>

                    <Div class="brownMore">
                        <a href="/${language}/business/franchise"><img src="${resouceUrl}/images/business/brownMore.png"></a></div>
                </div>

                <div class="thumArea"><img src="${resouceUrl}/images/business/businessThum05.jpg"></div>
            </div>
        </dd>


    </dl>
</div>


<%@include file="../base/footer.jsp" %>
</section>

</body>
<%@include file="../base/includeJsResources.jsp" %>
</html>