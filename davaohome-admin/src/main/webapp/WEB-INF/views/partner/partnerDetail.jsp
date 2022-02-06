<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>

    function insertPartner () {
        if (!confirm("<fmt:message key="partner.confirmRegisterPartner"/>"))
            return;

        var f = document.partnerForm;
        f.action = "/partner/register";
        f.submit();
    }

    function updatePartner () {
        if (!confirm("<fmt:message key="partner.confirmUpdatePartner"/>"))
            return;

        var f = document.partnerForm;
        f.action = "/partner/update";
        f.submit();
    }

</script>

<body>
<form name="partnerForm" method="POST">
    <input type="hidden" name="partnerNo" value="${partner.partnerNo}"/>

    <div id="pop_wrap" style="width:100%">
        <div id="pop_header">
            <h1>
                <fmt:message key="partner.partnerInfo"/>
            </h1>
        </div>
        <div id="pop_content">
            <div class="tbl_type2">
                <c:if test="${errorMsg != ''}">
                    <p style="color:red;float:left;font-weight: bold">${errorMsg}</p><br/>
                </c:if>
                <table>
                    <colgroup>
                        <col style="width:150px">
                        <col style="width:350px">
                    </colgroup>
                    <tbody>
                    <c:if test="${jobType != 'INSERT'}">
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="partner.partnerNo"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">${partner.partnerNo}</div>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.countryId"/><em class="must2"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <select name="countryId" onchange="" style="width:145px;" class="gray01">
                                    <c:forEach var="country" items="${countryList}">
                                        <option value="${country.countryId}" ${partner.countryId == country.countryId ? 'selected' : ''}>${country.countryNamePerLanguage['en']}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="partner.partnerName"/><em class="must2"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <input type="text" name="partnerName" style="width:350px"
                                       value="${partner.partnerName}"/>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="partner.partnerType"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <select name="partnerType" onchange="" style="width:100px;" class="gray01">
                                    <c:forEach var="partnerType" items="${partnerTypeList}">
                                        <option value="${partnerType}" ${partner.partnerType == partnerType ? "selected" : ""} >${partnerType}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.activeYn"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <select name="activeYn" onchange="" style="width:100px;" class="gray01">
                                    <option value=Y ${partner.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                    <option value=N ${partner.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>
                                </select>
                            </div>
                        </td>
                    </tr>

                    <c:if test="${jobType != 'INSERT'}">
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.registerDate"/></div>
                            </th>
                            <td>
                                <div class="td">
                                        ${cnv:date(partner.registerDate,countryId)}
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                            </th>
                            <td>
                                <div class="td">${cnv:date(partner.updateDate,countryId)}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdater"/></div>
                            </th>
                            <td>
                                <div class="td">${partner.lastUpdater}</div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap btn_final">
                <c:choose>
                    <c:when test="${jobType == 'INSERT'}">
                        <a href="#" onclick="javascript:insertPartner()"><em class="noico"><fmt:message key="common.register"/></em></a>
                    </c:when>
                    <c:when test="${jobType == 'UPDATE'}">
                        <a href="#" onclick="javascript:updatePartner()"><em class="noico"><fmt:message key="common.update"/></em></a>
                    </c:when>
                </c:choose>

                <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>
            </div>

            <br/>
        </div>
</form>

</body>
</html>
