<%-- 
    Document   : login
    Created on : Mar 11, 2025, 6:21:21 PM
    Author     : Shezi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login - Online Hackathon PlatformPage</title>
        <link rel="stylesheet" href="css/main.css">
        <style>
            .login-err{
                padding: 10px 10px;
                border-left: 3px solid red;
                background-color: #ff9999;
                color: #555;
                box-shadow: 0 0 10px rgba(0,0,0,0.7);
                align-content: center;
                font-size: 0.7rem;
            }
        </style>
        <%
        String loginErr = (String) session.getAttribute("loginErr");
        %>
    </head>
    <body>
         <div class="header">
            <div class="logo">
                <img src="image/istockphoto-1216719274-612x612.jpg" alt="logo_image">
                <h1>Online Hosting Hackathon Platform</h1>
            </div>
            <nav class="nav_links">
                <ul>
                    <li><a href="index.html">Home</a></li>
                    <li><a href="login.jsp">Login</a></li>
                    <li><a href="register.jspd">Register</a></li>
                    <li><a href="features.html">Features</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="contact.html">Contact</a></li>
                </ul>
            </nav>
        </div>
        <div class="home_container">
            <diV class="home_content">
                <h2>Join the Hackathon</h2>
                <p>Participate, innovate, and win amazing prizes!</p>
                <button>Get Started</button>
            </diV>
            <div class="features">
                <img src="image/images (2).jpg" alt="image">
                <button>Explore Features</button>
            </div>
        </div>
        <div class="modal">
            <div class="modal-content">
                <a href="index.html"><span class="close">&times;</span></a>
                <h2>Login</h2>
                <%
                    if(loginErr != null){
                %>
                <div class="login-err">
                    <p><%=loginErr%></p>
                </div>
                <%
                    }
                %>
                <form action="LoginServlet.do" method="post">
                    <label for="username">Username</label>
                    <input type="text" id="username" name="username" placeholder="example@gmail.com" required>

                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" placeholder="Enter your password..." required>

                    <button type="submit">Login</button>
                </form>
                <div class="login_options">
                    <hr />
                    <p>Login with</p>
                    <ul>
                        <li>
                            <a href="#"><img src="image/social/google.jpg" alt="facebook-sign-up"></a>
                        </li>
                        <li>
                            <a href="#"><img src="image/social/facebook.png" alt="facebook-sign-up"></a>
                        </li>
                    </ul>

                </div>
                <hr />
                <div class="register_here">
                    <p>Don't have an account yet? <a href="register.jsp">Register</a></p>
                </div>
                <div class="forgot_password">
                    <a href="change_password.jsp">Forgot Password?</a>
                </div>
            </div>
        </div>
    </body>
</html>
