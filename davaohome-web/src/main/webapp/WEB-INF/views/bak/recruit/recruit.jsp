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
    <c:set var="depth2Text"><fmt:message key="menu.jobOpening"/></c:set>
<c:set var="depth2Url" value="/${language}/recruit/recruit" />

<%@include file="../../base/subTitle.jsp" %>

<div class="recruit">
    <div class="notify-wrap">
        <dl class="notiList">
            <dd>
                <div class="box" id="q1">
                    <fmt:message key="recruit.service.title"/>
                    <span class="iconDown" id="m_p1"><img src="${resouceUrl}/images/recruit/toggleDown.png"></span>
                    <span class="iconUp" id="m_m1"style="display:none;"><img src="${resouceUrl}/images/recruit/toggleUp.png"></span>
                </div>

                <ul style="display:none;" id="a1">
                    <li>
                        <div class="sec">
                            <fmt:message key="recruit.service.desc1"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.service.desc2"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.service.desc3"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.service.desc4"/>
                        </div>
                    </li>
                </ul>
            </dd>



            <dd>
                <div class="box" id="q2">
                    <fmt:message key="recruit.contents.title"/>
                    <span class="iconDown" id="m_p2"><img src="${resouceUrl}/images/recruit/toggleDown.png"></span>
                    <span class="iconUp" id="m_m2"style="display:none;"><img src="${resouceUrl}/images/recruit/toggleUp.png"></span>
                </div>

                <ul style="display:none;" id="a2">
                    <li>
                        <div class="sec">
                            <fmt:message key="recruit.contents.desc1"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.contents.desc2"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.contents.desc3"/>
                        </div>

                    </li>
                </ul>
            </dd>


            <dd>
                <div class="box" id="q3">
                    <fmt:message key="recruit.java.title"/>
                    <span class="iconDown" id="m_p3"><img src="${resouceUrl}/images/recruit/toggleDown.png"></span>
                    <span class="iconUp" id="m_m3"style="display:none;"><img src="${resouceUrl}/images/recruit/toggleUp.png"></span>
                </div>

                <ul  id="a3" style="display:none;">
                    <li>
                        <div class="sec">
                            <fmt:message key="recruit.java.desc1"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.java.desc2"/>
                        </div>

                        <div class="sec">
                            <fmt:message key="recruit.java.desc3"/>
                        </div>

                    </li>
                </ul>
            </dd>
        </dl>

        <ul class="info">
            <li><fmt:message key="recruit.process1"/></li>
            <li><fmt:message key="recruit.process2"/></li>
            <li><fmt:message key="recruit.process3"/></li>
        </ul>
    </div>

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

    });
</script>

<script type="text/javascript">
    var viewopbu = 0;

    $(function(){
        $("#q1").click(function(){
            if (viewopbu == 0)
            {
                $('#a1').css({'display':'none'});
                $('#q1').css({'background':'#f7f7f7'});
                viewopbu = 1;
            }
            else
            {
                $('#a1').css({'display':'block'});
                $('#q1').css({'background':'#fff'});
                viewopbu = 0;
            }
            $("#a1").toggle();
        });




        $("#q2").click(function(){
            if (viewopbu == 0)
            {
                $('#a2').css({'display':'none'});
                $('#q2').css({'background':'#f7f7f7'});
                viewopbu = 1;
            }
            else
            {
                $('#a2').css({'display':'block'});
                $('#q2').css({'background':'#fff'});
                viewopbu = 0;
            }
            $("#a2").toggle();
        });




        $("#q3").click(function(){
            if (viewopbu == 0)
            {
                $('#a3').css({'display':'none'});
                $('#q3').css({'background':'#f7f7f7'});
                viewopbu = 1;
            }
            else
            {
                $('#a3').css({'display':'block'});
                $('#q3').css({'background':'#fff'});
                viewopbu = 0;
            }
            $("#a3").toggle();
        });

    });
</script>


</html>