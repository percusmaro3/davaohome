<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>

<%@include file="../base/includeMeta.jsp" %>
<%@ taglib prefix="page" uri="pagingTag" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>

<script>

    $(function () {
        $("#startDatePicker").datepicker({
                    dateFormat: "${countryHtmlDateFormat}"
                },
                $.datepicker.regional['en-AU']);
    });

    $(function () {
        $("#endDatePicker").datepicker({
                    dateFormat: "${countryHtmlDateFormat}"
                },
                $.datepicker.regional['en-AU']);
    });

    function downloadCsv () {
        var f = document.downloadCouponForm;
        f.action = "/order/downloadCouponExcelList";
        f.submit();
    }

    function searchDownloadCoupon () {
        var f = document.downloadCouponForm;
        f.action = "/order/downloadCouponList";
        f.submit();
    }

    function selectPartner () {
        _openWindowAtCenter('/partner/partnerList?isPopup=true', 1000, 830);
    }

    function setSelectPartner (partnerNo, partnerName) {
        var f = document.placeForm;
        f.partnerNo.value = partnerNo;
        f.partnerName.value = partnerName;
    }

</script>

<body>
<form name="downloadCouponForm" action="/order/downloadCouponList" method="GET">
    <input type="hidden" name="page" value=""/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>
        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <!-- content -->
            <div id="content">
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3>Download Cooupon List</h3>
                    </div>
                    <div class="hd_wrap2">
                        <h4 class="hd2"><fmt:message key="common.searchCondition"/></h4>
                    </div>
                    <div class="tbl_type2">
                        <table>
                            <colgroup>
                                <col style="width: 125px">
                                <col style="width: 190px">
                                <%--<col style="width: 100px">--%>
                                <%--<col style="width: 170px">--%>
                                <col style="width: 125px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr class="paycoSearch">
                                <c:choose>
                                    <c:when test="${loginPartnerType == 'WISE'}">
                                        <th scope="row">
                                            <div class="th"><fmt:message key="common.countryId"/></div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <select name="countryId">
                                                    <option value=""> ---------------</option>
                                                    <c:forEach var="country" items="${countryList}">
                                                        <option value="${country.countryId}" ${param.countryId == country.countryId ? "selected" : ""}
                                                                >${country.countryNamePerLanguage['en']}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </c:when>
                                    <c:otherwise>
                                        <%--<th scope="row">--%>
                                        <%--<div class="th"><fmt:message key="partner.partner"/></div>--%>
                                        <%--</th>--%>
                                        <%--<td>--%>
                                        <%--<div class="td">--%>
                                        <%--<input type="text" name="partnerName" value="${param.partnerName}"/>--%>
                                        <%--<input type="hidden" name="partnerNo" value="${param.partnerNo}"/>--%>

                                        <%--<a href="#" onclick="javascript:selectPartner()"--%>
                                        <%--class="btn_text"><em class="noico"><fmt:message key="common.search"/></em></a>--%>
                                        <%--</div>--%>
                                        <%--</td>--%>
                                        <th scope="row">
                                            <div class="th"><fmt:message key="coupon.title"/></div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <select name="couponNo">
                                                    <option value=""> ---------------</option>
                                                    <c:forEach var="coupon" items="${couponList}">
                                                        <option value="${coupon.couponNo}" ${coupon.couponNo == param.couponNo ? "selected" : ""}
                                                                >${coupon.title}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </c:otherwise>
                                </c:choose>
                                <th scope="row">
                                    <div class="th"><fmt:message key="coupon.downloadDate"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <span class="inp_day">
					                <input id=startDatePicker name="startDateStr" style="width:80px" class="ipt_txt date" type="text"
                                           value="${param.startDateStr}"/> </span> ~
                                        <span class="inp_day">
					                <input id=endDatePicker name="endDateStr" style="width:80px" class="ipt_txt date" type="text"
                                           value="${param.endDateStr}"/> </span>

                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="btn_final btn_right">
                        <a href="#"
                           onclick="javascript:searchDownloadCoupon()"><em class="serch"><span></span><fmt:message key="common.search"/></em></a>
                    </div>


                    <div class="hd_wrap2">
                        <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                        <span class="result">${paging.totalItemCount} </span>

                        <div class="fr">
                            <c:if test="${paging.totalItemCount != 0}">
                                <a href="#" onclick="javascript:downloadCsv()" class="btn_text">
                                    <em class="excel"><fmt:message key="common.ExcelDownload"/></em>
                                </a>
                            </c:if>
                        </div>
                    </div>

                    <div class="tbl_type tbl_type_v2 scrl_auto">
                        <table>
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 90px">
                                <col>
                                <col>
                                <col>
                                <col style="width: 120px">
                                <col style="width: 90px">
                                <col style="width: 90px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.countryId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="partner.partner"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="place.placeName"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="coupon.title"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="coupon.downloadDate"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="coupon.downloadStatus"/></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${fn:length(downloadCouponList) == 0}">
                                <tr>
                                    <td colspan="7" class="nodata">
                                        <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="downloadCoupon" items="${downloadCouponList}">

                                <tr>
                                    <td>
                                        <div class="td">${downloadCoupon.countryId}</div>
                                    </td>
                                    <td>
                                        <div class="td">${downloadCoupon.partnerName}</div>
                                    </td>
                                    <td>
                                        <div class="td">${downloadCoupon.placeName}</div>
                                    </td>
                                    <td>
                                        <div class="td">${downloadCoupon.title}</div>
                                    </td>
                                    <td>
                                        <div class="td">${downloadCoupon.memberId}</div>
                                    </td>
                                    <td>
                                        <div class="td">${cnv:date(downloadCoupon.registerDate,countryId)}</div>
                                    </td>
                                    <td>
                                        <div class="td">${downloadCoupon.activeYn}</div>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br/><br/>
                    <table class="Nnavi" align="center">
                        <page:display pagination="${paging}"/>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="../layout/footer.jsp" %>
    </div>
</body>
</html>
