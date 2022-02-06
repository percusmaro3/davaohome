<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>

    function insertAdminMember () {
        if (!confirm("<fmt:message key="adminMember.confirmRegisterAdminMember"/>"))
            return;

        var f = document.adminMemberForm;
        f.action = "/adminMember/register";
        f.submit();
    }

    function updateAdminMember () {
        if (!confirm("<fmt:message key="adminMember.confirmUpdateAdminMember"/>"))
            return;

        var f = document.adminMemberForm;
        f.action = "/adminMember/update";
        f.submit();
    }

    function selectPartner () {
        _openWindowAtCenter('/partner/partnerList?isPopup=true', 1000, 830);
    }

    function setSelectPartner (partnerNo, partnerName) {
        var f = document.adminMemberForm;
        f.partnerNo.value = partnerNo;
        f.partnerName.value = partnerName;
    }

</script>

<body>
<form name="adminMemberForm" method="POST">

    <div id="pop_wrap" style="width:100%">
        <div id="pop_header">
            <h1>
                <fmt:message key="adminMember.adminMemberInfo"/>
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
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="adminMember.adminMemberId"/><em class="must2"/></div>
                        </th>
                        <c:choose>
                            <c:when test="${jobType == 'INSERT'}">
                                <td>
                                    <div class="td">
                                        <input type="text" name="adminMemberId" style="width:350px"
                                               value="${adminMember.adminMemberId}"/>
                                    </div>
                                </td>
                            </c:when>
                            <c:otherwise>
                                <td>
                                    <div class="td">${adminMember.adminMemberId}</div>
                                    <input type="hidden" name="adminMemberId" value="${adminMemberId}"/>
                                </td>
                            </c:otherwise>
                        </c:choose>

                    </tr>

                    <c:if test="${jobType == 'INSERT' || loginAdminId == adminMember.adminMemberId}">
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="adminMember.password"/><em class="must2"/></div>
                            </th>
                            <td>
                                <div class="td">
                                    <input type="password" name="password" style="width:350px"
                                           value="${adminMember.password}"/>
                                </div>
                                <div class="td">
                                    <input type="password" name="confirmPassword" style="width:350px"
                                           value="${adminMember.password}"/>
                                </div>
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
                                        <option value="${country.countryId}"
                                            ${adminMember.countryId == country.countryId ? 'selected' : ''}>${country.countryNamePerLanguage['en']}</option>
                                    </c:forEach>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="partner.partner"/><em class="must2"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <input type="text" name="partnerName" value="${adminMember.partnerName}"/>
                                <input type="hidden" name="partnerNo" value="${adminMember.partnerNo}"/>

                                <a href="#" onclick="javascript:selectPartner()"
                                   class="btn_text"><em class="noico"><fmt:message key="common.search"/></em></a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="adminMember.adminMemberType"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <select name="adminMemberType" onchange="" style="width:100px;" class="gray01">
                                    <c:forEach var="adminMemberType" items="${adminMemberTypeList}">
                                        <option value="${adminMemberType}" ${adminMember.adminMemberType == adminMemberType ? 'selected' : ''}>${adminMemberType}</option>
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
                                    <option value=Y ${adminMember.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                    <option value=N ${adminMember.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>
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
                                        ${cnv:date(adminMember.registerDate,countryId)}
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                            </th>
                            <td>
                                <div class="td">${cnv:date(adminMember.updateDate,countryId)}</div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdater"/></div>
                            </th>
                            <td>
                                <div class="td">${adminMember.lastUpdater}</div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap btn_final">
                <c:choose>
                    <c:when test="${jobType == 'INSERT'}">
                        <a href="#" onclick="javascript:insertAdminMember()"><em class="noico"><fmt:message key="common.register"/></em></a>
                    </c:when>
                    <c:when test="${jobType == 'UPDATE'}">
                        <a href="#" onclick="javascript:updateAdminMember()"><em class="noico"><fmt:message key="common.update"/></em></a>
                    </c:when>
                </c:choose>

                <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>
            </div>

            <br/>
        </div>
</form>

</body>
</html>
