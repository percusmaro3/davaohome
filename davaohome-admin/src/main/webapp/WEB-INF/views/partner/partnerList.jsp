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

    function viewPartner (partnerNo) {
        _openWindowAtCenter('/partner/' + partnerNo, 650, 610);
    }

    function registerPartner () {
        _openWindowAtCenter('/partner/newPartner', 650, 610);
    }

    function searchPartner () {
        var f = document.partnerForm;
        f.submit();
    }

    function selectPartner (partnerNo, partnerName) {
        opener.setSelectPartner(partnerNo, partnerName);
        window.close();
    }

</script>

<body>
<form name="partnerForm" action="/partner/partnerList" method="GET">
    <input type="hidden" name="isPopup" value="${isPopup}"/>

    <c:choose>
    <c:when test="${!isPopup}">
    <div id="wrap">
        <%@include file="../layout/header.jsp" %>
        <div id="container">

            <%@include file="../layout/leftMenu.jsp" %>
            <div id="content">
                <!-- content -->
                </c:when>
                <c:otherwise>
                <div id="pop_content">
                    </c:otherwise>
                    </c:choose>
                    <div class="grid_out">
                        <div class="hd_wrap">
                            <h3>Partner List</h3>
                        </div>
                        <div class="hd_wrap2">
                            <h4 class="hd2"><fmt:message key="common.searchCondition"/></h4>
                        </div>
                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width: 125px">
                                    <col>
                                    <col style="width: 125px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                </tr>
                                <tr class="paycoSearch">
                                    <th scope="row">
                                        <div class="th"><fmt:message key="partner.partnerName"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" title="" name="partnerName"
                                                   value="${param.partnerName}" class="ipt_txt">
                                        </div>
                                    </td>
                                    <th scope="row">
                                        <div class="th"><fmt:message key="common.countryId"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="countryId">
                                                <option value=""> ---------------</option>
                                                <c:forEach var="country" items="${countryList}">
                                                    <option value="${country.countryId}" ${param.countryId == country.countryId ? "selected" : ""}
                                                            >${country.countryNamePerLanguage['en']}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>

                        <div class="btn_final btn_right">
                            <a href="#" onclick="javascript:searchPartner()"><em class="serch"><span></span><fmt:message
                                    key="common.search"/></em></a>
                        </div>


                        <div class="hd_wrap2">
                            <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                            <span class="result">${paging.totalItemCount} </span>

                            <div class="fr">
                                <a href="#" onclick="javascript:registerPartner()" class="btn_text"><em class="f_bold"><fmt:message
                                        key="partner.registerPartner"/></em></a> &nbsp;
                            </div>
                        </div>

                        <div class="tbl_type tbl_type_v2 scrl_auto">
                            <table>
                                <caption>목록</caption>
                                <colgroup>
                                    <col style="width: 100px">
                                    <col style="width: 200px">
                                    <col>
                                    <col style="width: 150px">
                                    <col style="width: 90px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="partner.partnerNo"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="common.countryId"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="partner.partnerName"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="common.activeYn"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="common.view"/></div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${fn:length(partnerList) == 0}">
                                    <tr>
                                        <td colspan="5" class="nodata">
                                            <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                        </td>
                                    </tr>
                                </c:if>
                                <c:forEach var="partner" items="${partnerList}">
                                    <tr>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer"
                                                   onclick="viewPartner('${partner.partnerNo}')">${partner.partnerNo}
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">${partner.countryId}</div>
                                        </td>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer"
                                                   onclick="viewPartner('${partner.partnerNo}')">${partner.partnerName}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">${partner.activeYn}</div>
                                        </td>
                                        <th scope="col">
                                            <div class="th">
                                                <div class="td"><a href="#" onclick="javascript:viewPartner('${partner.partnerNo}')"
                                                                   class="btn_text"><fmt:message key="common.view"/></a>
                                                    <c:if test="${isPopup}">
                                                        <a href="#"
                                                           onclick="javascript:selectPartner('${partner.partnerNo}', '${partner.partnerName}')"
                                                           class="btn_text">
                                                            <fmt:message key="common.select"/></a>
                                                    </c:if>
                                                </div>
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
            <c:if test="${!isPopup}">
        </div>
    </div>
    </c:if>

    <%@include file="../layout/footer.jsp" %>
    </div>
</body>
</html>
