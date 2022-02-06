<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>
    <%@include file="../base/includeResources.jsp" %>
    <script type="text/javascript" src="/resources/js/translate.js"></script>
</head>


<script>

    $(function () {
        $("#useDatePicker").datepicker({
                    dateFormat: "${countryHtmlDateFormat}"
                },
                $.datepicker.regional['en-AU']);
    });

    function insertVoucherOption () {
        if (!confirm("<fmt:message key="voucher.confirmRegisterOption"/>"))
            return;

        var f = document.voucherOptionForm;
        f.action = "/voucher/option/register";
        f.submit();
    }

    function updateVoucherOption () {
        if (!confirm("<fmt:message key="voucher.confirmUpdateOption"/>"))
            return;

        var f = document.voucherOptionForm;
        f.action = "/voucher/option/update";
        f.submit();
    }

    function selectLanguage (language) {
        hideContentsTable();
        var contentsTable = "contentsTable_" + language;
        $('#' + contentsTable).show();

        var tab = "tab_" + language;
        $('#' + tab).addClass('on');
    }

    function hideContentsTable () {
        <c:forEach items="${languageList}" var="language">
        var contentsTable = "contentsTable_${language}";
        $('#' + contentsTable).hide();

        var tab = "tab_${language}";
        $('#' + tab).removeClass('on');
        </c:forEach>
    }

    function checkOptionStockUnlimited (stockCheck, stockInput) {
        if (stockCheck.checked) {
            stockInput.value = "";
            stockInput.disabled = true;
        } else {
            stockInput.disabled = false;
        }
    }

    var calendarIndex = 0;
    function addUseDate () {

        var useDateDiv = $('.useDateDivClone').clone(true);

        $(useDateDiv).find("input[name=useDateStr]").attr('id', 'useDateId' + calendarIndex++);
        $('#wrap').append(useDateDiv.attr('class', 'useDateDiv').show());
        $(document).find("input[name=useDateStr]").removeClass('hasDatepicker').datepicker({
            dateFormat: "${countryHtmlDateFormat}",
            defaultDate: "+1w"
        });

        return useDateDiv;
    }

    function setUseDateValue (useDateDiv, dateStr, stock) {
        $(useDateDiv).find("input[name=useDateStr]").attr('value', dateStr);
        $(useDateDiv).find("input[name=useDateStock]").attr('value', stock);
    }

    $(document).ready(function () {

        $(".DeleteBtn").on("click", function () {
            $(this).parents(".useDateDiv").remove();
        });
    });

    function setDateOption () {
        var f = document.voucherOptionForm;
        if (f.useDate.value == 'Y') {
            $('#notDateOption').hide();
            $('#dateOption').show();
        } else {
            $('#notDateOption').show();
            $('#dateOption').hide();
        }
    }

    function setUseDate () {
        <c:forEach var="voucherUseDate" items="${voucherUseDateList}">
        var useDateDiv = addUseDate();
        setUseDateValue(useDateDiv, "${cnv:dateByDate(voucherUseDate.useDate,countryId)}", "${voucherUseDate.stock}");
        </c:forEach>
    }

    function initForm () {
        setDateOption();
        setUseDate();
    }

    function doTranslate (targetLanguage) {
        if (!confirm("<fmt:message key="common.confirmTranslate"/>")) {
            return;
        }
        _doTranslate("INPUT", "input[name=name_", targetLanguage);
    }

</script>

<body onload="initForm()">


<div class="useDateDivClone" style="display:none;">
        <span class="inp_day">
            <input name="useDateStr" style="width:80px" class="ipt_txt date" type="text" value=""/> &nbsp;
        </span>
        <span class="UDbtn">
            <fmt:message key="voucher.stockCount"/>
            <input type="text" name="useDateStock" style="width:100px" value="">
            <b class="DeleteBtn" style="cursor:pointer"> X </b>&nbsp;
        </span>
</div>


<form name="voucherOptionForm" action="/voucher/option/register" method="POST">
    <input type="hidden" name="voucherNo" value="${voucherNo}"/>
    <input type="hidden" name="optionNo" value="${voucherOption.optionNo}"/>

    <div id="pop_wrap" style="width:1100px">
        <div id="pop_header">
            <h1><fmt:message key="voucher.VoucherOptionManage"/></h1>
        </div>

        <div id="pop_content">
            <c:if test="${errorMsg != ''}">
                <p style="color:red;float:left;font-weight: bold">${errorMsg}</p><br/>
            </c:if>
            <div class="yellow_box">
                <p class="yellow_mark"><fmt:message key="voucher.optionPriceDesc"/></p>

                <p><fmt:message key="voucher.stockDesc"/></p>
            </div>
            <br/>

            <div class="tbl_type2">


                <h4 class="hd2"><fmt:message key="voucher.optionName"/></h4>

                <div class="tab_menu">
                    <ul class="tc">
                        <c:forEach items="${languageList}" var="language" varStatus="status">
                            <c:set var="languageStr">${language}</c:set>
                            <c:set value="${voucherOption.contentsMap[languageStr]}" var="contents"/>

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
                    <c:set value="${voucherOption.contentsMap[languageStr]}" var="contents"/>

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
                                <td colspan="3">
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
                                    <div class="th">${languageStr} <fmt:message key="voucher.optionName"/></div>
                                </th>
                                <td colspan="3">
                                    <div class="td">
                                        <div class="td"><input type="text" name="name_${language}" style="width:350px"
                                                               value="${contents.name}"></div>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </c:forEach>
                <br/>

                <h4 class="hd2"><fmt:message key="voucher.optionInfo"/></h4>
                <table>
                    <colgroup>
                        <col style="width:130px">
                        <col style="width:200px">
                        <col style="width:130px">
                        <col>
                    </colgroup>
                    <c:if test="${jobType != 'INSERT'}">
                        <tr>
                            <th>
                                <div class="th"><fmt:message key="voucher.optionNo"/></div>
                            </th>
                            <td colspan="3">
                                <div class="td">${voucherOption.optionNo}</div>
                            </td>
                        </tr>
                    </c:if>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="voucher.optionCostPrice"/><em class="must2">*<span
                                    class="blind">필수</span></em></div>
                        </th>
                        <td>
                            <div class="td">${activeCountry.currency} <input type="text" name="costPrice" style="width:100px"
                                                                             value="${voucherOption.costPrice}">
                            </div>
                        </td>
                        <th>
                            <div class="th"><fmt:message key="voucher.optionOriginalPrice"/><em class="must2">*<span
                                    class="blind">필수</span></em></div>
                        </th>
                        <td>
                            <div class="td">${activeCountry.currency} <input type="text" name="originalPrice" style="width:100px"
                                                                             value="${voucherOption.originalPrice}">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="voucher.optionPrice"/><em class="must2">*<span
                                    class="blind">필수</span></em></div>
                        </th>
                        <td>
                            <div class="td">${activeCountry.currency} <input type="text" name="price" style="width:100px"
                                                                             value="${voucherOption.price}">
                            </div>
                        </td>
                        <th>
                            <div class="th"><fmt:message key="common.activeYn"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <select name="activeYn" onchange="" style="width:145px;" class="gray01">
                                    <option value=Y ${voucherOption.activeYn == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                    <option value=N ${voucherOption.activeYn == 'N' ? "selected" : ""} ><fmt:message key="common.no"/></option>
                                </select>
                            </div>
                        </td>
                    </tr>
                </table>
                <br/>
                <h4 class="hd2"><fmt:message key="voucher.stockInfo"/></h4>
                <table border="10">
                    <colgroup>
                        <col style="width:130px">
                        <col>
                    </colgroup>
                    <tr>
                        <th>
                            <div class="th"><fmt:message key="voucher.useDate"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <select name="useDate" onchange="setDateOption()" style="width:145px;" class="gray01">
                                    <option value=Y ${voucherOption.useDate == 'Y' ? "selected" : ""} ><fmt:message key="common.yes"/></option>
                                    <option value=N ${voucherOption.useDate == 'N' || voucherOption.useDate == null ? "selected" : ""} ><fmt:message
                                            key="common.no"/></option>
                                </select>
                            </div>
                        </td>
                    </tr>
                    <tr id="notDateOption">
                        <th>
                            <div class="th"><fmt:message key="voucher.stock"/></div>
                        </th>
                        <td>
                            <div class="td">
                                <input type="text" name="stock" style="width:100px" value="${voucherOption.stock}"/>
                            </div>
                        </td>
                    </tr>
                    <tr id="dateOption">
                        <th>
                            <div class="th"><fmt:message key="voucher.optionUseDate"/></div>
                        </th>
                        <td>
                            <div class="td" id="wrap">

                            </div>
                            <div class="td">
                                <a href="javascript:addUseDate();" class="btn_text5"><em class="add f_bold">
                                    <fmt:message key="voucher.addOptionUseDate"/></em></a>
                            </div>
                        </td>
                    </tr>
                </table>
                <br/>
            </div>


        </div>
        <div class="btn_wrap btn_final">
            <c:choose>
                <c:when test="${jobType == 'INSERT'}">
                    <a href="#" onclick="javascript:insertVoucherOption()"><em class="noico"><fmt:message key="common.register"/></em></a>
                </c:when>
                <c:when test="${jobType == 'UPDATE'}">
                    <a href="#" onclick="javascript:updateVoucherOption()"><em class="noico"><fmt:message key="common.update"/></em></a>
                </c:when>
            </c:choose>
            <a href="#" class="gray" onclick="javascript:window.close()"><em class="noico"><fmt:message key="common.close"/></em></a>
        </div>
    </div>
    <br/>
</form>

</body>

</html>