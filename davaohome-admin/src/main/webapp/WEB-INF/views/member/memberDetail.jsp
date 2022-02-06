<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>


</script>

<body>
<form name="memberForm" method="POST">
    <input type="hidden" name="memberNo" value="${memberNo}"/>

    <div id="pop_wrap" style="width:100%">
        <div id="pop_header">
            <h1>
                <fmt:message key="member.memberInfo"/>
            </h1>
        </div>
        <div id="pop_content">
            <div class="tbl_type2">
                <table>
                    <colgroup>
                        <col style="width:150px">
                        <col style="width:350px">
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.countryId"/><em class="must2"/></div>
                        </th>
                        <td>
                            <div class="td">${member.countryId}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="member.memberNo"/><em class="must2"/></div>
                        </th>
                        <td>
                            <div class="td">${member.memberNo}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="member.memberId"/><em class="must2"/></div>
                        </th>
                        <td>
                            <div class="td">${member.memberId}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.agentId"/></div>
                        </th>
                        <td>
                            <div class="td">${member.agentId}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="member.memberType"/></div>
                        </th>
                        <td>
                            <div class="td">${member.memberType}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="member.activeYn"/></div>
                        </th>
                        <td>
                            <div class="td">${member.activeYn}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.registerDate"/></div>
                        </th>
                        <td>
                            <div class="td">
                                ${cnv:date(member.registerDate,countryId)}
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                        </th>
                        <td>
                            <div class="td">${cnv:date(member.updateDate,countryId)}</div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="common.lastUpdater"/></div>
                        </th>
                        <td>
                            <div class="td">${member.lastUpdater}</div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <div class="btn_wrap btn_final">
                <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>
            </div>

            <br/>
        </div>
</form>

</body>
</html>
