<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
    <script type="text/javascript" src="/resources/js/translate.js"></script>
</head>


<script>

    function insertFaq () {
        if (!confirm("<fmt:message key="faq.confirmRegisterFaq"/>"))
            return;

        setContents();

        var f = document.faqForm;
        f.action = "/faq/register";
        f.submit();
    }

    function updateFaq () {
        if (!confirm("<fmt:message key="faq.confirmUpdateFaq"/>"))
            return;

        setContents();

        var f = document.faqForm;
        f.action = "/faq/update";
        f.submit();
    }

    function setContents () {
        <c:forEach items="${languageList}" var="language">
        oEditors.getById["faqContent_${language}"].exec("UPDATE_CONTENTS_FIELD", []);  // 에디터의 내용이 textarea에 적용됩니다.
        </c:forEach>
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
        _doTranslate("INPUT", "input[name=question_", targetLanguage);
        _doTranslate("HTMLEDITOR", "faqContent_", targetLanguage);
    }

</script>

<body>
<form name="faqForm" action="/faq/register" method="POST">
    <input type="hidden" name="faqNo" value="${faq.faqNo}"/>

    <div id="pop_wrap" style="width:900px">
        <div id="pop_header">
            <h1><fmt:message key="faq.faqManage"/></h1>
        </div>

        <div id="pop_content">
            <c:if test="${errorMsg != ''}">
                <p style="color:red;float:left;font-weight: bold">${errorMsg}</p><br/>
            </c:if>
            <div class="tbl_type2">
                <c:if test="${jobType != 'INSERT'}">
                    <table>
                        <colgroup>
                            <col style="width:130px">
                            <col>
                        </colgroup>
                        <tbody>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="faq.faqNo"/></div>
                            </th>
                            <td>
                                <div class="td">${faq.faqNo}</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                </c:if>
                <form:form commandName="faq">
                    <div class="tab_menu">
                        <ul class="tc">
                            <c:forEach items="${languageList}" var="language" varStatus="status">
                                <c:set var="languageStr">${language}</c:set>
                                <c:set value="${faq.contentsMap[languageStr]}" var="contents"/>

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
                        <c:set value="${faq.contentsMap[languageStr]}" var="contents"/>

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
                                        <div class="th"><fmt:message key="faq.faqQuestion"/><em class="must2">*<span class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="question_${language}" style="width:350px"
                                                   value="${contents != null ? contents.question : ""}">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="faq.faqAnswer"/><em class="must2">*<span class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                    <textarea cols="50" id="faqContent_${language}" name="answer_${language}" rows="15" class="ipt_txt"
                                              style="width:100%;height:400px;">${contents != null ? contents.answer : ""}</textarea>
                                        </div>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                </form:form>
                <br/>
                <table>
                    <colgroup>
                        <col style="width:130px">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.displayYn"/></div>
                        </th>
                        <td colspan="5">
                            <div class="td">
                                <select name="activeYn" onchange="" style="width:145px;" class="gray01">
                                    <option value=Y ${faq.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                    <option value=N ${faq.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>
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
                                        ${cnv:datetime(faq.registerDate,countryId)}
                                </div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                            </th>
                            <td>
                                <div class="td">${cnv:datetime(faq.updateDate,countryId)}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdater"/></div>
                            </th>
                            <td>
                                <div class="td">${faq.lastUpdater}</div>
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
                    <a href="#" onclick="javascript:insertFaq()"><em class="noico"><fmt:message key="common.register"/></em></a>
                </c:when>
                <c:when test="${jobType == 'UPDATE'}">
                    <a href="#" onclick="javascript:updateFaq()"><em class="noico"><fmt:message key="common.update"/></em></a>
                </c:when>
            </c:choose>
        </div>
    </div>

</form>

<script type="text/javascript" src="/resources/smartEdit/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>
    var oEditors = [];

    $(function () {
        <c:forEach items="${languageList}" var="language">
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: document.getElementById('faqContent_${language}'),
            sSkinURI: "/resources/smartEdit/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        </c:forEach>
    })


</script>

</body>

</html>