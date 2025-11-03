<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.Date" %>

<!-- Session check - redirect to login if not authenticated -->
<c:if test="${empty sessionScope.isLoggedIn or !sessionScope.isLoggedIn}">
    <c:redirect url="login.jsp"/>
</c:if>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome - JSP Demo Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            margin: 0;
            padding: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .welcome-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 600px;
            text-align: center;
        }
        
        .welcome-header {
            margin-bottom: 2rem;
        }
        
        .welcome-header h1 {
            color: #333;
            margin-bottom: 0.5rem;
            font-size: 2.5rem;
        }
        
        .welcome-message {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
        }
        
        .user-info {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            border-left: 4px solid #667eea;
        }
        
        .user-info h3 {
            margin: 0 0 1rem 0;
            color: #333;
        }
        
        .info-item {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 0.5rem 0;
            border-bottom: 1px solid #dee2e6;
        }
        
        .info-item:last-child {
            border-bottom: none;
        }
        
        .info-label {
            font-weight: bold;
            color: #666;
        }
        
        .info-value {
            color: #333;
        }
        
        .actions {
            display: flex;
            gap: 1rem;
            justify-content: center;
            flex-wrap: wrap;
        }
        
        .btn {
            padding: 0.75rem 1.5rem;
            border: none;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: transform 0.2s;
        }
        
        .btn:hover {
            transform: translateY(-2px);
        }
        
        .btn-primary {
            background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            color: white;
        }
        
        .btn-secondary {
            background: #6c757d;
            color: white;
        }
        
        .btn-danger {
            background: #dc3545;
            color: white;
        }
        
        .session-info {
            background: #e9ecef;
            padding: 1rem;
            border-radius: 5px;
            margin-top: 1rem;
            font-size: 0.9rem;
            color: #666;
        }
    </style>
</head>
<body>
    <div class="welcome-container">
        <div class="welcome-header">
            <h1>🎉 Welcome!</h1>
        </div>
        
        <div class="welcome-message">
            <h2>Hello, <c:out value="${sessionScope.username}"/>!</h2>
            <p>You have successfully logged into the JSP Demo Application.</p>
        </div>
        
        <div class="user-info">
            <h3>User Information</h3>
            
            <div class="info-item">
                <span class="info-label">Username:</span>
                <span class="info-value">
                    <c:choose>
                        <c:when test="${not empty userBean.username}">
                            <c:out value="${userBean.username}"/>
                        </c:when>
                        <c:otherwise>
                            <c:out value="${sessionScope.username}"/>
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
            
            <div class="info-item">
                <span class="info-label">Login Status:</span>
                <span class="info-value">
                    <c:choose>
                        <c:when test="${sessionScope.isLoggedIn}">
                            ✅ Authenticated
                        </c:when>
                        <c:otherwise>
                            ❌ Not Authenticated
                        </c:otherwise>
                    </c:choose>
                </span>
            </div>
            
            <div class="info-item">
                <span class="info-label">Session ID:</span>
                <span class="info-value"><%= session.getId().substring(0, 8) %>...</span>
            </div>
            
            <div class="info-item">
                <span class="info-label">Login Time:</span>
                <span class="info-value">
                    <fmt:formatDate value="<%= new Date() %>" pattern="MMM dd, yyyy HH:mm:ss"/>
                </span>
            </div>
        </div>
        
        <!-- Display success message if available -->
        <c:if test="${not empty message}">
            <div class="welcome-message">
                <p><c:out value="${message}"/></p>
            </div>
        </c:if>
        
        <!-- Display UserBean message if available -->
        <c:if test="${not empty userBean.message}">
            <div class="welcome-message">
                <p><c:out value="${userBean.message}"/></p>
            </div>
        </c:if>
        
        <div class="actions">
            <button class="btn btn-primary" onclick="location.reload()">
                🔄 Refresh Page
            </button>
            
            <a href="login.jsp" class="btn btn-secondary">
                🏠 Back to Login
            </a>
            
            <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-danger">
                🚪 Logout
            </a>
        </div>
        
        <div class="session-info">
            <strong>Session Management:</strong> Your session will automatically expire after 30 minutes of inactivity.
            Current session is active and secure.
        </div>
    </div>
</body>
</html>