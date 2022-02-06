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

    function setContents () {
        <c:forEach items="${languageList}" var="language">
        oEditors.getById["mailTemplateContent_${language}"].exec("UPDATE_CONTENTS_FIELD", []);  // 에디터의 내용이 textarea에 적용됩니다.
        </c:forEach>
    }

    function updateMailTemplate () {
        if (!confirm("<fmt:message key="mail.confirmUpdateMailTemplate"/>"))
            return;

        setContents();

        var f = document.mailTemplateForm;
        f.action = "/mailbak/updateMailTemplate";
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


</script>
</head>

<body>

<form name="mailTemplateForm" action="/mail/updateMailTemplate" method="POST">
    <input type="hidden" name="mailTemplateId" value="${mailTemplateId}"/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>

        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <div id="content">
                <div class="tbl_type2">
                    <div class="hd_wrap">
                        <h3>${mailTemplateName}</h3>
                    </div>

                    <c:if test="${errorMsg != ''}">
                        <p style="color:red;float:left;font-weight: bold">${errorMsg}</p><br/>
                    </c:if>

                    <div class="yellow_box">
                        <p style="margin-left:15px">${templateVariableDesc}</p>
                    </div>

                    <div class="tab_menu">
                        <ul class="tc">
                            <c:forEach items="${languageList}" var="language" varStatus="status">
                                <c:set var="languageStr">${language}</c:set>
                                <c:set value="${mailTemplateMap[languageStr]}" var="contents"/>

                                <li id="tab_${language}" ${status.index == 0 ? "class=on" : ""}>
                                    <a href="javascript:onclick=selectLanguage('${language}')">
                                        <fmt:message key="${language.languageDisplayName}"/>
                                            ${contents != null ? "" : "<font color=red>(*)</font>"}
                                    </a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <br/>

                    <c:forEach items="${languageList}" var="language" varStatus="status">
                        <c:set var="languageStr">${language}</c:set>
                        <c:set value="${mailTemplateMap[languageStr]}" var="contents"/>

                        <div id="contentsTable_${language}" style="width:800px;display:${status.index == 0 ? "block" : "none"}">
                            <table>
                                <colgroup>
                                    <col style="width:130px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="mail.mailSubject"/><em class="must2">*<span
                                                class="blind">필수</span></em>
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
                                        <div class="th"><fmt:message key="mail.content"/><em class="must2">*<span
                                                class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                    <textarea cols="50" id="mailTemplateContent_${language}" name="content_${language}" rows="15" class="ipt_txt"
                                              style="width:100%;height:400px;">${contents != null ? contents.content : ""}</textarea>
                                        </div>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>

                    <div class="btn_final btn_right" style="width:800px">
                        <a href="javascript:updateMailTemplate();"><em class="noico"><fmt:message key="common.update"/></em></a>
                    </div>
                </div>

            </div>
            <!-- //content -->
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
            elPlaceHolder: document.getElementById('mailTemplateContent_${language}'),
            sSkinURI: "/resources/smartEdit/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        </c:forEach>
    })

</script>

<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	