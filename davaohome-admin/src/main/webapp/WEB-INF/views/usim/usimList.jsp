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

    function registerUsim () {
        _openWindowAtCenter('/usim/newUsim', 1000, 830);
    }

    function showUsim (usimNo) {
        _openWindowAtCenter('/usim/' + usimNo, 1000, 830);
    }

    function searchUsim () {
        var f = document.usimForm;
        f.action = "/usim/usimList";
        f.submit();
    }

</script>

</head>

<body>
<form name="usimForm" action="/usim/usimList" method="GET">

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>

        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <div id="content">
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3><fmt:message key="usim.usimManage"/></h3>
                    </div>

                    <div class="hd_wrap2">
                        <h4 class="hd2"><fmt:message key="common.searchCondition"/></h4>
                    </div>
                    <div class="tbl_type2">
                        <table>
                            <caption>Member List Caption</caption>
                            <colgroup>
                                <col style="width: 125px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                            </tr>
                            <tr class="paycoSearch">
                                <th scope="row">
                                    <div class="th"><fmt:message key="usim.usimId"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="usimCountryCondition" onchange="" style="width:145px;" class="gray01">
                                            <option value="" ${status == null ? "selected" : ""} > ----</option>

                                            <c:forEach var="usimCountry" items="${usimCountryList}">
                                                <option value="${usimCountry}" ${usimCountry == usimCountryCondition ? "selected" : ""} >${usimCountry}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="btn_final btn_right">
                        <a href="#" onclick="javascript:searchUsim()"><em class="serch"><span></span><fmt:message key="common.search"/></em></a>
                    </div>

                    <div class="hd_wrap2">
                        <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                        <span class="result">${paging.totalItemCount} </span>

                        <div class="fr">
                            <a href="#" onclick="javascript:registerUsim()" class="btn_text"><em class="f_bold"><fmt:message
                                    key="usim.registerUsim"/></em></a> &nbsp;
                        </div>
                    </div>

                    <div class="tbl_type tbl_type_v2 scrl_auto">
                        <table>
                            <colgroup>
                                <col style="width: 100px">
                                <col style="width: 90px">
                                <col>
                                <col style="width: 100px">
                                <col style="width: 180px">
                                <col style="width: 90px">
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="usim.usimNo"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="usim.usimCountry"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="usim.usimGoodsName"/></div>
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
                                <c:if test="${fn:length(usimList) == 0}">
                                    <tr>
                                        <td colspan="5" class="nodata">
                                            <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="usim" items="${usimList}">
                                    <tr>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer" onclick="showUsim(${usim.usimNo})">${usim.usimNo}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">${usim.usimCountry}</div>
                                        </td>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer" onclick="showUsim(${usim.usimNo})">${usim.goodsName}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">${usim.activeYn}</div>
                                        </td>
                                        <td>
                                            <div class="td">${cnv:datetime(usim.updateDate,countryId)}</div>
                                        </td>
                                        <th scope="col">
                                            <div class="th">
                                                <div class="td"><a href="#" onclick="javascript:showUsim('${usim.usimNo}')"
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
	