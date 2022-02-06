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

    function getCache () {

        var f = document.cacheForm;
        f.action = "/developer/getCache";
        f.submit();
    }

    function setMCache () {

        var f = document.cacheForm;
        f.action = "/developer/makeMCache";
        f.submit();
    }

    function deleteCache () {

        if (!confirm("Cache를 정말로 삭제 하시겠습니까")) {
            return;
        }

        var f = document.cacheForm;
        f.action = "/developer/deleteCache";
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
                    <h3>Cache 관리</h3>
                </div>
                <br/>

                <form name="cacheForm" action="/developer/getCache">
                    <input type="hidden" name="status" value=""/>

                    <div class="section">
                        <h4 class="hd2">Cache 정보 얻기</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">Cache Key<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="cacheKey" value=""/>
                                            <a href="#" onclick="javascript:getCache()"
                                               class="btn_text"><em class="noico">캐쉬 정보 취득</em></a>

                                            <a href="#" onclick="javascript:setMCache()"
                                               class="btn_text"><em class="noico">M 캐쉬 생성</em></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th">Cache Value<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            ${cacheValue}
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/><br/>

                    <div class="section">
                        <h4 class="hd2">Cache 삭제</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:100px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">삭제할 Cache Key<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="text" name="deleteCacheKey" value=""/>
                                            <a href="#" onclick="javascript:deleteCache()"
                                               class="btn_text"><em class="noico">캐쉬 정보 취득</em></a>
                                        </div>
                                    </td>
                                </tr>
                                <%--<tr>--%>
                                <%--<th>--%>
                                <%--<div class="th">Cache Value<em class="must2"/></div>--%>
                                <%--</th>--%>
                                <%--<td>--%>
                                <%--<div class="td">--%>
                                <%--</div>--%>
                                <%--</td>--%>
                                <%--</tr>--%>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <br/><br/>
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
	