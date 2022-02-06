<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
    <script type="text/javascript" src="/resources/js/translate.js"></script>
</head>

<script>

    function insertNotice () {
        if (!confirm("<fmt:message key="notice.confirmRegisterNotice"/>"))
            return;

        setContents();

        var f = document.noticeForm;
        f.action = "/notice/register";
        f.submit();
    }

    function updateNotice () {
        if (!confirm("<fmt:message key="notice.confirmUpdateNotice"/>"))
            return;

        setContents();

        var f = document.noticeForm;
        f.action = "/notice/update";
        f.submit();
    }

    function setContents () {
        <c:forEach items="${languageList}" var="language">
        oEditors.getById["noticeContent_${language}"].exec("UPDATE_CONTENTS_FIELD", []);  // 에디터의 내용이 textarea에 적용됩니다.
        </c:forEach>
    }

    function selectLanguage (language) {
        hideContentsTable();
        var contentsTable = "contentsTable_" + language;
        $('#' + contentsTable).show();

        var tab = "tab_" + language;
        $('#' + tab).addClass('on');

        oEditors.getById["descriptionHtml_"+language].exec("CHANGE_EDITING_MODE", ["WYSIWYG"]);
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
        _doTranslate("INPUT", "input[name=title_", targetLanguage);
        _doTranslate("HTMLEDITOR", "noticeContent_", targetLanguage);
    }

</script>

<body>
<form name="noticeForm" action="/notice/register" method="POST">
    <input type="hidden" name="noticeNo" value="${notice.noticeNo}"/>

    <div id="pop_wrap" style="width:900px">
        <div id="pop_header">
            <h1><fmt:message key="notice.noticeManage"/></h1>
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
                                <div class="th"><fmt:message key="notice.noticeNo"/></div>
                            </th>
                            <td>
                                <div class="td">${notice.noticeNo}</div>
                            </td>
                        </tr>
                        </tbody>
                    </table>
                    <br/>
                </c:if>
                <form:form commandName="notice">



                    <div class="tab_menu">
                        <ul class="tc">
                            <c:forEach items="${languageList}" var="language" varStatus="status">
                                <c:set var="languageStr">${language}</c:set>
                                <c:set value="${notice.contentsMap[languageStr]}" var="contents"/>

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
                        <c:set value="${notice.contentsMap[languageStr]}" var="contents"/>

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
                                        <div class="th"><fmt:message key="notice.noticeTitle"/><em class="must2">*<span class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="title_${language}" style="width:350px"
                                                   value="${contents != null ? contents.title : ""}">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="notice.noticeContent"/><em class="must2">*<span class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                    <textarea cols="50" id="noticeContent_${language}" name="noticeContent_${language}" rows="15" class="ipt_txt"
                                              style="width:100%;height:400px;">${contents != null ? contents.content : ""}</textarea>

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
                                    <option value=Y ${notice.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                    <option value=N ${notice.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>
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
                                        ${cnv:datetime(notice.registerDate,countryId)}
                                </div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                            </th>
                            <td>
                                <div class="td">${cnv:datetime(notice.updateDate,countryId)}</div>
                            </td>
                            <th>
                                <div class="th"><fmt:message key="common.lastUpdater"/></div>
                            </th>
                            <td>
                                <div class="td">${notice.lastUpdater}</div>
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
                    <a href="#" onclick="javascript:insertNotice()"><em class="noico"><fmt:message key="common.register"/></em></a>
                </c:when>
                <c:when test="${jobType == 'UPDATE'}">
                    <a href="#" onclick="javascript:updateNotice()"><em class="noico"><fmt:message key="common.update"/></em></a>
                </c:when>
            </c:choose>
            <a href="#" class="gray" onclick="javascript:resetIframe()"><em class="noico">TEST</em></a>
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
            elPlaceHolder: document.getElementById('noticeContent_${language}'),
            sSkinURI: "/resources/smartEdit/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        </c:forEach>
    })


    function resetIframe(){
        var styleStr = "width: 100%; height: 449px;"
        <c:forEach items="${languageList}" var="language">
        if( "${language}" != "en" ){
            var iframe${language} = document.getElementById("frm_noticeContent__${language}");
            iframe${language}.setAttribute("style",styleStr);
        }
        </c:forEach>
    }



</script>

</body>

</html>