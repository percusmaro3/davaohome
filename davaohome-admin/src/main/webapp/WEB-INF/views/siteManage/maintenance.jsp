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

    function applyMaintenance () {

        if (!confirm("점검 적용을 하시겠습니까?")) {
            return;
        }

        var f = document.maintenanceForm;
        f.status.value = "Y";
        f.submit();
    }

    function stopMaintenance () {
        if (!confirm("점검을 중지 하시겠습니까?")) {
            return;
        }

        var f = document.maintenanceForm;
        f.status.value = "N";
        f.submit();
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
                    <h3>점검 관리</h3>
                </div>
                <br/>

                <form name="maintenanceForm" action="/siteManage/maintenance">
                    <input type="hidden" name="status" value=""/>

                    <div class="section">
                        <h4 class="hd2">현재 상태</h4>

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
                                                <c:when test="${maintenance.status == 'Y'}">
                                                    <font color="red"><h3> 점검 중 </h3></font> <br/>
                                                    기간 : ${cnv:datetime(maintenance.startDatetime,countryId)} ~
                                                    ${cnv:datetime(maintenance.endDatetime,countryId)} &nbsp;&nbsp;&nbsp;
                                                    <a href="#" onclick="javascript:stopMaintenance()"
                                                       class="btn_text"><em class="noico"><fmt:message key="site.stopMaintenance"/></em></a>
                                                </c:when>
                                                <c:otherwise>
                                                    서비스 중
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
                        <h4 class="hd2">점검 변경</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">점검 적용 (YYYYMMDDHHMM)<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="startDatetime" value=""/> ~
                                            <input type="text" name="endDatetime" value=""/> &nbsp;&nbsp;&nbsp;&nbsp;

                                            <a href="#" onclick="javascript:applyMaintenance()"
                                               class="btn_text"><em class="noico"><fmt:message key="site.applyMaintenance"/></em></a>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
            <br/><br/>

        </div>
        <!-- //content -->
    </div>
</div>
<br/><br/><br/>
<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	