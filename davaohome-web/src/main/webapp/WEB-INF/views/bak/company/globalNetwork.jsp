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
<c:set var="depth1Url" value="/company" />
    <c:set var="depth2Text"><fmt:message key="menu.globalNetwork"/></c:set>
<c:set var="depth2Url" value="/company/globalNetwork" />

<%@include file="../../base/subTitle.jsp" %>


<div class="infomation2">
    <h1 class="contentTitle"><fmt:message key="menu.globalNetwork"/></h1>
    <div class="borderWrapper">
        <img class="borderSm" src="${resouceUrl}/images/infomation/borderSm.png">
    </div>

    <div class="submenuWrapper">
        <div class="subMenuRow">
            <div class="infomationSubMenu border-right-none active" data-type="japan">Japan</div>
            <div class="infomationSubMenu border-right-none" data-type="korea">S. Korea</div>
            <div class="infomationSubMenu border-right-none" data-type="taiwan">Taiwan</div>
            <div class="infomationSubMenu border-right-none" data-type="thai">Thailand</div>
            <div class="infomationSubMenu" data-type="phillippine">Phillippines</div>
        </div>
        <div class="subMenuRow">
            <div class="infomationSubMenu border-none" data-type="" style="cursor:default;background-color: #ffffff;"></div>
            <div class="infomationSubMenu border-none" data-type="" style="cursor:default;background-color: #ffffff;"></div>
            <div class="infomationSubMenu border-top-none border-right-none" data-type="england">United Kingdom</div>
            <div class="infomationSubMenu border-top-none border-right-none" data-type="america">United States</div>
            <div class="infomationSubMenu border-top-none" data-type="china">China</div>
        </div>
    </div>


    <div id="korea" class="subMenuContent">
        <!-- psd파일에 WorldWide그룹은 없어서 한국 내용 삽입 -->
        <div class="subMentContentLeft w-100">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.koreaName"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc3"/> <br>
                <fmt:message key="company.globalNetwork.desc1"/><br>
                <fmt:message key="company.globalNetwork.desc2"/><br>
                <fmt:message key="company.globalNetwork.desc4"/><br>
                <fmt:message key="company.globalNetwork.desc5"/>
            </div>
        </div>
    </div>

    <div id="japan" class="subMenuContent">
        <div class="subMentContentLeft">
            <table>
                <div class="keyTitle">· <fmt:message key="company.globalNetwork.japanName1"/></div>
                <div class="subMentContentList">
                    <fmt:message key="company.globalNetwork.desc3"/> <br>
                    <fmt:message key="company.globalNetwork.desc1"/><br>
                    <fmt:message key="company.globalNetwork.desc2"/><br>
                    <fmt:message key="company.globalNetwork.desc4"/><br>
                    <fmt:message key="company.globalNetwork.desc5"/>
                </div>
            </table>
        </div>
        <div class="subMentContentRight">
            <table>
                <div class="keyTitle">· <fmt:message key="company.globalNetwork.japanName2"/></div>
                <div class="subMentContentList">
                    <fmt:message key="company.globalNetwork.desc6"/><br>
                    <fmt:message key="company.globalNetwork.desc7"/><br>
                    <fmt:message key="company.globalNetwork.desc8"/>
                </div>
            </table>
        </div>
    </div>

    <div id="china" class="subMenuContent">
        <!-- psd파일에 중국그룹은 없어서 홍콩 내용 삽입 -->
        <div class="subMentContentLeft w-100">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.honkongName"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc1"/><br>
                <fmt:message key="company.globalNetwork.desc4"/><br>
                <fmt:message key="company.globalNetwork.desc2"/><br>
                <fmt:message key="company.globalNetwork.desc3"/> <br>
                <fmt:message key="company.globalNetwork.desc5"/>
            </div>
        </div>
    </div>

    <div id="phillippine" class="subMenuContent">
        <!-- psd파일에 중동그룹은 없어서 필리핀 내용 삽입 -->
        <div class="subMentContentLeft w-100">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.phillippineName"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc9"/> <br/>
                <fmt:message key="company.globalNetwork.desc11"/>
            </div>
        </div>
    </div>

    <div id="taiwan" class="subMenuContent">
        <!-- psd파일에 아시아그룹은 없어서 대만 내용 삽입 -->
        <div class="subMentContentLeft w-100">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.taiwanName"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc2"/><br>
                <fmt:message key="company.globalNetwork.desc1"/><br>
                <fmt:message key="company.globalNetwork.desc3"/> <br>
                <fmt:message key="company.globalNetwork.desc5"/><br>
                <fmt:message key="company.globalNetwork.desc4"/>
            </div>
        </div>
    </div>

    <div id="england" class="subMenuContent">
        <div class="subMentContentLeft w-100">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.englishName"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc3"/><br>
                <fmt:message key="company.globalNetwork.desc2"/><br>
                <fmt:message key="company.globalNetwork.desc1"/><br>
                <fmt:message key="company.globalNetwork.desc5"/><br>
                <fmt:message key="company.globalNetwork.desc4"/>
            </div>
        </div>
    </div>



    <div id="america" class="subMenuContent">

        <div class="subMentContentLeft w-100">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.americaName"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc12"/><br>
                <fmt:message key="company.globalNetwork.desc3"/><br>
                <fmt:message key="company.globalNetwork.desc1"/><br>
                <fmt:message key="company.globalNetwork.desc2"/><br>
                <fmt:message key="company.globalNetwork.desc4"/><br>
                <fmt:message key="company.globalNetwork.desc5"/>
            </div>
        </div>
    </div>

    <div id="thai" class="subMenuContent">
        <!-- psd파일에 북미그룹 없어서 태국 내용 삽입 -->
        <div class="subMentContentLeft">
            <div class="keyTitle">· <fmt:message key="company.globalNetwork.thaiName1"/></div>
            <div class="subMentContentList">
                <fmt:message key="company.globalNetwork.desc13"/><br>
                <fmt:message key="company.globalNetwork.desc5"/><br>
                <fmt:message key="company.globalNetwork.desc3"/><br>
                <fmt:message key="company.globalNetwork.desc1"/><br>
                <fmt:message key="company.globalNetwork.desc2"/><br>
                <fmt:message key="company.globalNetwork.desc4"/>
            </div>
        </div>

        <div class="subMentContentRight">
            <div>
                <div class="keyTitle">· <fmt:message key="company.globalNetwork.thaiName2"/></div>
                <div class="subMentContentList">
                    <fmt:message key="company.globalNetwork.desc14"/> <br>
                    <fmt:message key="company.globalNetwork.desc15"/>
                </div>
            </div>
            <div style="margin-top:45px;">
                <div class="keyTitle sub">· <fmt:message key="company.globalNetwork.thaiName3"/></div>
                <div class="subMentContentList sub">
                    <fmt:message key="company.globalNetwork.desc16"/>
                </div>
            </div>
        </div>
    </div>

</div>

    <div class="infomation" style="text-align: center;">
        <img src="${resouceUrl}/images/infomation/global_network_${language}.png" style="max-width:100%;">
    </div>

<%@include file="../../base/footer.jsp" %>
</section>


</body>
<%@include file="../../base/includeJsResources.jsp" %>

<script>
    $(document).ready(function(){
        $('.bxslider').bxSlider({
            auto:true,
            controls: true,
            pager:true,
        });

        //페이지 로드 완료시 world 컨텐츠 먼저 출력
        $("#japan").css("display","table");
    });


    $(".infomationSubMenu").click(function(){
        if($(this).attr('data-type') != ''){
            $('.infomationSubMenu').each( function() {
                $(this).removeClass('active');
            });
            $('.subMenuContent').each( function() {
                $(this).css('display','none');
            });

            $(this).addClass('active');
            var elId = $(this).attr('data-type');
            $("#"+elId).css('display','table');
        }
    })
</script>

</html>