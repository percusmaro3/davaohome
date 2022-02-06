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

    function openMemberView (memberNo) {
        _openWindowAtCenter('/member/' + memberNo, 550, 610);
    }

    //    function viewMember (memberNo) {
    //        var f = document.memberForm;
    //        f.action = "/member/" + memberNo;
    //        f.submit();
    //    }

    function downloadCsv () {
        var f = document.memberForm;
        f.action = "/member/memberExcelList";
        f.submit();
    }

    function searchMember () {
        var f = document.memberForm;
        f.action = "/member/memberList";
        f.submit();
    }

</script>

<body>
<form name="memberForm" action="/member/memberList" method="GET">
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
                        <h3>Member List</h3>
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
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="memberId"
                                               value="${param.memberId}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="member.memberType"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="memberType">
                                            <option value=""> ---------------</option>
                                            <option value="FB" ${param.memberType == 'FB' ? "selected" : ""} >Facebook</option>
                                            <option value="WISE" ${param.memberType == 'WISE' ? "selected" : ""} >WISE</option>
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
                        <a href="#" onclick="javascript:searchMember()"><em class="serch"><span></span><fmt:message key="common.search"/></em></a>
                    </div>


                    <div class="hd_wrap2">
                        <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                        <span class="result">${paging.totalItemCount} </span>

                        <div class="fr">
                            <c:if test="${paging.totalItemCount != 0}">
                                <a href="#" onclick="javascript:downloadCsv()" class="btn_text">
                                    <em class="excel"><fmt:message key="common.ExcelDownload"/></em>
                                </a>
                            </c:if>
                        </div>
                    </div>

                    <div class="tbl_type tbl_type_v2 scrl_auto">
                        <table>
                            <caption>목록</caption>
                            <colgroup>
                                <col style="width: 90px">
                                <col>
                                <col>
                                <col style="width: 140px">
                                <col style="width: 90px">
                                <col style="width: 90px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.countryId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberNo"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberType"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.agentId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.view"/></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${fn:length(memberList) == 0}">
                                <tr>
                                    <td colspan="6" class="nodata">
                                        <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                    </td>
                                </tr>
                            </c:if>
                            <c:forEach var="member" items="${memberList}">
                                <tr>
                                    <td>
                                        <div class="td">${member.countryId}</div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer" onclick="openMemberView(${member.memberNo})">${member.memberNo}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">
                                            <u style="cursor:pointer" onclick="openMemberView('${member.memberNo}')">${member.memberId}</u>
                                        </div>
                                    </td>
                                    <td>
                                        <div class="td">${member.memberType}</div>
                                    </td>
                                    <td>
                                        <div class="td">${member.agentId}</div>
                                    </td>

                                    <th scope="col">
                                        <div class="th">
                                            <div class="td"><a href="#" onclick="javascript:openMemberView('${member.memberNo}')"
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
