<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page session="false" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>

<script>

    function bulkInsertUsim () {
        if (!confirm("<fmt:message key="place.confirmUploadPlaceExcel"/>"))
            return;

        var f = document.placeUploadForm;
        f.submit();
    }

</script>

<body>
<form name="placeUploadForm" action="/place/importPlace" enctype="multipart/form-data" method="POST">

    <div id="pop_wrap" style="width:500px">
        <div id="pop_header">
            <h1><fmt:message key="place.importPlaceByExcel"/></h1>
        </div>
        <div id="pop_content">
            <c:if test="${errorMsgWithBR != ''}">
                <span style="color:red;">${errorMsgWithBR}</span><br/>
            </c:if>
            <div class="tbl_type2">
                <table>
                    <colgroup>
                        <col style="width:130px">
                        <col>
                    </colgroup>
                    <tbody>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="place.placeExcelFile"/><em class="must2">*<span class="blind">필수</span></em></div>
                        </th>
                        <td>
                            <div class="td"><input type="file" name="placeExcelFile" value=""></div>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="btn_wrap btn_final">
            <a href="#" onclick="javascript:bulkInsertUsim()"><em class="noico"><fmt:message key="common.register"/></em></a>
            <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.cancel"/></em></a>
        </div>
    </div>

</form>
</body>

</html>