<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>
<script>
    function selectTab (tabId) {

        var url = "";

        if (tabId == 'placeTab') {
            url = "/place/${placeNo}";
        } else if (tabId == 'couponTab') {
            url = "/coupon/couponList/${placeNo}";
        } else {
            url = "/voucher/voucherList/${placeNo}";
        }

        this.location.href = url;
    }

</script>

<c:if test="${jobType != 'INSERT'}">
    <div class="grid_out regi">
        <ul class="step exhibit">
            <li id="placeTab" class="${selectTab == 'PLACE' ? 'first on' : ''}"><a href="#" onclick="javascript:selectTab('placeTab')">
                <fmt:message key="place.placeInfo"/><span></span></a>
            </li>
            <li id="couponTab" class="${selectTab == 'COUPON' ? 'second on' : ''}"><a href="#" onclick="javascript:selectTab('couponTab')">
                <fmt:message key="common.coupon"/><span></span></a>
            </li>
            <li id="voucherTab" class="${selectTab == 'VOUCHER' ? 'last on' : ''}"><a href="#" onclick="javascript:selectTab('voucherTab')">
                <fmt:message key="common.voucher"/><span></span></a>
            </li>
        </ul>
    </div>
    <br/>
</c:if>