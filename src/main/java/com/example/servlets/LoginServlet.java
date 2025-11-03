package com.example.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.example.beans.UserBean;

/**
 * LoginServlet - Controller to handle login form submission
 * Processes user authentication and manages sessions
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    public LoginServlet() {
        super();
    }
    
    /**
     * Handles GET requests - redirects to login page
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.sendRedirect("login.jsp");
    }
    
    /**
     * Handles POST requests - processes login form submission
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // Get form parameters
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        
        // Create UserBean instance
        UserBean userBean = new UserBean();
        userBean.setUsername(username);
        userBean.setPassword(password);
        
        // Validate credentials
        boolean isValidUser = userBean.validateCredentials();
        
        if (isValidUser) {
            // Create or get existing session
            HttpSession session = request.getSession(true);
            
            // Set session attributes
            session.setAttribute("userBean", userBean);
            session.setAttribute("username", username);
            session.setAttribute("isLoggedIn", true);
            
            // Set session timeout (30 minutes)
            session.setMaxInactiveInterval(30 * 60);
            
            // Set request attributes for immediate use
            request.setAttribute("userBean", userBean);
            request.setAttribute("message", "Welcome " + username + "!");
            
            // Forward to welcome page
            request.getRequestDispatcher("welcome.jsp").forward(request, response);
            
        } else {
            // Authentication failed
            userBean.setMessage("Invalid username or password. Please try again.");
            
            // Set request attributes for error page
            request.setAttribute("userBean", userBean);
            request.setAttribute("errorMessage", userBean.getMessage());
            
            // Forward to error page
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
    
    /**
     * Method to handle logout functionality
     */
    protected void doDelete(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        
        response.sendRedirect("login.jsp");
    }
}