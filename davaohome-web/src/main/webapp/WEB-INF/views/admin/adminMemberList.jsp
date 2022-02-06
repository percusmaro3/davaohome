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

    function viewAdminMember (adminMemberId) {
        _openWindowAtCenter('/adminMember/' + adminMemberId, 650, 610);
    }

    function registerAdminMember () {
        _openWindowAtCenter('/adminMember/newAdminMember', 650, 610);
    }

    function searchAdminMember () {
        var f = document.adminMemberForm;
        f.submit();
    }

</script>

<body>
<form name="adminMemberForm" action="/adminMember/adminMemberList" method="GET">
    <input type="hidden" name="page" value=""/>
    <input type="hidden" name="viewType" value="${viewType}"/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>
        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <!-- content -->
            <div id="content">
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3>AdminMember List</h3>
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
                                <col style="width: 125px">
                                <col>
                            </colgroup>
                            <tbody>
                            <tr>
                            </tr>
                            <tr class="paycoSearch">
                                <th scope="row">
                                    <div class="th"><fmt:message key="adminMember.adminMemberId"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" name="adminMemberId"
                                               value="${param.adminMemberId}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="partner.partner"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="partnerNo">
                                            <option value=""> ---------------</option>
                                            <c:forEach var="partner" items="${partnerList}">
                                                <option value="${partner.partnerNo}" ${param.partnerNo == partner.partnerNo ? "selected" : ""}
                                                        >${partner.partnerName}
                                                </option>
                                            </c:forEach>
                                        </select>
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
                        <a href="#" onclick="javascript:searchAdminMember()"><em class="serch"><span></span><fmt:message
                                key="common.search"/></em></a>
                    </div>


                    <div class="hd_wrap2">
                        <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                        <span class="result">${paging.totalItemCount} </span>

                        <div class="fr">
                            <a href="#" onclick="javascript:registerAdminMember()" class="btn_text"><em class="f_bold"><fmt:message
                                    key="admin.registerAdminMember"/></em></a> &nbsp;
                        </div>
                    </div>

                    <div class="tbl_type tbl_type_v2 scrl_auto">
                        <table>
                            <caption>목록</caption>
                            <colgroup>
                                <col>
                                <col style="width: 200px">
                                <col style="width: 200px">
                                <col style="width: 150px">
                                <col style="width: 100px">
                                <col style="width: 90px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <div class="th"><fmt:message key="adminMember.adminMemberId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.countryId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="partner.partner"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="adminMember.adminMemberType"/></div>
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
                            <c:if test="${fn:length(adminMemberList) == 0}">
                                <tr>
                                    <td colspan="6" class="nodata">
                                        <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="adminMember" items="${adminMemberList}">
                                <tr>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer"
                                               onclick="viewAdminMember('${adminMember.adminMemberId}')">${adminMember.adminMemberId}
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">${adminMember.countryId}</div>
                                    </td>
                                    <td>
                                        <div class="td">${adminMember.partnerName}</div>
                                    </td>
                                    <td>
                                        <div class="td">${adminMember.adminMemberType}</div>
                                    </td>
                                    <td>
                                        <div class="td">${adminMember.activeYn}</div>
                                    </td>
                                    <th scope="col">
                                        <div class="th">
                                            <div class="td"><a href="#" onclick="javascript:viewAdminMember('${adminMember.adminMemberId}')"
                                                               class="btn_text"><fmt:message key="common.view"/></a></div>
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

        <%@include file="../layout/footer.jsp" %>
    </div>
</body>
</html>
