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

    function openVoucherOrderView (orderNo) {
        _openWindowAtCenter('/order/voucher/' + orderNo, 1100, 800);
    }

    function downloadCsv () {
        var f = document.voucherOrderForm;
        f.action = "/order/voucherOrderExcelList";
        f.submit();
    }

    function searchVoucherOrder () {
        var f = document.voucherOrderForm;
        f.action = "/order/voucherOrderList";
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
<form name="voucherOrderForm" action="/order/voucherOrderList" method="GET">
    <input type="hidden" name="page" value=""/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>
        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <!-- content -->
            <div id="content">
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3>Voucher Order List</h3>
                    </div>
                    <div class="hd_wrap2">
                        <h4 class="hd2"><fmt:message key="common.searchCondition"/></h4>
                    </div>
                    <div class="tbl_type2">
                        <table>
                            <colgroup>
                                <col style="width: 100px">
                                <col style="width: 190px">
                                <col style="width: 100px">
                                <col style="width: 200px">
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
                                        <th scope="row">
                                            <div class="th"><fmt:message key="place.placeName"/></div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <select name="placeNo">
                                                    <option value=""> ---------------</option>
                                                    <c:forEach var="place" items="${placeList}">
                                                        <option value="${place.placeNo}" ${place.placeNo == param.placeNo ? "selected" : ""}
                                                                >${place.placeName}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </div>
                                        </td>
                                    </c:otherwise>
                                </c:choose>
                                <th scope="row">
                                    <div class="th"><fmt:message key="voucher.voucherNo"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="voucherNo" value="${param.voucherNo}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="order.orderDate"/></div>
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
                            <tr class="paycoSearch">
                                <th scope="row">
                                    <div class="th"><fmt:message key="order.orderNo"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="orderNo" value="${param.orderNo}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="voucher.reserveIssueType"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="reserveIssueType">
                                            <option value=""> ---------------</option>
                                            <option value="DIRECT" ${param.reserveIssueType == 'DIRECT' ? "selected" : ""} ><fmt:message
                                                    key="voucher.reserveIssueTypeDirect"/></option>
                                            <option value="CONFIRM" ${param.reserveIssueType == 'CONFIRM' ? "selected" : ""} ><fmt:message
                                                    key="voucher.reserveIssueTypeConfirm"/></option>
                                        </select>
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="order.orderStatus"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="orderStatus">
                                            <option value=""> ---------------</option>
                                            <c:forEach var="orderStatus" items="${orderStatusList}">
                                                <option value="${orderStatus}" ${param.orderStatus == orderStatus ? "selected" : ""} >
                                                    <fmt:message key="${orderStatus.msgId}"/></option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr class="paycoSearch">
                                <th scope="row">
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="memberId" value="${param.memberId}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="order.reserverName"/></div>
                                </th>
                                <td colspan="3">
                                    <div class="td">
                                        <div class="td">
                                            <input type="text" title="" name="reserverName" style="width:200px" value="${param.reserverName}"
                                                   class="ipt_txt">
                                        </div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="btn_final btn_right">
                        <a href="#"
                           onclick="javascript:searchVoucherOrder()"><em class="serch"><span></span><fmt:message key="common.search"/></em></a>
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
                                <col style="width: 120px">
                                <col style="width: 200px">
                                <col style="width: 250px">
                                <col style="width: 120px">
                                <col style="width: 170px">
                                <col style="width: 150px">
                                <col style="width: 120px">
                                <col style="width: 120px">
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
                                    <div class="th"><fmt:message key="voucher.title"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="order.orderStatus"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="order.reserverName"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="order.totalAmount"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="order.orderDate"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.view"/></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${fn:length(voucherOrderList2) == 0}">
                                <tr>
                                    <td colspan="10" class="nodata">
                                        <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="voucherOrder" items="${voucherOrderList2}">
                                <tr>
                                    <td>
                                        <div class="td">${voucherOrder.countryId}</div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer"
                                               onclick="openVoucherOrderView(${voucherOrder.orderNo})">${voucherOrder.partnerName}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer"
                                               onclick="openVoucherOrderView(${voucherOrder.orderNo})">${voucherOrder.placeName}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer"
                                               onclick="openVoucherOrderView(${voucherOrder.orderNo})">${voucherOrder.title}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td"><fmt:message key="${voucherOrder.orderStatus.msgId}"/></div>
                                    </td>
                                    <td>
                                        <div class="td">${voucherOrder.memberId}</div>
                                    </td>
                                    <td>
                                        <div class="td">${voucherOrder.reserverName}</div>
                                    </td>
                                    <td>
                                        <div class="td">${voucherOrder.totalAmountStr}</div>
                                    </td>
                                    <td>
                                        <div class="td">${cnv:datetime(voucherOrder.registerDate,countryId)}</div>
                                    </td>
                                    <th scope="col">
                                        <div class="th">
                                            <div class="td"><a href="#" onclick="javascript:openVoucherOrderView('${voucherOrder.orderNo}')"
                                                               class="btn_text"><fmt:message key="common.view"/></a></div>
                                        </div>
                                    </th>
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
</form>
</body>
</html>
