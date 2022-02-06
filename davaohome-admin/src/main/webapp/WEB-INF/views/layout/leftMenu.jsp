<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<div id="#lnb" class="lnb_area" style="display:block">
    <div role="navigation" class="lnb">
        <ul class="lnb_lst">
            <c:forEach var="rootMenu" items="${rootMenuList}">
                <c:if test="${menu == rootMenu.menuId}">
                    <div class="lnb_tit">
                        <h2 class="lnb_h lnb_env_tit"><span></span><fmt:message key="${rootMenu.menuName}"/></h2>
                    </div>
                    <c:choose>
                        <c:when test="${fn:length(rootMenu.childMenuList) !=0 }">
                            <c:forEach var="childMenu" items="${rootMenu.childMenuList}">
                                <li ${childMenu == childMenu.menuId ? "class='on'" : "" }>
                                    <a href="${childMenu.menuUrl}" class="lnb_lst_a">
                                        <fmt:message key="${childMenu.menuName}"/></a>
                                </li>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <script>ctrLeftMenu()</script>
                        </c:otherwise>
                    </c:choose>
                </c:if>
            </c:forEach>
        </ul>
    </div>

    <div class="fold_bar">
        <a href="javascript:ctrLeftMenu();" class="">Close Menu</a>
    </div>
</div>