<div id="header" class="">
    <h1><a href="#"><span class="wisecall"></span>ADM</a></h1>

    <div class="top_ct">
        <div class="log">
            <a href="javascript:wiseLogout()"><span>Logout</span></a>
        </div>
    </div>
    <div class="gnb_ct">
        <ul id="gnb" class="gnb">
            <c:forEach var="rootMenu" items="${rootMenuList}">
                <li ${menu == rootMenu.menuId ? "class='on'" : "" }><a href="${rootMenu.menuUrl}">
                    <span></span>
                    <fmt:message key="${rootMenu.menuName}"/>
                </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<script>
    function wiseLogout () {
        document.location.href = "/auth/logout";
    }
</script>