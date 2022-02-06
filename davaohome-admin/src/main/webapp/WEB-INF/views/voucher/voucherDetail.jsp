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
        $("#expireDatePicker").datepicker({
                    dateFormat: "${countryHtmlDateFormat}"
                },
                $.datepicker.regional['en-AU']);
    });

    function insertVoucher () {
        if (!confirm("<fmt:message key="voucher.confirmRegisterVoucher"/>"))
            return;

        setContents();

        var f = document.voucherDetailForm;
        f.action = "/voucher/register";
        f.submit();
    }

    function updateVoucher () {
        if (!confirm("<fmt:message key="voucher.confirmUpdateVoucher"/>"))
            return;

        setContents();

        var f = document.voucherDetailForm;
        f.action = "/voucher/update";
        f.submit();
    }

    function setContents () {
        <c:forEach items="${languageList}" var="language">
        oEditors.getById["description_${language}"].exec("UPDATE_CONTENTS_FIELD", []);  // 에디터의 내용이 textarea에 적용됩니다.
        </c:forEach>
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

    function showVoucherOption (voucheNo, optionNo) {
        _openWindowAtCenter('/voucher/option/' + voucheNo + "/" + optionNo, 1100, 770);
    }

    function showNewVoucherOption (voucherNo) {
        _openWindowAtCenter('/voucher/newVoucherOption/' + voucherNo, 1100, 770);
    }

    function doTranslate (targetLanguage) {
        if (!confirm("<fmt:message key="common.confirmTranslate"/>")) {
            return;
        }
        _doTranslate("INPUT", "input[name=title_", targetLanguage);
        _doTranslate("INPUT", "input[name=subtitle_", targetLanguage);
        _doTranslate("HTMLEDITOR", "description_", targetLanguage);
        _doTranslate("TEXTAREA", "textarea[name=caution_", targetLanguage);
    }

</script>


<body>


<form name="voucherDetailForm" action="/voucher/register" method="POST">
    <input type="hidden" name="placeNo" value="${placeNo}"/>

    <%--<div id="pop_wrap" style="width:1200px">--%>
    <div id="top_short_content">
        <div class="tbl_type2">
            <div class="section_wrap">
                <div class="section65">
                    <h4 class="hd2"><fmt:message key="voucher.voucherInfo"/></h4>

                    <div class="tbl_type tbl_type_v2 ">

                        <c:if test="${errorMsg != ''}">
                            <span style="color:red;float:left;font-weight: bold">${errorMsg}</span><br/>
                        </c:if>
                        <table>
                            <colgroup>
                                <col style="width:130px">
                                <col>
                            </colgroup>
                            <tbody>

                            <c:if test="${voucher.voucherNo != null}">
                                <tr>
                                    <th>
                                        <div class="th"><fmt:message key="voucher.voucherNo"/></div>
                                    </th>
                                    <td>
                                        <div class="td">${voucher.voucherNo}
                                            <input type="hidden" name="voucherNo" value="${voucher.voucherNo}"/>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="voucher.reserveIssueType"/><em class="must2">*<span
                                            class="blind">필수</span></em></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="reserveIssueType" onchange="" style="width:200px;" class="gray01">
                                            <option value="DIRECT" ${voucher.reserveIssueType == 'DIRECT' ? "selected" : ""} ><fmt:message
                                                    key="voucher.reserveIssueTypeDirect"/></option>
                                            <option value="CONFIRM" ${voucher.reserveIssueType == 'CONFIRM' ? "selected" : ""} ><fmt:message
                                                    key="voucher.reserveIssueTypeConfirm"/></option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="coupon.expireDate"/></div>
                                </th>
                                <td>
                                    <div class="td">
                                <span class="inp_day">
					                <input id=expireDatePicker name="expireDateStr" style="width:80px" class="ipt_txt date" type="text"
                                           value="${cnv:date(voucher.expireDate,countryId)}"/>
				                </span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>
                                    <div class="th"><fmt:message key="common.activeYn"/><em class="must2">*<span
                                            class="blind">필수</span></em></div>
                                </th>
                                <td>
                                    <div class="td">
                                        <select name="activeYn" onchange="" style="width:145px;" class="gray01">
                                            <option value=Y ${voucher.activeYn == 'Y' ? "selected" : ""} ><fmt:message
                                                    key="common.yes"/></option>
                                            <option value=N ${voucher.activeYn == 'N' ? "selected" : ""} ><fmt:message
                                                    key="common.no"/></option>
                                        </select>
                                    </div>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br/>

                        <div class="tab_menu">
                            <ul class="tc">
                                <c:forEach items="${languageList}" var="language" varStatus="status">
                                    <c:set var="languageStr">${language}</c:set>
                                    <c:set value="${voucher.contentsMap[languageStr]}" var="contents"/>

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
                            <c:set value="${voucher.contentsMap[languageStr]}" var="contents"/>

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
                                            <div class="th"><fmt:message key="voucher.title"/><em class="must2">*<span
                                                    class="blind">필수</span></em>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <input type="text" name="title_${language}" style="width:350px"
                                                       value="${contents != null ? contents.title : ""}">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="th"><fmt:message key="voucher.subtitle"/>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                                <input type="text" name="subtitle_${language}" style="width:350px"
                                                       value="${contents != null ? contents.subtitle : ""}">
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="th"><fmt:message key="voucher.description"/><em class="must2">*<span
                                                    class="blind">필수</span></em>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                    <textarea cols="50" id="description_${language}" name="contents_${language}" class="ipt_txt"
                                              style="width:70%;height:200px;">${contents != null ? contents.description : ""}</textarea>
                                            </div>

                                        </td>
                                    </tr>
                                    <tr>
                                        <th>
                                            <div class="th"><fmt:message key="voucher.caution"/><em class="must2">*<span
                                                    class="blind">필수</span></em>
                                            </div>
                                        </th>
                                        <td>
                                            <div class="td">
                                    <textarea cols="30" name="caution_${language}" class="ipt_txt"
                                              style="width:70%;height:200px;">${contents != null ? contents.caution : ""}</textarea>
                                            </div>

                                        </td>
                                    </tr>
                                    </tbody>
                                </table>
                            </div>
                        </c:forEach>
                        <br/>
                    </div>
                </div>

                <div class="section">
                    <h4 class="hd2"><fmt:message key="voucher.voucherOptionList"/></h4>
                    <c:choose>
                        <c:when test="${jobType != 'INSERT'}">
                            <div class="tbl_type tbl_type_v2 ">
                                <table>
                                    <colgroup>
                                        <col style="width: 60px">
                                        <col>
                                        <col style="width: 70px">
                                        <col style="width: 60px">
                                    </colgroup>
                                    <thead>
                                    <tr>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="voucher.optionNo"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="voucher.optionName"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.price"/></div>
                                        </th>
                                        <th scope="col">
                                            <div class="th"><fmt:message key="common.update"/></div>
                                        </th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:if test="${fn:length(voucherOptionList) == 0}">
                                        <tr>
                                            <td colspan="4" class="">
                                                <div class="td"><fmt:message key="voucher.noOptionResultOfSearch"/></div>
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:forEach var="voucherOption" items="${voucherOptionList}">
                                    <tr>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer"
                                                   onclick="showVoucherOption(${voucherOption.voucherNo}, ${voucherOption.optionNo})">
                                                        ${voucherOption.optionNo}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">
                                                <u style="cursor:pointer"
                                                   onclick="showVoucherOption(${voucherOption.voucherNo}, ${voucherOption.optionNo})">${voucherOption.name}</u>
                                            </div>
                                        </td>
                                        <td>
                                            <div class="td">
                                                    ${voucherOption.price}
                                            </div>
                                        </td>
                                        <th scope="col">
                                            <div class="th">
                                                <div class="td">
                                                    <a href="#" onclick="javascript:showVoucherOption(${voucherOption.voucherNo},
                                                        ${voucherOption.optionNo})" class="btn_text">
                                                        <fmt:message key="common.manage"/></a>
                                                </div>
                                            </div>
                                        </th>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                            <div class="hd_wrap2">
                                <div class="fr">
                                    <a href="#" onclick="javascript:showNewVoucherOption('${voucher.voucherNo}')" class="btn_text"><em
                                            class="f_bold"><fmt:message
                                            key="voucher.registerVoucherOption"/></em></a> &nbsp;
                                </div>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="yellow_box">
                                <p class="yellow_mark"><fmt:message key="voucher.canAddOptionAfterAddVoucher"/></p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <!-- section wrap -->


        </div>
        <div class="btn_wrap btn_final">
            <c:choose>
                <c:when test="${jobType == 'INSERT'}">
                    <a href="#" onclick="javascript:insertVoucher()"><em class="noico"><fmt:message key="common.register"/></em></a>
                </c:when>
                <c:when test="${jobType == 'UPDATE'}">
                    <a href="#" onclick="javascript:updateVoucher()"><em class="noico"><fmt:message key="common.update"/></em></a>
                </c:when>
            </c:choose>
        </div>
    </div>
    <%--</div>--%>
</form>

<script type="text/javascript" src="/resources/smartEdit/js/HuskyEZCreator.js" charset="utf-8"></script>

<script>
    var oEditors = [];

    $(function () {
        <c:forEach items="${languageList}" var="language">
        nhn.husky.EZCreator.createInIFrame({
            oAppRef: oEditors,
            elPlaceHolder: document.getElementById('description_${language}'),
            sSkinURI: "/resources/smartEdit/SmartEditor2Skin.html",
            fCreator: "createSEditor2"
        });
        </c:forEach>
    })


</script>

</body>

</html>