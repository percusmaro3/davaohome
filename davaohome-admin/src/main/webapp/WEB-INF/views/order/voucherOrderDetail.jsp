<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>

    function changeUsedStatus (orderDetailNo, usedStatus) {

        if (!confirm("<fmt:message key="order.confirmChangeUsedStatus"/>")) {
            return;
        }
        this.location.href = "/order/voucher/used/${voucherOrder.orderNo}/" + orderDetailNo + "/" + usedStatus;
    }

    function setReserveNo () {

        if (!confirm("<fmt:message key="order.confirmSetReserveNo"/>")) {
            return;
        }

        this.location.href = "/order/voucher/issueReserveNo/${voucherOrder.orderNo}";
    }

    function cancelVoucherOrder () {

        if (!confirm("<fmt:message key="order.confirmVoucherOrderCancel"/>")) {
            return;
        }

        this.location.href = "/order/voucher/cancel/${voucherOrder.orderNo}";
    }

</script>

<body>
<form name="orderDetailForm" method="POST">
    <input type="hidden" name="orderId" value="${order.orderId}"/>
    <input type="hidden" name="jobType" value="${jobType}"/>

    <div id="pop_wrap" style="width:100%">
        <div id="pop_header">
            <h1>
                <fmt:message key="order.voucherOrderInfo"/>
            </h1>
        </div>


        <div id="pop_content">
            <div class="section">
                <h4 class="hd2"><fmt:message key="order.placeInfo"/></h4>

                <div class="tbl_type2">
                    <table>
                        <colgroup>
                            <col style="width:150px">
                            <col style="width:350px">
                            <col style="width:150px">
                            <col style="width:350px">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.countryId"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.countryId}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="partner.partnerNo"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.partnerNo}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="place.placeNo"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.placeNo}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="place.placeName"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.placeName}</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br/>

            <div class="section">
                <h4 class="hd2"><fmt:message key="order.voucherOrderInfo"/></h4>

                <div class="tbl_type2">
                    <table>
                        <colgroup>
                            <col style="width:100px">
                            <col style="width:150px">
                            <col style="width:100px">
                            <col style="width:150px">
                            <col style="width:100px">
                            <col style="width:150px">
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="voucher.voucherNo"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.voucherNo}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="voucher.voucherName"/><em class="must2"/></div>
                            </th>
                            <td colspan="3">
                                <div class="td">${voucherOrder.voucherName}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="order.orderNo"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.orderNo}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="voucher.reserveIssueType"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.reserveIssueType}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="voucher.barcodeType"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.barcodeType}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="member.memberNo"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.memberNo}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="member.memberId"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.memberId}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="order.reserverName"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.reserverName}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="order.totalAmount"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.totalAmountStr}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="order.orderStatus"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.orderStatus}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="order.orderDate"/></div>
                            </th>
                            <td>
                                <div class="td">
                                    ${cnv:date(voucherOrder.registerDate,countryId)}
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br/>

            <div class="section">
                <h4 class="hd2"><fmt:message key="order.voucherOptionInfo"/></h4>
                <c:if test="${voucherOrder.orderStatus == 'RESERVE_NO_WAIT'}">

                    <div class="yellow_box">
                        <p class="yellow_mark"><fmt:message key="order.reserveNoInputDesc"/></p>
                    </div>

                    <div class="btn_final btn_right">
                        <a href="#"
                           onclick="javascript:setReserveNo()"><em class="serch"><span></span>
                            <fmt:message key="order.setReserveNo"/></em></a>
                    </div>
                    <br/>
                </c:if>

                <div class="tbl_type2">
                    <c:forEach var="voucherOrderDetail" items="${voucherOrder.voucherOrderDetailList}">

                        <table>
                            <colgroup>
                                <col style="width:100px">
                                <col style="width:100px">
                                <col style="width:100px">
                                <col style="width:200px">
                                <col style="width:100px">
                                <col style="width:200px">
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="voucher.optionNo"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${voucherOrderDetail.optionNo}</div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="voucher.optionName"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${voucherOrderDetail.optionName}</div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="common.amount"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${priceUnit} ${voucherOrderDetail.amountStr}</div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="order.reserveNo"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${voucherOrderDetail.reserveNo}</div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="order.isUsed"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                            ${voucherOrderDetail.isUsed} &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <c:choose>
                                            <c:when test="${voucherOrderDetail.isUsed == 'Y'}">
                                                <a href="#" onclick="javascript:changeUsedStatus('${voucherOrderDetail.orderDetailNo}','N')"
                                                   class="btn_text"><em
                                                        class="noico">
                                                    <fmt:message key="order.doNotUsed"/></em></a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="#" onclick="javascript:changeUsedStatus('${voucherOrderDetail.orderDetailNo}','Y')"
                                                   class="btn_text"><em
                                                        class="noico">
                                                    <fmt:message key="order.doUsed"/></em></a>
                                            </c:otherwise>
                                        </c:choose>

                                    </div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="order.usedDate"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${voucherOrderDetail.optionUsedDate}</div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br/><br/>
                    </c:forEach>
                </div>
            </div>

            <div class="btn_wrap btn_final">
                <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>
                <a href="#"
                   onclick="javascript:cancelVoucherOrder()"><em
                        class="noico"><fmt:message key="order.voucherOrderCancel"/></em></a>
            </div>

            <br/>
        </div>
</form>

</body>
</html>
