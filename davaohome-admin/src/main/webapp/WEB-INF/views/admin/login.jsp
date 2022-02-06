<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page session="false" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>

    <%@include file="../base/includeResources.jsp" %>

    <link rel="stylesheet" type="text/css" href="/resources/css/login/login_common.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/login/login_popup.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/login/login_font.css">
    <script type="text/javascript" src="/resources/js/jquery.placeholder.min.js"></script>
</head>

<body>

<form name="loginForm" id="loginForm" action="doLogin" method="POST">
    <div id="wrap_member">
        <p class="top_guide_txt">
            <span>GoGo Trip Admin For ${countryName}</span><br>
        </p>

        <br/><br/><br/>

        <div id="container">
            <!-- contents -->
            <fieldset>
                <legend>로그인</legend>
                <div class="login_area">
				<span class="input_txt_area" id="email_id_input">
					<input type="text" id="adminId" name="adminId" placeholder="Admin ID" title="Admin ID" class="input"
                           onkeypress="javascript:doTLLogin(event);" onfocus="onClassName('email_id_input');"
                           onblur="offClassName('email_id_input');" value="${adminId}">
					<button type="button" class="btn_del on" tabindex="-1">입력한 내용 지우기</button>
                    <c:if test="${error != null}">
                        <font color="red"><fmt:message key="user.alertInsertId"/></font>
                    </c:if>
				</span>

				<span class="input_txt_area" id="pw_input">
					<input type="password" id="password" name="password" placeholder="Admin Password" title="비밀번호" class="input"
                           onkeypress="javascript:doTLLogin(event);" onfocus="onClassName('pw_input');" onblur="offClassName('pw_input');">
					<button type="button" class="btn_del on" tabindex="-1">입력한 내용 지우기</button>
				</span>
                    <br/>
                    <br/>

                    <p class="login_guide_txt">
                        <strong>Select your language</strong>
                        <c:forEach var="language" items="${languageList}">
                            <input type=radio name="language"
                                   value="${language}" ${savedLanguage == language ? 'checked' : '' } />
                            ${language}
                        </c:forEach>
                    </p>
                    <br/>
                    <button type="button" class="button btn_v1" onclick="javascript:doTLLogin();">Login</button>
                </div>
            </fieldset>
            <!-- //contents -->
        </div>
        <br/><br/><br/><br/><br/><br/><br/><br/><br/><br/>

        <div id="footer">
            <p>&copy; Wise Corp. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</p>
        </div>
    </div>


</form>

<script>

    $(function () {
        $('input[name="adminId"]').placeholder();
        $('input[name="password"]').placeholder();
    });

    $(document).ready(function () {
        $(".btn_del").click(function () {
            $(this).parent().find(":input").val('');
            $(this).parent().find(":input").blur();
        });
    });


    function doTLLogin (event) {
        if (event != null && event.keyCode != 13)
            return;

        if ($('input[name=adminId]').val() == '') {
            alert("Please input your id");
            return;
        }
        if ($('input[name=password]').val() == '') {
            alert("Please input your password");
            return;
        }
        if ($('input:radio[name=language]:checked').val() == undefined) {
            alert("Please select your language");
            return;
        }
        $('#loginForm').submit();
    }

    function onClassName (divId) {
        var element = document.getElementById(divId);
        if (element != null && element != 'undefined' && element.className.indexOf("on") > 0) {
            //element.className = element.className.replace(" on", "");
        } else {
            element.className = element.className + " on";
        }
    }

    function offClassName (divId) {
        var element = document.getElementById(divId);
        if (element != null && element != 'undefined' && element.className.indexOf("on") > 0) {
            element.className = element.className.replace(" on", "");
        } else {
            //element.className = element.className + " on";
        }
    }


</script>

</body>
</html>
