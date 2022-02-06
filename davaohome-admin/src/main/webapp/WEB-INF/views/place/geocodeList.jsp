<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
</head>


<script>

    function selectGeocode (lat, lng) {
        opener.setSelectGeocode(lat, lng);
        window.close();
    }

</script>

<body>
<div id="pop_wrap" style="width:100%">
    <div id="pop_header">
        <h1>
            <fmt:message key="place.getGeocode"/>
        </h1>
    </div>
    <div id="pop_content">
        <div class="tbl_type2">
            <div class="yellow_box">
                <p class="yellow_mark"><fmt:message key="place.geocodeDesc2"/></p>

                <p><fmt:message key="place.geocodeDesc3"/></p>
            </div>

            <table>
                <colgroup>
                    <col style="width:350px">
                    <col style="width:200px">
                    <col style="width:80px">
                </colgroup>
                <tbody>
                <tr>
                    <th scope="col">
                        <div class="th"><fmt:message key="place.address"/></div>
                    </th>
                    <th scope="col">
                        <div class="th"><fmt:message key="place.geocode"/></div>
                    </th>
                    <th scope="col">
                        <div class="th"><fmt:message key="common.select"/></div>
                    </th>
                </tr>
                <c:if test="${fn:length(geocodeResultList) == 0}">
                    <tr>
                        <td colspan="3" class="nodata">
                            <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                        </td>
                    </tr>
                </c:if>
                <c:forEach var="result" items="${geocodeResultList}">
                    <tr>
                        <td>
                            <div class="td">${result.resultAddress}</div>
                        </td>
                        <td>
                            <div class="td">${result.latitude} / ${result.longitude}</div>
                        </td>
                        <td>
                            <div class="td">
                                <a href="#" onclick="javascript:selectGeocode(${result.latitude}, ${result.longitude})"
                                   class="btn_text">
                                    <fmt:message key="common.select"/></a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>

                </tbody>
            </table>
        </div>
        <div class="btn_wrap btn_final">
            <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>
        </div>

        <br/>
    </div>

</body>
</html>
