<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Redirect to login page if not authenticated -->
<c:choose>
    <c:when test="${not empty sessionScope.isLoggedIn and sessionScope.isLoggedIn}">
        <c:redirect url="welcome.jsp"/>
    </c:when>
    <c:otherwise>
        <c:redirect url="login.jsp"/>
    </c:otherwise>
</c:choose>