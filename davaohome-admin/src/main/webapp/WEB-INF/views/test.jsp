<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>

<script type="text/javascript" src="/resources/js/gzip.min.js"></script>
<script type="text/javascript" src="/resources/js/jquery-1.11.1.min.js"></script>

<script>

    function gzipCall () {

        var data = {"str": "1111"};

        var gzip = new Zlib.Gzip(data);
        var compressed = gzip.compress();

        console.log(compressed);

        //        alert(compressed);

        $.ajax({
            url: 'http://local.kr.admin.gg-trip.com:8081/test/unzip',
            type: 'POST',
            contentType: 'application/octet-stream',
            data: compressed,
            processData: false
        });

    }

    function multipartCall () {
        document.testForm.submit();
    }


    function htmlJoinTest () {

        var form = $('<form>');
        var productId = 50;

        var t = new Date();
        var min = t.getMinutes();
        var time = t.getSeconds();
        var mili = t.getMilliseconds();

        console.log(min + '분 ' + time + '초 ' + mili);
        for (var index = 0; index < 200; index++) {
            var gradeId = 100
            var gradeName = "AAA"
            var denomId = 110
            var denomName = "BBB";
            var denomInnerName = "CCC";
            var markPrice = 1000
            var salePrice = 1100
            var settlementPrice = 1200
            var useYnName = "DDD";
            var modifyDatetime = "EEE"
            var modifyMemberNo = 200;

            $('<input type="text" name="productPrices[' + index + '].productId">')
                    .val(productId).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].productGradeId">')
                    .val(gradeId).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].productGradeName">')
                    .val(gradeName).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].productDenominationId">')
                    .val(denomId).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].productDenominationName">')
                    .val(denomName).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].markPrice">')
                    .val(markPrice).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].salePrice">')
                    .val(salePrice).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].settlementPrice">')
                    .val(settlementPrice).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].useYn">')
                    .val(useYnName == '사용' ? 'Y' : 'N').appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].useYnName">')
                    .val(useYnName).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].modifyDatetime">')
                    .val(modifyDatetime).appendTo(form);
            $('<input type="hidden" name="productPrices[' + index + '].modifyMemberNo">')
                    .val(modifyMemberNo).appendTo(form);
        }

        var t2 = new Date();
        min = t2.getMinutes();
        time = t2.getSeconds();
        mili = t2.getMilliseconds();
        console.log(min + '분 ' + time + '초 ' + mili);

        console.log("form " + form);
    }

    function htmlJoinTest2 () {

        var form = $('<form>');
        var productId = 50;

        var t = new Date();
        var min = t.getMinutes();
        var time = t.getSeconds();
        var mili = t.getMilliseconds();

        var cache = [];

        console.log(min + '분 ' + time + '초 ' + mili);
        for (var index = 0; index < 200; index++) {
            var gradeId = 100;
            var gradeName = "AAA";
            var denomId = 110;
            var denomName = "BBB";
            var denomInnerName = "CCC";
            var markPrice = 1000;
            var salePrice = 1100;
            var settlementPrice = 1200;
            var useYnName = "DDD";
            var modifyDatetime = "EEE";
            var modifyMemberNo = 200;

            cache.push($('<input type="text" name="productPrices[' + index + '].productId">')
                    .val(productId));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].productGradeId">')
                    .val(gradeId));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].productGradeName">')
                    .val(gradeName));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].productDenominationId">')
                    .val(denomId));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].productDenominationName">')
                    .val(denomName));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].markPrice">')
                    .val(markPrice));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].salePrice">')
                    .val(salePrice));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].settlementPrice">')
                    .val(settlementPrice));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].useYn">')
                    .val(useYnName == '사용' ? 'Y' : 'N'));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].useYnName">')
                    .val(useYnName));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].modifyDatetime">')
                    .val(modifyDatetime));
            cache.push($('<input type="hidden" name="productPrices[' + index + '].modifyMemberNo">')
                    .val(modifyMemberNo));
        }

        var t2 = new Date();
        min = t2.getMinutes();
        time = t2.getSeconds();
        mili = t2.getMilliseconds();
        console.log(min + '분 ' + time + '초 ' + mili);

        form.innerHTML = cache.join();

        console.log("form " + form.innerHTML);
    }

</script>

<body>

<input type="button" value="call" onclick="gzipCall()"/>
<br/>

<form name="testForm" method="POST" action="/test/multipart" enctype="multipart/form-data">
    <c:forEach begin="0" end="1">
        <input type="hidden" name="data" value="BBB"/>
    </c:forEach>

    <input type="button" value="callMultiPart" onclick="multipartCall()"/>
</form>

<br/>
<input type="button" value="htmlJoinTest1" onclick="htmlJoinTest()"/>
<br/>
<br/>
<br/>
<input type="button" value="htmlJoinTest2" onclick="htmlJoinTest2()"/>


</body>
</html>