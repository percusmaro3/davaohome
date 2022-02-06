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

    $(function () {
        $("#startdatepicker").datepicker({
                dateformat: "${countryhtmldateformat}"
            },
            $.datepicker.regional['en-au']);
    });

    $(function () {
        $("#enddatepicker").datepicker({
                dateformat: "${countryhtmldateformat}"
            },
            $.datepicker.regional['en-au']);
    });

    function register () {
        this.location.href = '/place/newplace';
    }

    function showplace (placeno) {
        this.location.href = '/place/' + placeno;
    }

    function searchplace () {
        var f = document.placeform;
        f.action = "/place/placelist";
        f.submit();
    }

    function selectplace (placeno, placename, listimageurl, activeyn) {
        opener.setselectplaceno(placeno, placename, listimageurl, activeyn);
        window.close();
    }

    function importplacebyexcel () {
        _openwindowatcenter('/place/uploadplaceexcel', 700, 400);
    }

</script>

</head>

<body>
<form name="placeForm" action="/place/placeList" method="GET">
    <input type="hidden" name="isPopup" value="${isPopup}"/>
    <c:choose>
    <c:when test="${!isPopup}">
    <div id="wrap">
            <%@include file="../layout/header.jsp" %>

        <div id="container">
                <%@include file="../layout/leftMenu.jsp" %>

            <div id="content">
                </c:when>
                <c:otherwise>
                <div id="pop_content">
                    </c:otherwise>
                    </c:choose>
                    <div class="grid_out">
                        <div class="hd_wrap">
                            <h3><fmt:message key="place.placeManage"/></h3>
                        </div>

                        <div class="hd_wrap2">
                            <h4 class="hd2"><fmt:message key="common.searchCondition"/></h4>
                        </div>
                        <div class="tbl_type2">
                            <table>
                                <caption>Member List Caption</caption>
                                <colgroup>
                                    <col style="width: 125px">
                                    <col style="width: 200px">
                                    <col style="width: 125px">
                                    <col style="width: 250px">
                                    <col style="width: 125px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                </tr>
                                <tr class="paycoSearch">
                                    <th scope="row">
                                        <div class="th"><fmt:message key="common.country"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="countryId" style="width:145px;" class="gray01">
                                                <option value="" ${searchParam.countryId == null ? "selected" : ""} > ----</option>
                                                <c:forEach var="countryIdOp" items="${countryIdList}">
                                                    <option value="${countryIdOp.countryId}" ${searchParam.countryId == countryIdOp.countryId ? "selected" :
                                                            ""}
                                                            >${countryIdOp.countryNamePerLanguage['en']}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>
                                    <th scope="row">
                                        <div class="th"><fmt:message key="place.category"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="categoryId" style="width:145px;" class="gray01">
                                                <option value="" ${searchParam.categoryId == null ? "selected" : ""} > ----</option>

                                                <c:forEach var="categoryIdOp" items="${categoryIdList}">
                                                    <option value="${categoryIdOp}" ${categoryIdOp == searchParam.categoryId ? "selected" : ""}
                                                            >${categoryIdOp}</option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </td>
                                    <th scope="row">
                                        <div class="th"><fmt:message key="place.emptyImage"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="emptyImage" onchange="" style="width:100px;" class="gray01">
                                                <option value="" ${searchParam.emptyImage == null ? "selected" : ""} > ----</option>
                                                <option value=true ${searchParam.emptyImage ? "selected" : ""}
                                                        ><fmt:message key="place.emptyImage"/></option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="paycoSearch">
                                    <th scope="row">
                                        <div class="th"><fmt:message key="place.placeNo"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" title="" style="width:110px" name="placeNo" value="${searchParam.placeNo}"
                                                   class="ipt_txt">
                                        </div>
                                    </td>
                                    <th scope="row">
                                        <div class="th"><fmt:message key="place.placeName"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" title="" style="width:200px" name="placeName" value="${searchParam.placeName}"
                                                   class="ipt_txt">
                                        </div>
                                    </td>
                                    <th scope="row">
                                        <div class="th"><fmt:message key="common.activeYn"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="activeYn" onchange="" style="width:100px;" class="gray01">
                                                <option value="" ${searchParam.activeYn == null ? "selected" : ""} > ----</option>
                                                <option value=Y ${searchParam.activeYn == 'Y' ? "selected" : ""} ><fmt:message
                                                        key="common.yes"/></option>
                                                <option value=W ${searchParam.activeYn == 'W' ? "selected" : ""} ><fmt:message
                                                        key="common.wait"/></option>
                                                <option value=N ${searchParam.activeYn == 'N' ? "selected" : ""} ><fmt:message
                                                        key="common.no"/></option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr class="paycoSearch">
                                    <th scope="row">
                                        <div class="th"><fmt:message key="common.registerAdmin"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" title="" style="width:110px" name="register" value="${searchParam.register}"
                                                   class="ipt_txt">
                                        </div>
                                    </td>
                                    <th scope="row">
                                        <div class="th"><fmt:message key="common.registerDate"/></div>
                                    </th>
                                    <td colspan="3">
                                        <div class="td">
                                            <span class="inp_day">
                                            <input id=startDatePicker name="startDateStr" style="width:80px" class="ipt_txt date" type="text"
                                                   value="${searchParam.startDateStr}"/> </span> ~
                                                    <span class="inp_day">
                                            <input id=endDatePicker name="endDateStr" style="width:80px" class="ipt_txt date" type="text"
                                                   value="${searchParam.endDateStr}"/> </span>
                                        </div>
                                    </td>
                                </tr>

                                </tbody>
                            </table>
                        </div>

                        <div class="btn_final btn_right">
                            <a href="#" onclick="javascript:searchPlace()"><em class="serch"><span></span><fmt:message key="common.search"/></em></a>
                        </div>

                        <div class="hd_wrap2">
                            <h4 class="hd2 fl"><fmt:message key="common.total"/></h4>
                            <span class="result">${paging.totalItemCount} </span>

                            <div class="fr">

                                <a href="http://dav.gg-trip.com/dav/format/PlaceImportFormat.xlsx" class="btn_text"><em
                                        class="f_bold"><fmt:message key="place.downloadPlaceExcel"/></em></a> &nbsp;


                                <a href="#" onclick="javascript:importPlaceByExcel()" class="btn_text"><em class="f_bold"><fmt:message
                                        key="place.importPlaceByExcel"/></em></a> &nbsp;

                                <a href="#" onclick="javascript:register()" class="btn_text"><em class="f_bold"><fmt:message
                                        key="place.registerPlace"/></em></a> &nbsp;
                            </div>
                        </div>

                        <div class="tbl_type tbl_type_v2 scrl_auto">
                            <table>
                                <colgroup>
                                    <col style="width: 90px">
                                    <col style="width: 120px">
                                    <col style="width: 200px">
                                    <col style="width: 200px">
                                    <col style="width: 180px">
                                    <col style="width: 120px">
                                    <col style="width: 120px">
                                    <col style="width: 120px">
                                    <col style="width: 120px">
                                    <col style="width: 90px">
                                    <col style="width: 90px">
                                    <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="place.placeNo"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.country"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="place.placeName"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="place.mainTitle"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="place.area"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.activeYn"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.registerDate"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.registerAdmin"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.lastUpdater"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.update"/></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${fn:length(placeList) == 0}">
                                        <tr>
                                            <td colspan="10" class="nodata">
                                                <div class="td"><fmt:message key="common.noResultOfSearch"/></div>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="place" items="${placeList}">
                                        <tr>
                                            <td>
                                                <div class="td">
                                                    <u style="cursor:pointer" onclick="showPlace(${place.placeNo})">${place.placeNo}</u>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="td">${place.countryId}</div>
                                            </td>
                                            <td>
                                                <div class="td">
                                                    <u style="cursor:pointer" onclick="showPlace(${place.placeNo})">${place.placeName}</u>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="td" onclick="showPlace(${place.placeNo})">
                                                    <u style="cursor:pointer" onclick="showPlace(${place.placeNo})">${place.mainTitle}</u>
                                                </div>
                                            </td>
                                            <td>
                                                <div class="td">${place.area1Name}</div>
                                            </td>
                                            <td>
                                                <div class="td">${place.activeYn}</div>
                                            </td>
                                            <td>
                                                <div class="td">${cnv:datetime(place.registerDate,countryId)}</div>
                                            </td>
                                            <td>
                                                <div class="td">${cnv:datetime(place.updateDate,countryId)}</div>
                                            </td>
                                            <td>
                                                <div class="td">${place.register}</div>
                                            </td>
                                            <td>
                                                <div class="td">${place.lastUpdater}</div>
                                            </td>
                                            <th scope="col">
                                                <div class="th">
                                                    <div class="td">
                                                        <a href="#" onclick="javascript:showPlace('${place.placeNo}')" class="btn_text">
                                                            <fmt:message key="common.manage"/></a>
                                                        <c:if test="${isPopup}">
                                                            <a href="#" onclick="javascript:selectPlace('${place.placeNo}', '${place.placeName}'
                                                                    ,'${place.listImageUrl}', '${place.activeYn}')"
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
                    <c:if test="${!isPopup}">
                </div>
            </div>
            </c:if>
</form>
<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	