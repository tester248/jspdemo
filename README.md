# JSP Demo Login Application

A complete JSP login application demonstrating MVC (Model-View-Controller) architecture with user authentication, session management, and JSTL conditional rendering.

## Assignment Requirements ✅

This project fulfills Assignment 2 requirements:

### 1. View (JSP) ✅
- **login.jsp**: Login form with username/password fields
- **welcome.jsp**: Personalized welcome message using UserBean data
- **error.jsp**: Error page for invalid credentials with JSTL conditional rendering

### 2. Controller (Servlet) ✅
- **LoginServlet**: Processes form submission, validates credentials, sets user data in JavaBean
- **LogoutServlet**: Handles user logout and session cleanup

### 3. Model (JavaBean) ✅
- **UserBean**: Holds user information (username, password, status)

### 4. Enhancements ✅
- **Session Management**: Keeps users logged in with 30-minute timeout
- **JSTL Usage**: Conditional rendering and message display throughout the application

## Project Structure

```
jspdemo/
├── src/
│   └── main/
│       ├── java/
│       │   └── com/
│       │       └── example/
│       │           ├── beans/
│       │           │   └── UserBean.java          # Model - User data
│       │           └── servlets/
│       │               ├── LoginServlet.java      # Controller - Login logic
│       │               └── LogoutServlet.java     # Controller - Logout logic
│       └── webapp/
│           ├── WEB-INF/
│           │   └── web.xml                        # Servlet configuration
│           ├── login.jsp                          # View - Login form
│           ├── welcome.jsp                        # View - Success page
│           ├── error.jsp                          # View - Error page
│           └── index.jsp                          # Entry point
├── pom.xml                                        # Maven configuration
└── README.md                                      # This file
```

## Features

### 🔐 Authentication
- Hardcoded user credentials for demo:
  - **Admin**: username: `admin`, password: `password`
  - **User**: username: `user`, password: `user123`

### 🎨 User Interface
- Modern, responsive design with CSS gradients
- Clean form layouts with proper validation
- Visual feedback for success and error states

### 🔄 Session Management
- Automatic session creation upon successful login
- Session timeout after 30 minutes of inactivity
- Secure session handling with HTTP-only cookies
- Proper session cleanup on logout

### 🏷️ JSTL Features
- Conditional rendering based on authentication status
- Dynamic content display using UserBean data
- Error message handling with conditional display
- Session state checks and redirections

## How to Run

### Prerequisites
- Java 11 or higher
- Maven 3.6 or higher
- For Tomcat: Apache Tomcat 10.0+ (Jakarta EE compatible)

### Method 1: Using Jetty Maven Plugin (Recommended) ✅

1. **Build and run in one command:**
   ```bash
   mvn clean compile jetty:run
   ```

2. **Access the application:**
   - URL: `http://localhost:8080/jspdemo`
   - Login with demo credentials provided on the page

### Method 2: Manual Tomcat Deployment

1. **Build the project:**
   ```bash
   mvn clean compile package
   ```

2. **Deploy to Tomcat 10+:**
   - Copy `target/jspdemo.war` to your Tomcat 10+ `webapps` directory
   - Start Tomcat server
   - Access: `http://localhost:8080/jspdemo`

**⚠️ Note:** Tomcat Maven Plugin is NOT compatible with this project because:
- This project uses **Jakarta EE** (modern)
- Tomcat Maven Plugin uses **Java EE** (legacy)
- Use Jetty Maven Plugin instead or manual Tomcat 10+ deployment

### Method 3: IDE Deployment

1. **Import project** into your IDE (Eclipse, IntelliJ IDEA)
2. **Configure Tomcat 10+ server** in your IDE (Jakarta EE compatible)
3. **Deploy and run** the project
4. **Access** at `http://localhost:8080/jspdemo`

## Testing the Application

### Login Flow
1. **Access**: Navigate to `http://localhost:8080/jspdemo`
2. **Login Page**: You'll see the login form
3. **Enter Credentials**: Use demo credentials provided
4. **Success**: Redirected to welcome page with personalized message
5. **Session**: User session is maintained for 30 minutes
6. **Logout**: Click logout to end session

### Error Handling
1. **Invalid Credentials**: Enter wrong username/password
2. **Error Page**: Displays error message with retry option
3. **JSTL Conditional**: Different messages based on input
4. **Session Protection**: Protected pages redirect to login if not authenticated

## Demo Credentials

| Role  | Username | Password |
|-------|----------|----------|
| Admin | admin    | password |
| User  | user     | user123  |

## Key Components Explained

### UserBean.java (Model)
- Implements `Serializable` for session storage
- Contains user properties: username, password, loginStatus, message
- Includes `validateCredentials()` method with hardcoded validation
- Provides getter/setter methods for all properties

### LoginServlet.java (Controller)
- Handles POST requests from login form
- Creates UserBean instance and validates credentials
- Manages session creation and attributes
- Forwards to appropriate view (welcome.jsp or error.jsp)

### JSP Views
- **login.jsp**: Bootstrap-styled login form with validation
- **welcome.jsp**: Protected page showing user info and session details
- **error.jsp**: Error handling with retry form and helpful messages

### Session Management
- 30-minute timeout configuration
- HTTP-only cookies for security
- Session attribute storage for user data
- Proper cleanup on logout

### JSTL Usage
- `<c:if>` for conditional rendering
- `<c:choose>`, `<c:when>`, `<c:otherwise>` for complex conditions
- `<c:out>` for safe output with XSS protection
- `<c:redirect>` for navigation control

## Developer Notes

- **MVC Pattern**: Clear separation of concerns
- **Security**: Input validation and session management
- **Responsive Design**: Mobile-friendly interface
- **Error Handling**: Comprehensive error pages and messages
- **JSTL Integration**: Extensive use of conditional rendering
- **Session Security**: HTTP-only cookies and timeout configuration
