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

    function selectVoucher (voucherNo) {
        var f = document.voucherForm;
        f.target = "voucherDetailFrame";
        f.action = "/voucher/" + voucherNo;
        f.submit();
    }

    function showNewVoucher () {
        var f = document.voucherForm;
        f.target = "voucherDetailFrame";
        f.action = "/voucher/newVoucher?placeNo=${placeNo}";
        f.submit();
    }

</script>


<body>


<form name="voucherForm" method="POST">
    <input type="hidden" name="placeNo" value="${placeNo}"/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>

        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <%--<div id="pop_wrap" style="width:1200px">--%>
            <%--<div id="pop_header">--%>
            <%--<h1><fmt:message key="voucher.voucherManage"/></h1>--%>
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
                                <col style="width: 150px">
                                <col style="width: 90px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <div class="th"><fmt:message key="voucher.voucherNo"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="voucher.title"/></div>
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
                            <c:if test="${fn:length(voucherList) == 0}">
                                <tr>
                                    <td colspan="5" class="">
                                        <div class="td"><fmt:message key="voucher.noResultOfSearch"/></div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="voucher" items="${voucherList}">
                                <tr>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer" onclick="selectVoucher(${voucher.voucherNo})">${voucher.voucherNo}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer" onclick="selectVoucher(${voucher.voucherNo})">${voucher.title}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">${voucher.activeYn}</div>
                                    </td>
                                    <td>
                                        <div class="td">${cnv:datetime(voucher.updateDate,countryId)}</div>
                                    </td>
                                    <th scope="col">
                                        <div class="th">
                                            <div class="td">
                                                <a href="#" onclick="javascript:selectVoucher('${voucher.voucherNo}')" class="btn_text">
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
                            <a href="#" onclick="javascript:showNewVoucher()" class="btn_text"><em class="f_bold"><fmt:message
                                    key="voucher.registerVoucher"/></em></a> &nbsp;
                        </div>
                    </div>
                </div>
            </div>
            <br/>
            <c:choose>
                <c:when test="${fn:length(voucherList) != 0}">
                    <c:set var="iframeSrc">/voucher/${voucherList[0].voucherNo}</c:set>
                </c:when>
                <c:otherwise>
                    <c:set var="iframeSrc">/voucher/newVoucher?placeNo=${placeNo}</c:set>
                </c:otherwise>
            </c:choose>

            <iframe id="voucherDetailFrame" src="${iframeSrc}"
                    name="voucherDetailFrame"
                    scrolling="yes" frameborder="0"
                    style="border:0;width:100%;height:900px"></iframe>


            <%--<div class="btn_wrap btn_final">--%>
            <%--<a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>--%>
            <%--</div>--%>
        </div>
    </div>
</form>


</body>


</html>