<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@include file="../base/includeMeta.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="ko" xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title></title>
</head>
<body>
<script>
    try {
        if (parent) {
            parent.location.reload(true);
        }
    } catch (e) {
        alert("<fmt:message key="common.notFoundOpener"/>");
    }
</script>
</body>
</html>
