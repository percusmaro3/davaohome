<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<%--<head>--%>
    <%--<title></title>--%>
    <%--<%@include file="../base/includeResources.jsp" %>--%>
    <%--<script type="text/javascript" src="/resources/js/translate.js?201806151120"></script>--%>

    <%--<!-- Magnific Popup core JS file -->--%>
    <%--<link rel="stylesheet" href="/resources/magnific-popup/magnific-popup.css">--%>
    <%--&lt;%&ndash;<link href="/resources/css/loading.css" rel="stylesheet">&ndash;%&gt;--%>

    <%--<script src="/resources/magnific-popup/jquery.magnific-popup.min.js"></script>--%>

    <%--&lt;%&ndash;<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>&ndash;%&gt;--%>

<%--</head>--%>

<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
    <script type="text/javascript" src="/resources/js/translate.js"></script>
</head>


<script>

    function insertPlace () {
        if (!confirm("<fmt:message key="place.confirmRegisterPlace"/>"))
            return;

        setContents();

        dimmed("on");

        var f = document.placeForm;
        f.action = "/place/register";
        f.submit();
    }

    function updatePlace () {
        if (!confirm("<fmt:message key="place.confirmUpdatePlace"/>"))
            return;

        setContents();

        dimmed("on");

        var f = document.placeForm;
        f.action = "/place/update";
        f.submit();
    }

    function setContents () {
        <c:forEach items="${languageList}" var="language">
        oEditors.getById["descriptionHtml_${language}"].exec("UPDATE_CONTENTS_FIELD", []);  // 에디터의 내용이 textarea에 적용됩니다.
        </c:forEach>
    }

    function selectLanguage (language) {
        hideContentsTable();
        var contentsTable = "contentsTable_" + language;
        $('#' + contentsTable).show();

        var tab = "tab_" + language;
        $('#' + tab).addClass('on');

        oEditors.getById["descriptionHtml_"+language].exec("CHANGE_EDITING_MODE", ["WYSIWYG"]);
    }

    function hideContentsTable () {
        <c:forEach items="${languageList}" var="language">
        var contentsTable = "contentsTable_${language}";
        $('#' + contentsTable).hide();

        var tab = "tab_${language}";
        $('#' + tab).removeClass('on');
        </c:forEach>
    }

    function callAjaxArea2Depth (selectedArea1Depth) {
        $.ajax({
            url: '/place/area2Depth?area1Depth=' + selectedArea1Depth,
            dataType: 'json',
            success: function (area2DepthList) {
                $('#area2DepthSelect').empty();
                for (var i = 0; i < area2DepthList.length; i++) {
                    $("#area2DepthSelect").append("<option value='" + area2DepthList[i].areaNo + "'>" + area2DepthList[i].areaName + "</option>");
                }
            }
        })
    }

    function checkSamePlace (language) {

        <c:if test="${jobType == 'INSERT'}">
        var placeNo = $("input[name='placeNo']").val();
        var placeName = $("input[name='placeName_" + language + "']").val();

        $.ajax({
            url: '/place/existSamePlaceName?language=' + language + "&placeName=" + placeName + "&placeNo=" + placeNo,
            dataType: 'json',
            success: function (result) {
                if (result) {
                    $("#samePlaeName_" + language).css("color", "red");
                    $("#samePlaeName_" + language).text("<fmt:message key="place.msgSamePlaceExist"/>");
                    $("input[name='placeName_" + language + "']").focus();
                } else {
                    $("#samePlaeName_" + language).css("color", "");
                    $("#samePlaeName_" + language).text("<fmt:message key="place.msgSamePlaceNotExist"/>");
                }
            }
        })
        </c:if>
    }

    function addPlaceImage () {
        if ($('.placeImageDiv').length >= 5) {
            alert("<fmt:message key="place.alertMaxPlaceImage"/>");
            return;
        }
        var placeImageDiv = $('.placeImageDivClone').clone(true);
        $('#wrap').append(placeImageDiv.attr('class', 'placeImageDiv').show());
    }

    function getOrder (selector, container) {
        var order = [];
        $(selector, container).each(function () {
            order.push(this.id);
        });
        return order;
    }

    $(document).ready(function () {
        // $('#countrySelect').change(function () {
        //     $.ajax({
        //         url: '/place/area1Depth?countryId=' + $("#countrySelect option:selected").val(),
        //         dataType: 'json',
        //         success: function (area1DepthList) {
        //             $('#area1DepthSelect').empty();
        //             for (var i = 0; i < area1DepthList.length; i++) {
        //                 $("#area1DepthSelect").append("<option value='" + area1DepthList[i].areaNo + "'>" + area1DepthList[i].areaName + "</option>");
        //             }
        //             callAjaxArea2Depth($("#area1DepthSelect option:eq(0)").val());
        //         }
        //     })
        // });
        //
        // $('#area1DepthSelect').change(function () {
        //     callAjaxArea2Depth($("#area1DepthSelect option:selected").val());
        // });

        $(".Ubtn").on("click", function () {
            var srcDiv = $(this).parents(".placeImageDiv");
            var tgtDiv = srcDiv.prev();
            if (tgtDiv[0]) {
                tgtDiv.before(srcDiv);
            }
            var order = getOrder(".placeImageDiv", $("#wrap")[0]);
            console.log(order);
        });

        $(".Dbtn").on("click", function () {
            var srcDiv = $(this).parents(".placeImageDiv");
            var tgtDiv = srcDiv.next();
            if (tgtDiv[0]) {
                tgtDiv.after(srcDiv);
            }
            var order = getOrder(".placeImageDiv", $("#wrap")[0]);
            console.log(order);
        });

        $(".DeleteBtn").on("click", function () {
            $(this).parents(".placeImageDiv").remove();
        });
    });


    function selectPartner () {
        _openWindowAtCenter('/partner/partnerList?isPopup=true', 1000, 730);
    }

    function setSelectPartner (partnerNo, partnerName) {
        var f = document.placeForm;
        f.partnerNo.value = partnerNo;
        f.partnerName.value = partnerName;
    }

    function getGeocode () {
        var f = document.placeForm;
        if (f.address.value == '') {
            alert("<fmt:message key="place.alertInputAddress"/>");
            return;
        }
        var address = encodeURI(encodeURIComponent(f.address.value));
        _openWindowAtCenter('/place/geocode?address=' + address, 800, 610);
    }

    function setSelectGeocode (lat, lng) {
        var f = document.placeForm;

        f.latitude.value = lat;
        f.longitude.value = lng;
    }

    function doTranslate (targetLanguage) {

        _doTranslate("INPUT", "input[name=placeName_", targetLanguage);
        _doTranslate("INPUT", "input[name=searchKeyword_", targetLanguage);
        //        _doTranslate("INPUT", "input[name=mainTitle_", targetLanguage);
        _doTranslate("INPUT", "input[name=openTime_", targetLanguage);
        _doTranslate("INPUT", "input[name=priceStr_", targetLanguage);
        _doTranslate("HTMLEDITOR", "descriptionHtml_", targetLanguage);
    }

    function doTranslateWithSrcLanguage (srcLanguage, targetLanguage) {

        _doTranslateWithSrcLanguage("INPUT", "input[name=placeName_", srcLanguage, targetLanguage);
        _doTranslateWithSrcLanguage("INPUT", "input[name=searchKeyword_", srcLanguage, targetLanguage);
        //        _doTranslate("INPUT", "input[name=mainTitle_", targetLanguage);
        _doTranslateWithSrcLanguage("INPUT", "input[name=openTime_", srcLanguage, targetLanguage);
        _doTranslateWithSrcLanguage("INPUT", "input[name=priceStr_", srcLanguage, targetLanguage);
        _doTranslateWithSrcLanguage("HTMLEDITOR", "descriptionHtml_", srcLanguage, targetLanguage);
    }

    var languageArr = new Array();
    <c:forEach items="${languageList}" var="language" varStatus="status">
    languageArr[${status.index}] = "${language}";
    </c:forEach>

    function doAllTranslate () {

        var selectName = "srcLangage";
        var srcLanguage = $("select[name=" + selectName + "]").val();

        for (var i = 0; i < languageArr.length; i++) {
            var lan = languageArr[i];
            if (lan == srcLanguage) {
                continue;
            } else {
                doTranslateWithSrcLanguage(srcLanguage, lan);
            }
        }
    }


    $(document).ready(function () {

        $('.imageLayer').magnificPopup({
            type: 'image',
            closeOnContentClick: true
        });
    });

    function dimmed (flag) {
        if (flag == 'on') {
            $('.dimmed').attr('style', 'display:block');
        } else {
            $('.dimmed').attr('style', 'display:none');
        }
    }


</script>

<%--<style>--%>
    <%--.dimmed {--%>
        <%--display: none;--%>
        <%--position: fixed;--%>
        <%--top: 0;--%>
        <%--left: 0;--%>
        <%--width: 100%;--%>
        <%--height: 100%;--%>
        <%--background-color: #000;--%>
        <%--opacity: 0.60;--%>
        <%--z-index: 200;--%>
        <%--filter: alpha(opacity=60);--%>
        <%---ms-filter: 'progid:DXImageTransform.Microsoft.Alpha(Opacity=60)'--%>
    <%--}--%>
<%--</style>--%>

<body>
<%--<div class="dimmed" style="display:none;"></div>--%>


<%--<div class="placeImageDivClone" style="display:none;">--%>
    <%--<input type="file" accept="image/*" name="placeImage" style="width:200px" value="">--%>
    <%--&nbsp;&nbsp;&nbsp;--%>
    <%--<span class="UDbtn">--%>
        <%--<b class="DeleteBtn"> X </b>&nbsp;--%>
        <%--<b class="Ubtn"> ▲ </b>&nbsp;--%>
        <%--<b class="Dbtn"> ▼ </b>&nbsp;--%>
    <%--</span>--%>

    <%--<input type=hidden name="beforePlaceImage" value=""/>--%>
<%--</div>--%>


<form name="placeForm" action="/place/register" enctype="multipart/form-data" method="POST">
    <input type="hidden" name="placeNo" value="${place.placeNo}"/>

    <div>
        <div id="pop_wrap">
            <div id="pop_content">
                <%--<%@include file="../place/placeTab.jsp" %>--%>

                <%--<c:if test="${errorMsg != ''}">--%>
                    <%--<span style="color:red;float:left;font-weight: bold">${errorMsg}</span><br/>--%>
                <%--</c:if>--%>
                <div class="tbl_type2">
                    <%--<form:form commandName="place">--%>
                        <%--<table>--%>
                            <%--<colgroup>--%>
                                <%--<col style="width:130px">--%>
                                <%--<col>--%>
                                <%--<col style="width:130px">--%>
                                <%--<col>--%>
                            <%--</colgroup>--%>
                            <%--<tbody>--%>
                            <%--<c:choose>--%>
                                <%--<c:when test="${jobType != 'INSERT'}">--%>
                                    <%--<tr>--%>
                                        <%--<th>--%>
                                            <%--<div class="th"><fmt:message key="place.placeNo"/></div>--%>
                                        <%--</th>--%>
                                        <%--<td colspan="3">--%>
                                            <%--<div class="td">${place.placeNo}</div>--%>
                                        <%--</td>--%>
                                    <%--</tr>--%>
                                <%--</c:when>--%>
                                <%--<c:otherwise>--%>
                                <%--</c:otherwise>--%>
                            <%--</c:choose>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="common.country"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<select name="countryId" id="countrySelect" style="width:80px;" class="gray01">--%>
                                            <%--<c:forEach var="country" items="${countryList}">--%>
                                                <%--<option value="${country.countryId}" ${place.countryId == country.countryId ? "selected" : ""}--%>
                                                <%-->${country.countryNamePerLanguage['en']}</option>--%>
                                            <%--</c:forEach>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="common.activeYn"/></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<select name="activeYn" onchange="" style="width:100px;" class="gray01">--%>
                                            <%--<option value=Y ${place.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>--%>
                                            <%--<option value=W ${place.activeYn == 'W' ? "selected" : ""} ><fmt:message key="common.wait"/></option>--%>
                                            <%--<option value=N ${place.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.telNumber"/></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:300px" name="telNumber" value="${place.telNumber}"/>--%>

                                        <%--<div class="yellow_box">--%>
                                            <%--<p class="yellow_mark"><fmt:message key="place.telNumberDesc1"/></p>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.homepage"/></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:250px" name="homepage" value="${place.homepage}" class="ipt_txt">--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.contactName"/></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:110px" name="contactName" value="${place.contactName}"--%>
                                               <%--class="ipt_txt">--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.contactTel"/></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:250px" name="contactTel" value="${place.contactTel}" class="ipt_txt">--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.address"/></div>--%>
                                <%--</th>--%>
                                <%--<td colspan="3">--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:400px" name="address" value="${place.address}" class="ipt_txt">--%>
                                        <%--<a href="javascript:getGeocode();" class="btn_text5"><em class="add f_bold"><fmt:message--%>
                                                <%--key="place.getGeocode"/></em></a>--%>

                                        <%--<div class="yellow_box">--%>
                                            <%--<p class="yellow_mark"><fmt:message key="place.geocodeDesc1"/></p>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.latitude"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:150px" name="latitude" value="${place.latitude}" class="ipt_txt">--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.longitude"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="text" title="" style="width:150px" name="longitude" value="${place.longitude}"--%>
                                               <%--class="ipt_txt">--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="voucher.barcodeType"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<select name="barcodeType" onchange="" style="width:200px;" class="gray01">--%>
                                            <%--<c:forEach items="${barcodeTypeList}" var="barcodeType">--%>
                                                <%--<option value="${barcodeType}" ${voucher.barcodeType == barcodeType ? "selected" : ""}--%>
                                                <%-->${barcodeType}--%>
                                                <%--</option>--%>
                                            <%--</c:forEach>--%>
                                        <%--</select>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.listImageUrl"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em>--%>
                                    <%--</div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="file" accept="image/*" name="listImageUrlFile" style="width:150px" value="">--%>
                                        <%--<c:if test="${jobType != 'INSERT' && place.listImageUrl != null}">--%>
                                            <%--<input type=hidden name="beforeListImageUrl" value="${place.listImageUrl}"/>--%>
                                            <%--<a class="imageLayer" href="${place.listImageUrl}" target="_blank">--%>
                                                <%--<img width="" height="50px" src="${place.listImageUrl}"/>--%>
                                            <%--</a>--%>
                                        <%--</c:if>--%>
                                        <%--<div class="yellow_box">--%>
                                            <%--<p class="yellow_mark"><fmt:message key="place.listImageSizeDesc"/></p>--%>

                                            <%--<p><fmt:message key="place.middleImageByteSizeDesc"/></p>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.smallImageUrl"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em>--%>
                                    <%--</div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                    <%--<div class="td">--%>
                                        <%--<input type="file" accept="image/*" name="smallImageUrlFile" style="width:150px" value="">--%>
                                        <%--<c:if test="${jobType != 'INSERT' && place.smallImageUrl != null}">--%>
                                            <%--<input type=hidden name="beforeSmallImageUrl"--%>
                                                   <%--value="${place.smallImageUrl}"/>--%>
                                            <%--<a class="imageLayer" href="${place.smallImageUrl}" target="_blank">--%>
                                                <%--<img width="" height="50px" src="${place.smallImageUrl}"/>--%>
                                            <%--</a>--%>
                                        <%--</c:if>--%>

                                        <%--<div class="yellow_box">--%>
                                            <%--<p class="yellow_mark"><fmt:message key="place.smallImageSizeDesc"/></p>--%>

                                            <%--<p><fmt:message key="place.middleImageByteSizeDesc"/></p>--%>

                                        <%--</div>--%>
                                    <%--</div>--%>
                                <%--</td>--%>
                            <%--</tr>--%>
                            <%--<tr>--%>
                                <%--<th>--%>
                                    <%--<div class="th"><fmt:message key="place.placeImage"/><em class="must2">*<span--%>
                                            <%--class="blind">필수</span></em></div>--%>
                                <%--</th>--%>
                                <%--<td colspan="3">--%>
                                    <%--<div class="td" id="wrap">--%>
                                        <%--<c:forEach var="placeImage" items="${place.placeImageList}">--%>
                                            <%--<div class="placeImageDiv">--%>
                                                <%--<input type="file" accept="image/*" name="placeImage" style="width:200px" value="">--%>
                                                <%--&nbsp;&nbsp;&nbsp;--%>
                                                <%--<span class="UDbtn">--%>
                                                <%--<b class="DeleteBtn" style="cursor:pointer"> X </b>&nbsp;--%>
                                                <%--<b class="Ubtn" style="cursor:pointer"> ▲ </b>&nbsp;--%>
                                                <%--<b class="Dbtn" style="cursor:pointer"> ▼ </b>&nbsp;--%>
                                            <%--</span>--%>

                                                <%--<a class="imageLayer" href="${placeImage.imageUrl}" target="_blank">--%>
                                                    <%--<img width="" height="50px" src="${placeImage.imageUrl}"/>--%>
                                                <%--</a>--%>
                                                <%--<input type=hidden name="beforePlaceImage" value="${placeImage.imageUrl}"/>--%>
                                            <%--</div>--%>
                                        <%--</c:forEach>--%>
                                    <%--</div>--%>
                                    <%--<div class="td">--%>
                                        <%--<a href="javascript:addPlaceImage();" class="btn_text5"><em class="add f_bold"><fmt:message--%>
                                                <%--key="common.addImage"/></em></a>--%>
                                    <%--</div>--%>
                                    <%--<div class="td">--%>
                                        <%--<div class="yellow_box">--%>
                                            <%--<p class="yellow_mark"><fmt:message key="place.detailImageSizeDesc"/></p>--%>

                                            <%--<p><fmt:message key="place.middleImageByteSizeDesc"/></p>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>

                                <%--</td>--%>
                            <%--</tr>--%>
                                <%--&lt;%&ndash;<tr>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<th>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="th"><fmt:message key="place.category"/><em class="must2">*<span&ndash;%&gt;--%>
                                <%--&lt;%&ndash;class="blind">필수</span></em></div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</th>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<td>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<div class="td">&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input type="checkbox" name="category" value="SIGHTSEEING" ${SIGHTSEEING ? "checked" : ""}&ndash;%&gt;--%>
                                <%--&lt;%&ndash;class="ipt_check"&ndash;%&gt;--%>
                                <%--&lt;%&ndash;title=""><fmt:message&ndash;%&gt;--%>
                                <%--&lt;%&ndash;key="category.sightseeing"/>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input type="checkbox" name="category" value="RESTAURANT" ${RESTAURANT ? "checked" : ""} class="ipt_check"&ndash;%&gt;--%>
                                <%--&lt;%&ndash;title=""><fmt:message&ndash;%&gt;--%>
                                <%--&lt;%&ndash;key="category.restaurant"/>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;<input type="checkbox" name="category" value="HOTEL" ${HOTEL ? "checked" : ""} class="ipt_check"&ndash;%&gt;--%>
                                <%--&lt;%&ndash;title=""><fmt:message&ndash;%&gt;--%>
                                <%--&lt;%&ndash;key="category.hotel"/>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</div>&ndash;%&gt;--%>
                                <%--&lt;%&ndash;</td>&ndash;%&gt;--%>
                            <%--</tr>--%>
                            <%--</tbody>--%>
                        <%--</table>--%>
                    <%--</form:form>--%>
                    <%--<br/>--%>


                    <table>
                        <colgroup>
                            <col style="width:250px">
                            <col>
                        </colgroup>
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="common.allAutoTranslate"/><em class="must2">*<span class="blind">필수</span></em>
                                </div>
                            </th>
                            <td>
                                <div class="td">
                                    <fmt:message key="common.selectTranslateSrcLanguage"/> &nbsp;&nbsp;
                                    <select name="srcLangage" style="width:70px">
                                        <c:forEach items="${languageList}" var="srcLanguage" varStatus="status">
                                            <option value="${srcLanguage}">${srcLanguage}</option>
                                        </c:forEach>
                                    </select>

                                    <a href="#" onclick="javascript:doAllTranslate()" class="btn_text">
                                        <em class="f_bold"><fmt:message key="common.allTranslate"/></em></a> &nbsp;
                                </div>
                            </td>
                        </tr>
                    </table>

                    <div class="tab_menu">
                        <ul class="tc">
                            <c:forEach items="${languageList}" var="language" varStatus="status">
                                <c:set var="languageStr">${language}</c:set>
                                <c:set value="${place.contentsMap[languageStr]}" var="contents"/>

                                <li id="tab_${language}" ${status.index == 0 ? "class=on" : ""}>
                                    <a href="javascript:onclick=selectLanguage('${language}')">
                                        <fmt:message key="${language.languageDisplayName}"/>
                                            ${contents != null ? "" : "<font color=red>(*)</font>"}
                                    </a></li>
                            </c:forEach>
                        </ul>
                    </div>
                    <c:forEach items="${languageList}" var="language" varStatus="status">
                        <c:set var="languageStr">${language}</c:set>
                        <c:set value="${place.contentsMap[languageStr]}" var="contents"/>

                        <div id="contentsTable_${language}" style="display:${status.index == 0 ? "block" : "none"}">
                            <table>
                                <colgroup>
                                    <col style="width:130px">
                                    <col>
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="common.autoTranslate"/><em class="must2">*<span class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <fmt:message key="common.selectTranslateSrcLanguage"/> &nbsp;&nbsp;
                                            <select name="srcLangage_${language}" style="width:70px">
                                                <c:forEach items="${languageList}" var="srcLanguage" varStatus="status">
                                                    <c:if test="${srcLanguage != language}">
                                                        <option value="${srcLanguage}">${srcLanguage}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>

                                            <a href="#" onclick="javascript:doTranslate('${language}')" class="btn_text">
                                                <em class="f_bold"><fmt:message key="common.translate"/></em></a> &nbsp;
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="place.placeName"/><em class="must2">*<span class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="placeName_${language}" onfocusout="checkSamePlace('${language}')"
                                                   style="width:350px"
                                                   value="${contents != null ? contents.placeName : ""}">
                                            <span id="samePlaeName_${language}"></span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="place.placeContent"/><em class="must2">*<span
                                                class="blind">필수</span></em>
                                        </div>
                                    </th>
                                    <td>
                                        <div class="td">
                                    <textarea cols="50" id="descriptionHtml_${language}" name="descriptionHtml_${language}" rows="15" class="ipt_txt"
                                              style="width:100%;height:400px;">${contents != null ? contents.descriptionHtml : ""}</textarea>
                                        </div>

                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </c:forEach>
                    <br/>
                    <table>
                        <colgroup>
                            <col style="width:130px">
                            <col>
                        </colgroup>
                        <tbody>
                        <c:if test="${jobType != 'INSERT'}">
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="common.registerDate"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                            ${cnv:datetime(place.registerDate,countryId)}
                                    </div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="common.lastUpdateDate"/></div>
                                </th>
                                <td>
                                    <div class="td">${cnv:datetime(place.updateDate,countryId)}</div>
                                </td>
                                <th>
                                    <div class="th"><fmt:message key="common.lastUpdater"/></div>
                                </th>
                                <td>
                                    <div class="td">${place.lastUpdater}</div>
                                </td>
                            </tr>
                        </c:if>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="btn_wrap btn_final">
                <c:choose>
                    <c:when test="${jobType == 'INSERT'}">
                        <a href="#" onclick="javascript:insertPlace()"><em class="noico"><fmt:message key="common.register"/></em></a>
                    </c:when>
                    <c:when test="${jobType == 'UPDATE'}">
                        <a href="#" onclick="javascript:updatePlace()"><em class="noico"><fmt:message key="common.update"/></em></a>
                    </c:when>
                </c:choose>
                <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.cancel"/></em></a>
                <a href="#" class="gray" onclick="javascript:resetIframe()"><em class="noico">TEST</em></a>
            </div>
            <br/><br/>

            <%--</div>--%>
        </div>
    </div>
    <br/>
    <br/>
</form>

<script type="text/javascript" src="/resources/smartEdit/js/HuskyEZCreator.js?116" charset="utf-8"></script>

<script>
    var oEditors = [];

    $(function () {
        <c:forEach items="${languageList}" var="language">

        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: document.getElementById('descriptionHtml_${language}'),
            sSkinURI: "/resources/smartEdit/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        </c:forEach>
    })


    function resetIframe(){
        var styleStr = "width: 100%; height: 449px;"
        <c:forEach items="${languageList}" var="language">
        if( "${language}" != "en" ){
            var iframe${language} = document.getElementById("frm_descriptionHtml_${language}");
            iframe${language}.setAttribute("style",styleStr);
        }
        </c:forEach>
    }


</script>

</body>


</html>