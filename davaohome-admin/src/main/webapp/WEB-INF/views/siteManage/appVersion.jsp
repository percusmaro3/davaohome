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

    function applyAppVersion () {

        if (!confirm("앱 버전을 적용 하시겠습니까?")) {
            return;
        }

        var f = document.appVersionForm;
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
                    <h3>App 버전 관리</h3>
                </div>
                <br/>

                <form name="appVersionForm" action="/siteManage/appVersion">
                    <input type="hidden" name="status" value=""/>

                    <div class="section">
                        <h4 class="hd2">iOS 현재 버전 상태</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">iOS App Version<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            ${iosAppVersion.currentVersion}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th">강제 업데이트 여부<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            ${iosAppVersion.forceUpdate}
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/><br/>

                    <div class="section">
                        <h4 class="hd2">Android 버전 상태</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">Android App Version<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            ${androidAppVersion.currentVersion}
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th">강제 업데이트 여부<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            ${androidAppVersion.forceUpdate}
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/><br/>

                    <div class="section">
                        <h4 class="hd2">App Version 추가</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">Device <em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="device" style="width:150px">
                                                <option value="IOS">iOS</option>
                                                <option value="ANDROID">Android</option>
                                            </select>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th">App Version(X.X) <em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="currentVersion" value=""/>

                                            <a href="#" onclick="javascript:applyAppVersion()"
                                               class="btn_text"><em class="noico"><fmt:message key="site.applyAppVersion"/></em></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th">강제 업데이트 여부<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <select name="forceUpdate" style="width:150px">
                                                <option value="N">일반 업데이트</option>
                                                <option value="Y">강제 업데이트</option>
                                            </select>
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
	