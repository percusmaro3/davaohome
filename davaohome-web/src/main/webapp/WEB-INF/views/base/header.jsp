<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>


<body>
<div class="mobile_menu">
    <h2 id="x_btn"><img src="${resouceUrl}/images/x_bttn.png"></h2>
    <ul>
        <li><a href="/${language}/introduce">부동산소개</a></li>
        <li><a href="/${language}/strength">당사의 강점</a></li>
        <li><a href="/${language}/partner">제휴 건설사</a></li>
        <li><a href="/${language}/performance">운용 실적</a></li>
        <li><a href="/${language}/guide">다바오 소개</a></li>
        <li><a href="/${language}/news">새소식</a></li>
        <li><a href="/${language}/question">문의사항</a></li>
        <li><a href="/${language}/company">회사개요</a></li>
    </ul>

</div><!--모바일 메뉴-->
<div id="header">
    <div class="language_wrap">
        <div class="language">
            <div class="language_btn">
                <span><a href="/${language}/home">한국어</a></span>
                <span>|</span>
                <span><a href="javascript:alert('준비중입니다.')">영어</a></span>
            </div>
        </div>
    </div>
    <!--한국어/영어-->

    <div class="logo">
        <a href="/${language}/home"><img src="${resouceUrl}/images/header/logo.png"></a>
    </div>

    <ul class="gnb">
        <li><a href="/${language}/introduce.">부동산소개</a></li>
        <li><a href="/${language}/strength">당사의 강점</a></li>
        <li><a href="/${language}/partner">제휴 건설사</a></li>
        <li><a href="/${language}/performance">운용 실적</a></li>
        <li><a href="/${language}/guide">다바오 소개</a></li>
        <li><a href="/${language}/news">새소식</a></li>
        <li><a href="/${language}/question">문의사항</a></li>
        <li><a href="/${language}/company">회사개요</a></li>
    </ul>
    <div class="mobile_menu_btn">
        <img src="${resouceUrl}/images/mobile_menu.png">
    </div>
    <div id="gnb_line">
    </div>
</div>
<!--header-->

<script>
    function changeLanguage(language){
        var urlPath = window.location.pathname;
        var lastPath = urlPath.substring(3);

        this.location.href = "/"+language+lastPath;
    }
</script>
