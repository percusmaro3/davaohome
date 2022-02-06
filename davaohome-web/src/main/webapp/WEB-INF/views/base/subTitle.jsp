<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<div class="subTitleImg">
    <div class="cont">
        <div class="titleLine">
            <div class="title">${title}</div>
            <div class="subtitle">${titleSubText}</div>
        </div>

        <div class="nav">
            <div class="home"><img src="${resouceUrl}/images/sub/homeIcon.png"></div>
            <div class="arrowNav"><img src="${resouceUrl}/images/sub/arrowNav.png"></div>
            <div class="navText">
                <c:choose>
                    <c:when test="${depth1Url != ''}">
                        <a href="${depth1Url}" style="color: white" >${depth1Text}</a>
                    </c:when>
                    <c:otherwise>
                        ${depth1Text}
                    </c:otherwise>
                </c:choose>
            </div>
            <div class="arrowNav"><img src="${resouceUrl}/images/sub/arrowNav.png"></div>
            <div class="navText" ><a href="${depth2Url}" style="color: white" >${depth2Text}</a></div>
        </div>
    </div>
    <div class="bg"><img src="${backImg}"></div>
</div>
