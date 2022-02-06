<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<%@include file="../base/includeMeta.jsp" %>

<html>
<head>
    <meta http-equiv="Content-type" content="text/html; charset=UTF-8"/>
    <style>
        .copyright {
            clear: both;
            padding: 30px 0 50px 0;
            color: #676767;
            text-align: center;
        }

        .copyright .bb {
            color: #00535D;
        }

        .num {
            font-family: Tahoma;
            font-size: 11px;
        }
    </style>
</head>
<body onload="">
<table cellpadding="0" cellspacing="0" width="100%" height="100%">
    <colgroup>
        <col width="20">
        <col width="*">
        <col width="20">
    </colgroup>
    <tr>
        <td></td>
        <td>
            <!--- right --->
            <table cellpadding="0" cellspacing="0" width="100%" height="100%">
                <tr valign="center">
                    <td>
                        <table align="center" cellspacing="1" bgcolor="#E8E8E8" cellpadding="4" border="0" width="500" height="200">
                            <tr bgcolor="#FFFFFF" valign="center">
                                <td align="center">
                                    <p class="p14"><strong style="color:#444;"> ページ呼び出し中エラーが発生しました。<br></strong></p>
                                    <br>エラーの内容が自動的に管理者へ報告されました。</p>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <!--- copyright --->
                        <div class="copyright"><span class="num">Copyright ⓒ <strong class="bb">Corp.</strong> All Rights Reserved.</span></div>
                        <!--// copyright -->
                    </td>
                </tr>
            </table>
            <!--// right -->
        </td>
        <td></td>
    </tr>
</table>

</body>
</html>    
