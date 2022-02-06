<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page isErrorPage="true" %>

<%@include file="../base/includeMeta.jsp" %>

<html lang="ko">
<head>
    <title></title>

    <%@include file="../base/includeResources.jsp" %>

</head>

<script>


</script>
<body>
<div id="wrap">
    <%@include file="../layout/header.jsp" %>
    <div id="container">
        <%@include file="../layout/leftMenu.jsp" %>


        <!-- content -->
        <div id="content">
            ERROR!! <br>
            ${exceptionStr}

        </div>

        <%@include file="../layout/footer.jsp" %>
    </div>
</body>
</html>