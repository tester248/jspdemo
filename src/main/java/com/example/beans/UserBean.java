package com.example.beans;

import java.io.Serializable;

/**
 * UserBean - JavaBean to hold user information
 * This bean stores username, password, and login status
 */
public class UserBean implements Serializable {
    private static final long serialVersionUID = 1L;
    
    private String username;
    private String password;
    private boolean loginStatus;
    private String message;
    
    // Default constructor
    public UserBean() {
        this.username = "";
        this.password = "";
        this.loginStatus = false;
        this.message = "";
    }
    
    // Parameterized constructor
    public UserBean(String username, String password) {
        this.username = username;
        this.password = password;
        this.loginStatus = false;
        this.message = "";
    }
    
    // Getter and setter methods
    public String getUsername() {
        return username;
    }
    
    public void setUsername(String username) {
        this.username = username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public boolean isLoginStatus() {
        return loginStatus;
    }
    
    public void setLoginStatus(boolean loginStatus) {
        this.loginStatus = loginStatus;
    }
    
    public String getMessage() {
        return message;
    }
    
    public void setMessage(String message) {
        this.message = message;
    }
    
    // Method to validate credentials (hardcoded for demo)
    public boolean validateCredentials() {
        // Simple hardcoded validation - you can enhance this
        if ("admin".equals(username) && "password".equals(password)) {
            this.loginStatus = true;
            this.message = "Login successful!";
            return true;
        } else if ("user".equals(username) && "user123".equals(password)) {
            this.loginStatus = true;
            this.message = "Login successful!";
            return true;
        } else {
            this.loginStatus = false;
            this.message = "Invalid username or password!";
            return false;
        }
    }
    
    // Method to reset the bean
    public void reset() {
        this.username = "";
        this.password = "";
        this.loginStatus = false;
        this.message = "";
    }
    
    @Override
    public String toString() {
        return "UserBean{" +
                "username='" + username + '\'' +
                ", loginStatus=" + loginStatus +
                ", message='" + message + '\'' +
                '}';
    }
}