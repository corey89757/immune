<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<ul class="menu">
    <li class="menu-item">
        <a href="${ctx}">
            Home
        </a>
    </li>
    <li class="menu-item">
        <a href="${ctx}/analysis">
            Analysis
        </a>
    </li>
    <li class="menu-item">
        <a href="${ctx}/manual>
            Manual
        </a>
    </li>
    <li class="menu-item">
        <a>
            Contact
        </a>
    </li>
</ul>
<script>
    <%--Set menu--%>
    (function () {
        var
            path = location.pathname.replace(/^\/|\/$/g, "") || "home",
            $ = function (selector) {
                return typeof selector == "string" ? document.querySelector(selector) : selector;
            },
            findMenu = $(".menu").querySelector("a[href*='" + path + "']");
        findMenu && (findMenu.parentNode.classList.add("active"))
    })();
</script>