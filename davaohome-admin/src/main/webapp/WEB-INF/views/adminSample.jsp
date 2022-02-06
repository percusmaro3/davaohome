<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>

    <%@include file="../base/includeResources.jsp" %>

</head>

<script>


</script>

<body>
<form name="memberForm" action="memberList.cnv" method="GET">

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>
        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <!-- content -->
            <div id="content">
                <c:if test="${errorMsgWithBR != ''}">
                    <div class="err-title">${errorMsgWithBR}</div>
                </c:if>
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3>Member List</h3>
                    </div>
                    <div class="hd_wrap2">
                        <h4 class="hd2">Search condition</h4>
                    </div>
                    <div class="tbl_type2">
                        <table>
                            <caption>Member List Caption</caption>
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
                                    <div class="th"><fmt:message key="member.mobileTel"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="mobileTel"
                                               value="${mobileTel}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <td colspan="3">
                                    <div class="td">
                                        <input type="text" title="" name="memberId" style="width:200px" value="${memberId}" class="ipt_txt">
                                    </div>
                                </td>
                            </tr>

                            <tr class="paycoSearch">
                                <th scope="row">
                                    <div class="th"><fmt:message key="member.memberName"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="memberName"
                                               value="${memberName}" class="ipt_txt">
                                    </div>
                                </td>
                                <th scope="row">
                                    <div class="th"><fmt:message key="member.englishMemberName"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <input type="text" title="" name="memberFuri"
                                               value="${memberFuri}" class="ipt_txt">
                                    </div>
                                </td>
                                <c:choose>
                                    <c:when test="${memberType =='PERSON'}">
                                        <th scope="row">&nbsp;</th>
                                        <td>&nbsp;</td>
                                    </c:when>
                                    <c:when test="${memberType =='COMPANY'}">
                                        <th scope="row">
                                            <div class="th"><fmt:message key="member.companyName"/></div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <input type="text" title="" name="companyName"
                                                       value="${companyName}" class="ipt_txt">
                                            </div>
                                        </td>
                                    </c:when>
                                </c:choose>
                            </tr>
                            </tbody>
                        </table>
                    </div>

                    <div class="btn_final btn_right">
                        <a href="#" onclick="javascript:searchMember()"><em class="serch"><span></span><fmt:message key="common.search"/></em></a>
                    </div>


                    <div class="hd_wrap2">
                        <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                        <span class="result">${pagerInfo.totalRows} </span>

                        <div class="fr">
                            <c:if test="${country != 'TAIWAN'}">
                                <a href="#" onclick="javascript:openMemberRegister()" class="btn_text"><em class="f_bold"><fmt:message
                                        key="member.registerMember"/></em></a> &nbsp;
                                <a href="#" onclick="javascript:openMemberBatchRegister()" class="btn_text"><em class="f_bold"><fmt:message
                                        key="member.registerBatchMember"/></em></a>
                            </c:if>
                            <c:if test="${pagerInfo.totalRows != 0}">
                                <a href="#" onclick="javascript:downloadCsv()" class="btn_text"><em class="excel"><fmt:message
                                        key="common.ExcelDownload"/></em></a>
                            </c:if>
                        </div>
                    </div>

                    <div class="tbl_type tbl_type_v2 scrl_auto">
                        <table>
                            <caption>회원 목록</caption>
                            <colgroup>
                                <col style="width: 90px">
                                <col>
                                <col>
                                <c:if test="${memberType =='COMPANY'}">
                                    <col>
                                </c:if>
                                <col style="width: 140px">
                                <col style="width: 90px">
                                <col style="width: 90px">
                            </colgroup>
                            <thead>
                            <tr>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberId"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.memberName"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.englishMemberName"/></div>
                                </th>
                                <c:if test="${memberType =='COMPANY'}">
                                    <th scope="col">
                                        <div class="th"><fmt:message key="member.company"/></div>
                                    </th>
                                </c:if>
                                <th scope="col">
                                    <div class="th"><fmt:message key="member.mobileTel"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="common.update"/></div>
                                </th>
                                <th scope="col">
                                    <div class="th"><fmt:message key="order.orderManage"/></div>
                                </th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:if test="${fn:length(memberList) == 0}">
                                <c:choose>
                                    <c:when test="${memberType =='PERSON'}">
                                        <tr>
                                            <td colspan="6" class="nodata">
                                                <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                            </td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="7" class="nodata">
                                                <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                            </td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </c:if>
                            <c:forEach var="member" items="${memberList}">
                                <tr>
                                    <td>
                                        <div class="td">${member.memberId}</div>
                                    </td>
                                    <td>
                                        <div class="td">${member.memberName}</div>
                                    </td>
                                    <td>
                                        <div class="td">${member.memberFuri}</div>
                                    </td>
                                    <c:if test="${memberType =='COMPANY'}">
                                        <td>
                                            <div class="td">${member.companyName}</div>
                                        </td>
                                    </c:if>
                                    <td>
                                        <div class="td">${member.mobileTel}</div>
                                    </td>
                                    <th scope="col">
                                        <div class="th">
                                            <div class="td"><a href="#" onclick="javascript:openMemberUpdate('${member.memberId}')"
                                                               class="btn_text"><fmt:message key="common.update"/></a></div>
                                        </div>
                                    </th>
                                    <th scope="col">
                                        <div class="th">
                                            <c:if test="${country != 'TAIWAN'}">
                                                <c:choose>
                                                    <c:when test="${memberType =='PERSON'}">
                                                        <div class="td"><a href="#" onclick="javascript:registerB2COrder('${member.memberId}')"
                                                                           class="btn_text"><fmt:message key="order.newOrder"/></a></div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <div class="td"><a href="#" onclick="javascript:registerB2BOrder('${member.memberId}')"
                                                                           class="btn_text"><fmt:message key="order.newOrder"/></a></div>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:if>
                                        </div>
                                    </th>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br/><br/>
                    <table class="Nnavi" align="center">
                        <tr>
                            <lucy:navigator>
                                <lucy:first/>
                                <lucy:prev/>
                                <lucy:index/>
                                <lucy:next/>
                                <lucy:last/>
                            </lucy:navigator>
                        </tr>
                    </table>
                </div>
            </div>
        </div>

        <%@include file="../layout/footer.jsp" %>
    </div>
</body>
</html>
