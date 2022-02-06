<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>
<%@ taglib prefix="page" uri="pagingTag" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>

<script>

    function registerNotice () {
        _openWindowAtCenter('/notice/newNotice', 1000, 830);
    }

    function showNotice (noticeNo) {
        _openWindowAtCenter('/notice/' + noticeNo, 1000, 830);
    }

    function searchNotice () {
        var f = document.noticeForm;
        f.action = "/notice/noticeList";
        f.submit();
    }

</script>

</head>

<body>
<form name="noticeForm" action="/customer/noticeList" method="GET">

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>

        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <div id="content">
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3><fmt:message key="notice.noticeManage"/></h3>
                    </div>

                    <div class="hd_wrap2">
                        <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                        <span class="result">${paging.totalItemCount} </span>

                        <div class="fr">
                            <a href="#" onclick="javascript:registerNotice()" class="btn_text"><em class="f_bold"><fmt:message
                                    key="notice.registerNotice"/></em></a> &nbsp;
                        </div>
                    </div>

                    <div class="tbl_type tbl_type_v2 scrl_auto">
                        <table>
                            <colgroup>
                                <col style="width: 100px">
                                <col>
                                <col style="width: 90px">
                                <col style="width: 180px">
                                <col style="width: 90px">
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="notice.noticeNo"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="notice.noticeTitle"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="common.displayYn"/></div>
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
                                <c:if test="${fn:length(noticeList) == 0}">
                                    <tr>
                                        <td colspan="5" class="nodata">
                                            <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="notice" items="${noticeList}">
                                    <tr>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer" onclick="showNotice(${notice.noticeNo})">${notice.noticeNo}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer" onclick="showNotice(${notice.noticeNo})">${notice.title}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">${notice.activeYn}</div>
                                        </td>
                                        <td>
                                            <div class="td">${cnv:datetime(notice.updateDate,countryId)}</div>
                                        </td>
                                        <th scope="col">
                                            <div class="th">
                                                <div class="td"><a href="#" onclick="javascript:showNotice('${notice.noticeNo}')"
                                                                   class="btn_text"><fmt:message key="common.manage"/></a></div>
                                            </div>
                                        </th>
                                    </tr>
                                </c:forEach>
                                </tbody>
                        </table>
                    </div>
                    <br/><br/>
                    <table class="Nnavi" align="center">
                        <page:display pagination="${paging}"/>
                    </table>
                </div>
            </div>
        </div>
</form>
<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	