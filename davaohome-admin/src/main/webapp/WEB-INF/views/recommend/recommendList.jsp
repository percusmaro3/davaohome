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

    //    function doDeployDirect () {
    //        $.ajax({
    //            dataType: 'json',
    //            data: $('#insertBigrecommendList').serialize(),
    //            url: '/adminV1/commonMain/insertBigrecommendListDirect.nhn',
    //            success: function (result) {
    //                if (result.result.code == 9999) {
    //                    alert(result.data);
    //                } else {
    //                    alert("서비스 적용이 완료되었습니다");
    //                    window.location.reload();
    //
    //                }
    //            },
    //            error: function (request, status, error) {
    //                alert("오류가 발생하였습니다. 관리자에게 문의하세요");
    //            }
    //        });
    //    }

    function showPlace (placeNo) {
        _openWindowAtCenter('/place/' + placeNo, 1000, 830);
    }

    function applyService (selectedCountryId) {
        if (!confirm("<fmt:message key="recommend.confirmApplyRecommend"/>"))
            return;

        var f = document.recommendForm;
        f.selectedCountryId.value = selectedCountryId;
        f.action = "/appAdmin/updateRecommend";
        f.submit();
    }

    $(document).ready(function () {

        $('a#addBtn').on("click", function () {
            trObj = $(this).closest("tr");
            var popupSearchCountryId = $(this).closest("#searchCountryId").attr('class');
            jobFlag = "add";
            _openWindowAtCenter('/place/placeList?isPopup=true&popupSearchCountryId=' + popupSearchCountryId, 1000, 830);
        });

        $('a#updateBtn').on("click", function () {
            trObj = $(this).closest("tr");
            var popupSearchCountryId = $(this).closest("#searchCountryId").attr('class');
            jobFlag = "update";
            _openWindowAtCenter('/place/placeList?isPopup=true&popupSearchCountryId=' + popupSearchCountryId, 1000, 830);
        });

        $('a#deleteBtn').on("click", function () {
            trObj = $(this).closest("tr");
            jobFlag = "delete";
            setTrObj("", "", "");
        });

    });

    var trObj = null;
    var jobFlag = null;

    function setSelectPlaceNo (placeNo, placeName, listImageUrl, activeYn) {

        if (activeYn == 'N') {
            alert("<fmt:message key="recommend.cantRegisterNotActivePlace"/>");
            return;
        }

        if (checkExist(placeNo)) {
            alert("<fmt:message key="recommend.alreadyExistPlace"/>");
            return;
        }
        setTrObj(placeNo, placeName, listImageUrl);
    }

    function checkExist (placeNo) {
        var existPlaceNo = false;
        $("div #placeNo").each(function (index) {
            if ($(this).text() == placeNo) {
                existPlaceNo = true;
            }
        });
        return existPlaceNo;
    }

    function setTrObj (placeNo, placeName, listImageUrl) {

        if (trObj == null)
            return;

        $(trObj).find("#placeNo").text(placeNo);
        $(trObj).find("#listImageAnchor").attr("href", listImageUrl);
        $(trObj).find("#listImage").attr("src", listImageUrl);
        $(trObj).find("#placeName").attr("onclick", "showPlace(" + placeNo + ")");
        $(trObj).find("#placeName").text(placeName);
        $(trObj).find("#placeNoId").attr("value", placeNo);

        var btnDiv = $(trObj).find("#btnDiv");

        if (jobFlag == 'add') {
            var updateBtnDiv = $('#updateBtnDivClone').clone(true);
            $(btnDiv).replaceWith(updateBtnDiv.attr('id', 'btnDiv').show());
        } else if (jobFlag == 'delete') {
            var addBtnDiv = $('#addBtnDivClone').clone(true);
            $(btnDiv).replaceWith(addBtnDiv.attr('id', 'btnDiv').show());
        }
    }

    function selectCountry (countryId) {
        hideContentsTable();
        var contentsTable = "contentsTable_" + countryId;
        $('#' + contentsTable).show();

        var tab = "tab_" + countryId;
        $('#' + tab).addClass('on');
    }

    function hideContentsTable () {
        <c:forEach items="${serviceCountryList}" var="serviceCountry">
        var contentsTable = "contentsTable_${serviceCountry.countryId}";
        $('#' + contentsTable).hide();

        var tab = "tab_${serviceCountry.countryId}";
        $('#' + tab).removeClass('on');
        </c:forEach>
    }


</script>
</head>

<body>
<div class="td" id="updateBtnDivClone" style="display:none;">
    <a href="javascript:;" id="updateBtn" class="btn_text5">
        <fmt:message key="common.update"/></a>
    <a href="javascript:;" id="deleteBtn" class="btn_text5">
        <fmt:message key="common.delete"/></a>
</div>
<div class="td" id="addBtnDivClone" style="display:none;">
    <a href="javascript:;" id="addBtn" class="btn_text5">
        <fmt:message key="common.register"/></a>
</div>

<form name="recommendForm" action="/appAdmin/usimList" method="GET">
    <input type="hidden" name="selectedCountryId" value=""/>

    <div id="wrap">
        <%@include file="../layout/header.jsp" %>

        <div id="container">
            <%@include file="../layout/leftMenu.jsp" %>

            <div id="content">
                <div class="grid_out">
                    <div class="hd_wrap">
                        <h3><fmt:message key="recommend.recommendPlace"/></h3>
                    </div>
                    <div class="hd_wrap2">
                        <h4 class="hd2"><fmt:message key="recommend.recommendPlace"/></h4>
                    </div>
                    <!-- 02 : 상단 big배너 -->
                    <div class="yellow_box">
                        <p class="yellow_mark"><fmt:message key="recommend.recommendTitleDesc"/></p>
                    </div>

                    <div class="tab_menu">
                        <ul class="tc">
                            <c:forEach items="${serviceCountryList}" var="serviceCountry" varStatus="status">
                                <c:set var="countryId">${serviceCountry.countryId}</c:set>
                                <c:set value="${recommendMap[countryId]}" var="recommendList"/>

                                <li id="tab_${countryId}" ${status.index == 0 ? "class=on" : ""}>
                                    <a href="javascript:onclick=selectCountry('${countryId}')">
                                            ${serviceCountry.countryNamePerLanguage[language]}
                                            ${recommendList != null ? "" : "<font color=red>(*)</font>"}
                                    </a></li>
                            </c:forEach>
                        </ul>
                    </div>

                    <c:forEach items="${serviceCountryList}" var="serviceCountry" varStatus="status">
                        <c:set var="countryId">${serviceCountry.countryId}</c:set>
                        <c:set value="${recommendMap[countryId]}" var="recommendList"/>
                        <div id="contentsTable_${countryId}" style="display:${status.index == 0 ? "block" : "none"}"
                             class="tbl_type tbl_type_v2 mgt10">

                            <span class="${countryId}" id="searchCountryId"/>
                            <table>
                                <caption>Caption</caption>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:80px">
                                    <col style="width:250px;">
                                    <col>
                                    <col style="width:100px">
                                </colgroup>
                                <thead>
                                <tr>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="common.order"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="place.placeNo"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="common.image"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th"><fmt:message key="place.placeName"/></div>
                                    </th>
                                    <th scope="col">
                                        <div class="th">&nbsp;</div>
                                    </th>
                                </tr>
                                </thead>
                                <tbody id="recommendList">
                                <c:forEach begin="0" end="9" varStatus="status">
                                    <c:set value="${fn:length(recommendList) <= 10 ? recommendList[status.index] : null}" var="recommend"/>
                                    <tr id="initOrder_${status.index + 1}">
                                        <td>
                                            <div id="order" class="td">
                                                    ${status.index + 1}
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td" id="placeNo">${recommend.placeNo}</div>
                                        </td>
                                        <td>
                                            <div class="td"><a id="listImageAnchor" href="${recommend.imageUrl}" target="_blank">
                                                <img id="listImage" src="${recommend.imageUrl}" width="116" height="65" alt=""></a>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td tl"><a id="placeName" href="#" onclick="showPlace(${recommend.placeNo})"
                                                                  target="_blank">${recommend.enPlaceName}</a></div>
                                        </td>
                                        <td>
                                            <div class="td" id="btnDiv">
                                                <c:choose>
                                                    <c:when test="${recommend != null}">
                                                        <a href="javascript:;" id="updateBtn" class="btn_text5">
                                                            <fmt:message key="common.update"/></a>
                                                        <a href="javascript:;" id="deleteBtn" class="btn_text5">
                                                            <fmt:message key="common.delete"/></a>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <a href="javascript:;" id="addBtn" class="btn_text5">
                                                            <fmt:message key="common.register"/></a>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </td>
                                        <input type="hidden" value="${recommend.placeNo}" name="placeNo_${countryId}" id="placeNoId">
                                        <input type="hidden" value="${status.index + 1}" id="initOrder">
                                    </tr>
                                </c:forEach>
                                </tbody>
                            </table>

                            <div class="btn_final btn_right">
                                <a href="javascript:applyService('${countryId}');"><em class="noico">
                                        ${serviceCountry.countryNamePerLanguage[language]} <fmt:message key="common.applyService"/>
                                </em></a>
                            </div>
                        </div>
                    </c:forEach>
                </div>

            </div>
            <!-- //content -->
        </div>
    </div>
</form>
<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	