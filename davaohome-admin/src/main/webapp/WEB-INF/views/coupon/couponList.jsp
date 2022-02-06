<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>

    $(function () {
        $("#expireDatePicker").datepicker({
                    dateFormat: "${htmlDateFormat}"
                },
                $.datepicker.regional['en-AU']);
    });

    function selectCoupon (couponNo) {
        var f = document.couponForm;
        f.target = "couponDetailFrame";
        f.action = "/coupon/" + couponNo;
        f.submit();
    }

    function showNewCoupon () {
        var f = document.couponForm;
        f.target = "couponDetailFrame";
        f.action = "/coupon/newCoupon?placeNo=${placeNo}";
        f.submit();
    }

</script>


<body>


<form name="couponForm" method="POST">
    <input type="hidden" name="placeNo" value="${placeNo}"/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>

        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <%--<div id="pop_wrap" style="width:1150px">--%>
            <%--<div id="pop_header">--%>
            <%--<h1><fmt:message key="coupon.couponManage"/></h1>--%>
            <%--</div>--%>

            <div id="bottom_short_content">
                <%@include file="../place/placeTab.jsp" %>
                <div class="tbl_type2">

                    <div class="tbl_type tbl_type_v2">
                        <table>
                            <colgroup>
                                <col style="width: 90px">
                                <col>
                                <col style="width: 150px">
                                <col style="width: 100px">
                                <col style="width: 150px">
                                <col style="width: 90px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <div class="th"><fmt:message key="coupon.couponNo"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="coupon.title"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="coupon.expireDate"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.activeYn"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.update"/></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${fn:length(couponList) == 0}">
                                <tr>
                                    <td colspan="6" class="">
                                        <div class="td"><fmt:message key="coupon.noResultOfSearch"/></div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="coupon" items="${couponList}">
                                <tr>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer" onclick="selectCoupon(${coupon.couponNo})">${coupon.couponNo}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer" onclick="selectCoupon(${coupon.couponNo})">${coupon.title}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">${cnv:date(coupon.expireDate,countryId)}</div>
                                    </td>
                                    <td>
                                        <div class="td">${coupon.activeYn}</div>
                                    </td>
                                    <td>
                                        <div class="td">${cnv:datetime(coupon.updateDate,countryId)}</div>
                                    </td>
                                    <th scope="col">
                                        <div class="th">
                                            <div class="td">
                                                <a href="#" onclick="javascript:selectCoupon('${coupon.couponNo}')" class="btn_text">
                                                    <fmt:message key="common.manage"/></a>
                                            </div>
                                        </div>
                                    </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <div class="hd_wrap2">
                        <div class="fr">
                            <a href="#" onclick="javascript:showNewCoupon()" class="btn_text"><em class="f_bold"><fmt:message
                                    key="coupon.registerCoupon"/></em></a> &nbsp;
                        </div>
                    </div>
                </div>
            </div>

            <c:choose>
                <c:when test="${fn:length(couponList) != 0}">
                    <c:set var="iframeSrc">/coupon/${couponList[0].couponNo}</c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="iframeSrc">/coupon/newCoupon?placeNo=${placeNo}</c:set>
                </c:otherwise>
            </c:choose>

            <iframe id="couponDetailFrame" src="${iframeSrc}"
                    name="couponDetailFrame"
                    scrolling="no"
                    style="border:0;width:100%;height:870px;"></iframe>

            <%--<div class="btn_wrap btn_final">--%>
            <%--<a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>--%>
            <%--</div>--%>
        </div>
        <br/>
    </div>
</form>


</body>


</html>