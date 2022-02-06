<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>

<%@ taglib prefix="page" uri="pagingTag" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title></title>
    <%@include file="../base/includeJsResources.jsp" %>
    <link rel="stylesheet" href="${resouceUrl}/css/strength.css${tag}">
    <link rel="stylesheet" href="${resouceUrl}/css/responsive.css${tag}">
</head>

<%@include file="../base/header.jsp" %>
    <!--header-->

    <div class="main">
        <div class="page_tit">
            <p>새소식</p>
        </div>
        <div class="location">
            <span><a href="/${language}/home"><img src="${resouceUrl}/images/home_btn.png"> HOME</a></span>
            <span>></span>
            <span><a href="/${language}/news">새소식</a></span>
        </div>

        <div class="news_table">
            <c:forEach var="notice" items="${noticeList}">

            <ul>
                <li class="news_date">${cnv:datetime(notice.updateDate,countryId)}</li>
                <li class="news_tit"><a href="/${language}/notice/${notice.noticeNo}">${notice.title}</a></li>
            </ul>
            </c:forEach>

            <%--<div class="page_btn_wrap">--%>
                   <%--<div class="page_btn">--%>
                <%--<span>1</span>--%>
                <%--<span>2</span>--%>
                <%--<span>3</span>--%>
                <%--<span>···</span>--%>
                <%--<span>다음></span>  --%>
                <%--</div>--%>
            <%--</div>--%>
            <table class="Nnavi" align="center">
                <page:display pagination="${paging}"/>
            </table>
        </div>
        <div class="question_banner">
            <p class="sub_text_center">이미 디바오에서 물건을 가지고 계신 분은 임대 관리 안의 의뢰도 받습니다.<br>
                문의 양식에서 신청하십시오.</p>
            <div class="cont_btn"><a href="/${language}/question">문의 ▶</a></div>
        </div>
    </div>
    <!--main_cont-->

<%@include file="../base/footer.jsp" %>

</body>

</html>
