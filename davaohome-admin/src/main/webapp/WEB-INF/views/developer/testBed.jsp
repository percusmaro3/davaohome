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

    function makeImage () {
        var f = document.makeImageForm;
        f.submit();
    }

    function translateApi () {
        var f = document.translateForm;
        translate("en", "ko", f.srcText.value, translateApiCallback);
    }

    function translateApiCallback (str) {
        var f = document.translateForm;
        f.result.value = str;
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
                    <h3>Make image</h3>
                </div>
                <br/>

                <form name="makeImageForm" action="/developer/makeImage" method="POST" enctype="multipart/form-data">
                    <div class="section">
                        <h4 class="hd2">이미지 만들기</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:150px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">이미지 만들기<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <input type="file" accept="image/*" name="imageFile" style="width:150px" value="">
                                            <a href="${imageUrl}" target="_blank">
                                                <img src="${imageUrl}"/>
                                            </a>

                                            <div class="btn_final btn_right">
                                                <a href="#"
                                                   onclick="javascript:makeImage()"><em class="serch"><span></span>
                                                    생성하기</em></a>
                                            </div>
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

            <div class="tbl_type2">
                <div class="hd_wrap">
                    <h3>Translate</h3>
                </div>
                <br/>

                <form name="translateForm" action="/developer/translate" method="POST">
                    <input type="hidden" name="src"/>

                    <div class="section">
                        <h4 class="hd2">번역 처리</h4>

                        <div class="tbl_type2">
                            <table>
                                <colgroup>
                                    <col style="width:150px">
                                    <col style="width:350px">
                                </colgroup>
                                <tbody>
                                <tr>
                                    <th>
                                        <div class="th">번역<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <textarea name="srcText"></textarea>

                                            <div class="btn_final btn_right">
                                                <a href="#"
                                                   onclick="javascript:translateApi()"><em class="serch"><span></span>
                                                    번역하기</em></a>
                                            </div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        <div class="th">번역 결과<em class="must2"/></div>
                                    </th>
                                    <td>
                                        <div class="td">
                                            <textarea name="result">${result}</textarea>
                                        </div>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- //content -->
    </div>
</div>

<%@include file="../layout/footer.jsp" %>
</div>
</body>
</html>
	