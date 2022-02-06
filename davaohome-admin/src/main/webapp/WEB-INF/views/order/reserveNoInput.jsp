<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>

    function setAllReserveNo () {
        var f = document.orderDetailForm;

        if (!confirm("<fmt:message key="order.confirmSetReserveNo"/>")) {
            return;
        }

        f.action = "/order/setReserveNo/${voucherOrder.orderNo}";
        f.submit();
    }

</script>

<body>
<form name="reserveNoForm" method="POST">

    <div id="pop_wrap" style="width:100%">
        <div id="pop_header">
            <h1>
                <fmt:message key="order.reserveNoInput"/>
            </h1>
        </div>

        <div id="pop_content">
            <div class="yellow_box">
                <p class="yellow_mark"><fmt:message key="order.reserveNoInputDesc"/></p>
            </div>

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
                            <td>
                                <div class="td">${voucherOrder.voucherName}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="order.orderNo"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${voucherOrder.orderNo}</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <br/>

            <div class="section">
                <h4 class="hd2"><fmt:message key="order.voucherOptionInfo"/></h4>

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
                                    <div class="th"><fmt:message key="order.orderDetailNo"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${voucherOrderDetail.orderDetailNo}</div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="voucher.optionName"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">${voucherOrderDetail.optionName}</div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="order.reserveNo"/><em class="must2"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="orderDetailNo" value="${voucherOrderDetail.orderDetailNo}" class="ipt_txt">
                                        <input type="text" title="" name="reserveNo" value="${voucherOrderDetail.reserveNo}" class="ipt_txt">
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br/><br/>
                    </c:forEach>
                </div>
            </div>

            <div class="btn_wrap btn_final">
                <a href="#" class="serch" onclick="javascript:setAllReserveNo()">
                    <em class="noico"><fmt:message key="order.setAllReserveNo"/></em>
                </a>
                <a href="#" class="gray" onclick="javascript:window.close()">
                    <em class="noico"><fmt:message key="common.close"/></em>
                </a>
            </div>

            <br/>
        </div>
    </div>
</form>

</body>
</html>
