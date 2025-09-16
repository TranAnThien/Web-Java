<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<main>
    <div class="container-fluid px-4">

        <!-- Ưu tiên lấy từ request attribute 'page', nếu không thì lấy từ param.page, mặc định là dashboard -->
        <c:set var="currentPage" value="${not empty page ? page : (empty param.page ? 'dashboard' : param.page)}" />

        <c:choose>
            <c:when test="${currentPage == 'dashboard'}">
                <jsp:include page="/views/admin/dashboard.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'charts'}">
                <jsp:include page="/views/admin/charts.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'tables'}">
                <jsp:include page="/views/admin/tables.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'register'}">
                <jsp:include page="/views/admin/register.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'login'}">
                <jsp:include page="/views/admin/login.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'password'}">
                <jsp:include page="/views/admin/password.jsp"/>
            </c:when>
            <c:when test="${currentPage == '401'}">
                <jsp:include page="/views/admin/401.jsp"/>
            </c:when>
            <c:when test="${currentPage == '404'}">
                <jsp:include page="/views/admin/404.jsp"/>
            </c:when>
            <c:when test="${currentPage == '500'}">
                <jsp:include page="/views/admin/500.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'profile'}">
                <jsp:include page="/views/admin/profile.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'category'}">
                <jsp:include page="/views/admin/category.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'user'}">
                <jsp:include page="/views/admin/user.jsp"/>
            </c:when>
            <c:when test="${currentPage == 'video'}">
                <jsp:include page="/views/admin/video.jsp"/>
            </c:when>
        </c:choose>

    </div>
</main>
