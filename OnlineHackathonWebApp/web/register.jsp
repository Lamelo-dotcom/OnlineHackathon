<%-- 
    Document   : register
    Created on : Mar 11, 2025, 6:25:36 PM
    Author     : Shezi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/main.css">
        <style>
            .role-container {
                padding: 10px;
                display: flex;
                width: 100%;
                align-items: center;
                justify-content: center;
                gap: 10px;
            }
            .error-message {
                color: #d32f2f;
                background-color: #ffebee;
                padding: 10px;
                border-radius: 4px;
                margin-bottom: 15px;
                text-align: center;
                font-size: 14px;
            }
            .password-match {
                border: 2px solid #4CAF50 !important; /* Green border when matching */
                background-color: #e8f5e9 !important; /* Light green background when matching */
            }
            .password-mismatch {
                border: 2px solid #d32f2f !important; /* Red border when not matching */
                background-color: #ffebee !important; /* Light red background when not matching */
            }
            .tick-container {
                text-align: center;
                margin-top: 2px;
                height: 20px; /* Reserve space for the tick */
            }
            .tick-icon {
                display: none;
                color: #4CAF50; /* Green tick */
                font-size: 20px;
            }
        </style>
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
                    <li><a href="sign-up">Register</a></li>
                    <li><a href="#">Features</a></li>
                    <li><a href="#">About</a></li>
                    <li><a href="#">Contact</a></li>
                </ul>
            </nav>
        </div>
        <div class="home_container">
            <div class="home_content">
                <h2>Join the Hackathon</h2>
                <p>Participate, innovate, and win amazing prizes!</p>
                <button>Get Started</button>
            </div>
            <div class="features">
                <img src="image/images (2).jpg" alt="image">
                <button>Explore Features</button>
            </div>
        </div>
        <div class="modal">
            <div class="modal-content">
                <a href="index.html"><span class="close">×</span></a>
                <h2>Register</h2>
                <% 
                    String errorMsg = (String) request.getAttribute("errorMsg");
                    if (errorMsg != null) {
                %>
                    <div class="error-message"><%= errorMsg %></div>
                <% } %>
                <form action="RegisterServlet.do" method="post">
                    <label for="firstName">First Name</label>
                    <input type="text" id="fullName" name="firstName" placeholder="Full name..." required>

                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" placeholder="Last name..." required>

                    <label for="email">Email Address</label>
                    <input type="email" id="email" name="email" placeholder="example@gmail.com" required>

                    <label for="phoneNumber">Phone Number</label>
                    <input type="number" id="phoneNumber" name="phoneNumber" placeholder="Phone number..." required>
                    
                    <label for="dob">Date Of Birth</label>
                    <input type="date" id="dob" name="dob" placeholder="Birth date..." required>
                    
                    <div class="role-container">
                        <label for="role">Role</label>
                        <select id="role" name="role">
                            <option value="Participant">Participant</option>
                            <option value="Sponsor">Sponsor</option>
                            <option value="Mentor">Mentor</option>
                        </select>
                    </div>

                    <label for="password">Password</label>
                    <input type="password" id="regPassword" name="password" placeholder="Create a password..." required>

                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" placeholder="Re-enter password..." required>
                    <div class="tick-container">
                        <span class="tick-icon">✔</span>
                    </div>

                    <button type="submit">Register</button>
                    <hr>
                    <p>Already have an account? <a href="login.jsp">Login</a></p>
                </form>
            </div>
        </div>
        <script>
            const passwordInput = document.getElementById("regPassword");
            const confirmPasswordInput = document.getElementById("confirmPassword");
            const tickIcon = document.querySelector(".tick-icon");

            function validatePasswords() {
                const password = passwordInput.value;
                const confirmPassword = confirmPasswordInput.value;

                // If confirmPassword is empty, clear styles on both fields
                if (confirmPassword === "") {
                    passwordInput.classList.remove("password-match", "password-mismatch");
                    confirmPasswordInput.classList.remove("password-match", "password-mismatch");
                    tickIcon.style.display = "none";
                    return;
                }

                // If user types in confirmPassword, compare passwords
                if (password === confirmPassword) {
                    // Passwords match: green border and background for both
                    passwordInput.classList.remove("password-mismatch");
                    passwordInput.classList.add("password-match");
                    confirmPasswordInput.classList.remove("password-mismatch");
                    confirmPasswordInput.classList.add("password-match");
                    tickIcon.style.display = "inline";
                } else {
                    // Passwords don't match: red border and background for both
                    passwordInput.classList.remove("password-match");
                    passwordInput.classList.add("password-mismatch");
                    confirmPasswordInput.classList.remove("password-match");
                    confirmPasswordInput.classList.add("password-mismatch");
                    tickIcon.style.display = "none";
                }
            }

            passwordInput.addEventListener("input", validatePasswords);
            confirmPasswordInput.addEventListener("input", validatePasswords);

            // Initial validation when page loads
            validatePasswords();
        </script>
    </body>
</html>