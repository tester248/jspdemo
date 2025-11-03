<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isErrorPage="true" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Error - JSP Demo Application</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff6b6b 0%, #ee5a24 100%);
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .error-container {
            background: white;
            padding: 2rem;
            border-radius: 10px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.1);
            width: 100%;
            max-width: 500px;
            text-align: center;
        }
        
        .error-header {
            margin-bottom: 2rem;
        }
        
        .error-header h1 {
            color: #dc3545;
            margin-bottom: 0.5rem;
            font-size: 2.5rem;
        }
        
        .error-icon {
            font-size: 4rem;
            margin-bottom: 1rem;
        }
        
        .error-message {
            background: #f8d7da;
            border: 1px solid #f5c6cb;
            color: #721c24;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
        }
        
        .error-message h3 {
            margin: 0 0 1rem 0;
            color: #721c24;
        }
        
        .error-details {
            background: #fff3cd;
            border: 1px solid #ffeeba;
            color: #856404;
            padding: 1rem;
            border-radius: 5px;
            margin-bottom: 2rem;
            text-align: left;
        }
        
        .error-details h4 {
            margin: 0 0 0.5rem 0;
            color: #856404;
        }
        
        .error-details ul {
            margin: 0.5rem 0 0 1rem;
            padding: 0;
        }
        
        .error-details li {
            margin-bottom: 0.25rem;
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
        
        .retry-form {
            background: #f8f9fa;
            padding: 1.5rem;
            border-radius: 8px;
            margin-bottom: 2rem;
            border-left: 4px solid #dc3545;
        }
        
        .form-group {
            margin-bottom: 1rem;
            text-align: left;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
            font-weight: bold;
        }
        
        .form-group input {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 1rem;
            box-sizing: border-box;
        }
        
        .form-group input:focus {
            outline: none;
            border-color: #667eea;
            box-shadow: 0 0 0 2px rgba(102, 126, 234, 0.1);
        }
        
        .demo-credentials {
            background: #d1ecf1;
            border: 1px solid #bee5eb;
            color: #0c5460;
            padding: 1rem;
            border-radius: 5px;
            margin-top: 1rem;
        }
        
        .demo-credentials h4 {
            margin: 0 0 0.5rem 0;
        }
        
        .demo-credentials p {
            margin: 0.25rem 0;
            font-size: 0.9rem;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <div class="error-header">
            <div class="error-icon">❌</div>
            <h1>Authentication Failed</h1>
        </div>
        
        <div class="error-message">
            <h3>Login Error</h3>
            <p>
                <c:choose>
                    <c:when test="${not empty errorMessage}">
                        <c:out value="${errorMessage}"/>
                    </c:when>
                    <c:when test="${not empty userBean.message}">
                        <c:out value="${userBean.message}"/>
                    </c:when>
                    <c:otherwise>
                        Invalid username or password. Please check your credentials and try again.
                    </c:otherwise>
                </c:choose>
            </p>
        </div>
        
        <!-- Conditional rendering using JSTL -->
        <c:if test="${not empty userBean}">
            <div class="error-details">
                <h4>Attempt Details:</h4>
                <ul>
                    <li><strong>Username attempted:</strong> 
                        <c:choose>
                            <c:when test="${not empty userBean.username}">
                                <c:out value="${userBean.username}"/>
                            </c:when>
                            <c:otherwise>
                                (empty)
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li><strong>Status:</strong> 
                        <c:choose>
                            <c:when test="${userBean.loginStatus}">
                                ✅ Authenticated
                            </c:when>
                            <c:otherwise>
                                ❌ Authentication Failed
                            </c:otherwise>
                        </c:choose>
                    </li>
                    <li><strong>Time:</strong> <%= new java.util.Date() %></li>
                </ul>
            </div>
        </c:if>
        
        <!-- Quick retry form -->
        <div class="retry-form">
            <h3>Try Again</h3>
            <form action="${pageContext.request.contextPath}/LoginServlet" method="post">
                <div class="form-group">
                    <label for="username">Username:</label>
                    <input type="text" id="username" name="username" 
                           value="${not empty userBean.username ? userBean.username : ''}"
                           placeholder="Enter your username" required>
                </div>
                
                <div class="form-group">
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" 
                           placeholder="Enter your password" required>
                </div>
                
                <button type="submit" class="btn btn-primary" style="width: 100%;">
                    🔑 Try Again
                </button>
            </form>
        </div>
        
        <div class="actions">
            <a href="login.jsp" class="btn btn-secondary">
                🏠 Back to Login Page
            </a>
        </div>
        
        <!-- Demo credentials info using JSTL conditional rendering -->
        <c:choose>
            <c:when test="${param.showHelp eq 'true' or empty userBean.username or userBean.username eq 'admin' or userBean.username eq 'user'}">
                <div class="demo-credentials">
                    <h4>💡 Need Help? Try these demo credentials:</h4>
                    <p><strong>Admin Account:</strong> username: admin, password: password</p>
                    <p><strong>User Account:</strong> username: user, password: user123</p>
                </div>
            </c:when>
            <c:otherwise>
                <div class="demo-credentials">
                    <h4>💡 Hint:</h4>
                    <p>Make sure you're using the correct demo credentials provided on the login page.</p>
                    <a href="error.jsp?showHelp=true&username=${userBean.username}" style="color: #0c5460; text-decoration: underline;">
                        Show demo credentials
                    </a>
                </div>
            </c:otherwise>
        </c:choose>
    </div>
</body>
</html>