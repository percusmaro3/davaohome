<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>

<%@include file="../base/includeMeta.jsp" %>
<%@ taglib prefix="page" uri="pagingTag" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
    <script type="text/javascript" src="/resources/js/translate.js"></script>
</head>

<script>

    function startMainNotice () {

        if (!confirm("메인 공지를 적용 하시겠습니까?")) {
            return;
        }

        var f = document.mainNoticeForm;
        f.status.value = "Y";
        f.submit();
    }

    function stopMainNotice () {
        if (!confirm("메인 공지를 중지 하시겠습니까?")) {
            return;
        }

        var f = document.mainNoticeForm;
        f.status.value = "N";
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

<div id="wrap">
    <%@include file="../layout/header.jsp" %>

    <div id="container">
        <%@include file="../layout/leftMenu.jsp" %>

        <div id="content">
            <div class="tbl_type2">
                <div class="hd_wrap">
                    <h3>메인 공지</h3>
                </div>
                <br/>

                <form name="mainNoticeForm" action="/siteManage/mainNotice" method="POST">
                    <input type="hidden" name="status" value=""/>

                    <div class="section">
                        <h4 class="hd2">메인 공지 현재 상태</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">현재 상태<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <c:choose>
                                                <c:when test="${mainNoticeStatus == 'Y'}">
                                                    메인 공지 게시 중 <br/>
                                                    <c:forEach items="${languageList}" var="language" varStatus="status">
                                                        <c:set var="languageStr">${language}</c:set>
                                                        <c:set value="${mainNoticeMap[languageStr]}" var="contents"/>
                                                        <a href="${contents.noticeUrl}">${languageStr} : ${contents.noticeUrl}</a> <br/>

                                                    </c:forEach>
                                                    <br/>
                                                    <a href="#" onclick="javascript:stopMainNotice()"
                                                       class="btn_text"><em class="noico"><fmt:message key="site.stopMainNotice"/></em></a>
                                                </c:when>
                                                <c:otherwise>
                                                    메인 공지 없음 &nbsp;&nbsp;&nbsp; <a href="#" onclick="javascript:startMainNotice()"
                                                                                   class="btn_text"><em class="noico"><fmt:message
                                                        key="site.startMainNotice"/></em></a>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/><br/>

                    <div class="section">
                        <h4 class="hd2">메인 공지 적용</h4>

                        <div class="tab_menu">
                            <ul class="tc">
                                <c:forEach items="${languageList}" var="language" varStatus="status">
                                    <c:set var="languageStr">${language}</c:set>
                                    <c:set value="${place.contentsMap[languageStr]}" var="contents"/>

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
                            <c:set value="${mainNoticeMap[languageStr]}" var="contents"/>

                            <div id="contentsTable_${language}" style="display:${status.index == 0 ? "block" : "none"}">
                                <table>
                                    <colgroup>
                                        <col style="width:130px">
                                        <col>
                                    </colgroup>
                                    <tbody>
                                    <tr>
                                        <th>
                                            <div class="th">${languageStr} <fmt:message key="site.mainNotice"/></div>
                                        </th>
                                        <td colspan="3">
                                            <div class="td">
                                                <div class="td">
                                                    <input type="text" name="mainNotice_${language}" style="width:350px"
                                                           value="${contents.noticeUrl}"></div>
                                            </div>
                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </c:forEach>
                    </div>
                </form>
            </div>
        </div>
        <!-- //content -->
    </div>
</div>
<br/><br/><br/>
<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	