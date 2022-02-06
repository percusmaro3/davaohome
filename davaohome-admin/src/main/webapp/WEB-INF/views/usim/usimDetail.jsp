<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
    <script type="text/javascript" src="/resources/js/translate.js"></script>
</head>


<script>

    function insertUsim () {
        if (!confirm("<fmt:message key="usim.confirmRegisterUsim"/>"))
            return;

        var f = document.usimForm;
        f.action = "/usim/register";
        f.submit();
    }

    function updateUsim () {
        if (!confirm("<fmt:message key="usim.confirmUpdateUsim"/>"))
            return;

        var f = document.usimForm;
        f.action = "/usim/update";
        f.submit();
    }

    function selectLanguage (language) {
        hideContentsTable();
        var contentsTable = "contentsTable_" + language;
        $('#' + contentsTable).show();

        var tab = "tab_" + language;
        $('#' + tab).addClass('on');
    }

    function hideContentsTable () {
        <c:forEach items="${languageList}" var="language">
        var contentsTable = "contentsTable_${language}";
        $('#' + contentsTable).hide();

        var tab = "tab_${language}";
        $('#' + tab).removeClass('on');
        </c:forEach>
    }

    function doTranslate (targetLanguage) {
        if (!confirm("<fmt:message key="common.confirmTranslate"/>")) {
            return;
        }
        _doTranslate("INPUT", "input[name=goodsName_", targetLanguage);
    }

</script>

<body>
<form name="usimForm" action="/usim/register" enctype="multipart/form-data" method="POST">
    <input type="hidden" name="usimNo" value="${usim.usimNo}"/>

    <div id="pop_wrap" style="width:900px">
        <div id="pop_header">
            <h1><fmt:message key="usim.usimManage"/></h1>
        </div>

        <div id="pop_content">
            <div class="tbl_type2">
                <form:form commandName="usim">
                    <table>
                        <colgroup>
                            <col style="width:130px">
                            <col>
                        </colgroup>
                        <tbody>

                        <c:if test="${jobType != 'INSERT'}">
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="usim.usimNo"/></div>
                                </th>
                                <td colspan="3">
                                    <div class="td">${usim.usimNo}</div>
                                </td>
                            </tr>

                        </c:if>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="usim.usimCountry"/></div>
                            </th>
                            <td>
                                <div class="td">
                                    <select name="usimCountry" onchange="" style="width:145px;" class="gray01">
                                        <c:forEach var="usimCountry" items="${usimCountryList}">
                                            <option value="${usimCountry}">${usimCountry}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.displayYn"/></div>
                            </th>
                            <td>
                                <div class="td">
                                    <select name="activeYn" onchange="" style="width:145px;" class="gray01">
                                        <option value=Y ${usim.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                        <option value=N ${usim.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>
                                    </select>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="usim.dataLimit"/></div>
                            </th>
                            <td>
                                <div class="td">
                                    <input type="text" name="dataLimit" style="width:100px"
                                           value="${usim.dataLimit}"> MB
                                </div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="usim.useTerm"/></div>
                            </th>
                            <td>
                                <div class="td">
                                    <input type="text" name="useTerm" style="width:100px"
                                           value="${usim.useTerm}"> Day

                                    <div class="yellow_box">
                                        <p class="yellow_mark"><fmt:message key="usim.useTermDesc"/></p>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                </form:form>
                <br/>

                <c:if test="${errorMsg != ''}">
                    <p style="color:red;float:left;font-weight: bold">${errorMsg}</p><br/>
                </c:if>
                <br>

                <div class="tab_menu">
                    <ul class="tc">
                        <c:forEach items="${languageList}" var="language" varStatus="status">
                            <c:set var="languageStr">${language}</c:set>
                            <c:set value="${usim.contentsMap[languageStr]}" var="contents"/>

                            <li id="tab_${language}" ${status.index == 0 ? "class=on" : ""}>
                                <a href="javascript:onclick=selectLanguage('${language}')">
                                    <fmt:message key="${language.languageDisplayName}"/>
                                        ${contents != null ? "" : "<font color=red>(*)</font>"}
                                </a></li>
                        </c:forEach>
                    </ul>
                </div>
                <c:forEach items="${languageList}" var="language" varStatus="status">
                    <c:set var="languageStr">${language}</c:set>
                    <c:set value="${usim.contentsMap[languageStr]}" var="contents"/>

                    <div id="contentsTable_${language}" style="display:${status.index == 0 ? "block" : "none"}">
                        <table>
                            <colgroup>
                                <col style="width:130px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="common.autoTranslate"/><em class="must2">*<span class="blind">필수</span></em>
                                    </div>
                                </th>
                                <td>
                                    <div class="td">
                                        <fmt:message key="common.selectTranslateSrcLanguage"/> &nbsp;&nbsp;
                                        <select name="srcLangage_${language}" style="width:70px">
                                            <c:forEach items="${languageList}" var="srcLanguage" varStatus="status">
                                                <c:if test="${srcLanguage != language}">
                                                    <option value="${srcLanguage}">${srcLanguage}</option>
                                                </c:if>
                                            </c:forEach>
                                        </select>

                                        <a href="#" onclick="javascript:doTranslate('${language}')" class="btn_text">
                                            <em class="f_bold"><fmt:message key="common.translate"/></em></a> &nbsp;
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="usim.usimGoodsName"/><em class="must2">*<span class="blind">필수</span></em>
                                    </div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" name="goodsName_${language}" style="width:350px"
                                               value="${contents != null ? contents.goodsName : ""}">
                                    </div>
                                </td>
                            </tr>
                            <c:choose>
                                <c:when test="${jobType == 'INSERT'}">
                                    <tr>
                                        <th>
                                            <div class="th"><fmt:message key="usim.apnManualUrl"/><em class="must2">*<span
                                                    class="blind">필수</span></em>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <input type="file" accept="image/*" name="apnManualUrl_${language}"
                                                       style="width:300px" value="">
                                            </div>

                                        </td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <th>
                                            <div class="th"><fmt:message key="usim.apnManualUrl"/><em class="must2">*<span
                                                    class="blind">필수</span></em>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <c:if test="${contents.apnManualUrl != null}">
                                                    <a href="${contents.apnManualUrl}" target="_blank"><fmt:message key="common.viewImage"/> </a>
                                                    <br/><br/>
                                                </c:if>
                                                <input type="file" accept="image/*" name="apnManualUrl_${language}" style="width:300px" value="">
                                                <input type=hidden name="beforeApnManualUrl_${language}" value="${contents.apnManualUrl}"/>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="th"><fmt:message key="common.image"/>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <a href="${contents.apnManualUrl}" target="_blank">
                                                    <img src="${contents.apnManualUrl}" height="300px"/>
                                                </a>
                                            </div>

                                        </td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
                <br/>
                <table>
                    <colgroup>
                        <col style="width:130px">
                        <col>
                    </colgroup>
                    <tbody>
                    <c:if test="${jobType != 'INSERT'}">
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.registerDate"/></div>
                            </th>
                            <td>
                                <div class="td">
                                        ${cnv:datetime(usim.registerDate,countryId)}
                                </div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                            </th>
                            <td>
                                <div class="td">${cnv:datetime(usim.updateDate,countryId)}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdater"/></div>
                            </th>
                            <td>
                                <div class="td">${usim.lastUpdater}</div>
                            </td>
                        </tr>
                    </c:if>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btn_wrap btn_final">
            <c:choose>
                <c:when test="${jobType == 'INSERT'}">
                    <a href="#" onclick="javascript:insertUsim()"><em class="noico"><fmt:message key="common.register"/></em></a>
                </c:when>
                <c:when test="${jobType == 'UPDATE'}">
                    <a href="#" onclick="javascript:updateUsim()"><em class="noico"><fmt:message key="common.update"/></em></a>
                </c:when>
            </c:choose>
            <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.cancel"/></em></a>
        </div>
    </div>

</form>

</body>

</html>