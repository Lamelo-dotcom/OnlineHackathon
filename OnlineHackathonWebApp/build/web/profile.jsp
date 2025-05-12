<%-- 
    Document   : profile
    Created on : Mar 26, 2025, 7:01:12 PM
    Author     : Shezi
--%>

<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entities.ProfilePicture"%>
<%@page import="java.util.Base64"%>
<%@page import="ac.za.tut.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/participant_style.css">
        <style>
            .main-content {
                align-content: center;
                padding: 30px;
                background-color: #f4f7fa;
                min-height: 100vh;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }
            .profile-header img {
                width: 100px;
                height: 100px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 15px;
                border: 2px solid #21ced7;
            }
            .profile-header {
                text-align: center;
                margin-bottom: 20px;
            }
            .profile-container {
                max-width: 600px;
                margin: 20px auto;
                padding: 25px;
                background-color: #ffffff;
                border-radius: 12px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.7);
                border: 1px solid #e0e0e0;
            }
            .profile-container h2 {
                font-size: 22px;
                color: #333333;
                margin-top: 0;
                margin-bottom: 20px;
                text-align: center;
            }
            .profile-container form {
                display: flex;
                flex-direction: column;
                gap: 15px;
            }
            .profile-container label {
                font-size: 15px;
                font-weight: bold;
                color: #333333;
                text-align: left;
            }
            .profile-container input[type="text"],
            .profile-container input[type="email"],
            .profile-container input[type="file"]{
                width: 100%;
                padding: 10px;
                border: 1px solid #cccccc;
                border-radius: 6px;
                font-size: 15px;
                box-sizing: border-box;
                transition: border-color 0.3s ease;
            }
            .profile-container input[type="text"]:focus,
            .profile-container input[type="email"]:focus,
            .profile-container input[type="file"]{
                border-color: #21ced7;
                outline: none;
                box-shadow: 0 0 5px rgba(33, 206, 215, 0.3);
            }
            .profile-container .save-btn {
                padding: 12px;
                font-size: 16px;
                background-color: #21ced7;
                color: white;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                transition: all 0.3s ease;
                align-self: flex-end;
            }
            .profile-container .save-btn:hover {
                background-color: #1abac2;
                box-shadow: 0 0 10px rgba(33, 206, 215, 0.6);
                transform: scale(1.02);
            }
            .profile-info {
                margin-bottom: 20px;
                padding: 15px;
                background-color: #f9f9f9;
                border-radius: 6px;
                border: 1px solid #e0e0e0;
            }
            .profile-info p {
                margin: 5px 0;
                font-size: 14px;
                color: #555555;
            }

            @media (max-width: 768px) {
                .main-content {
                    margin-left: 0;
                    padding: 20px;
                }
                .profile-container {
                    width: 100%;
                    padding: 20px;
                }
                .profile-container .save-btn {
                    width: 100%;
                }
            }
        </style>
        <%
            User user = (User) session.getAttribute("User");
            String image_source = "image/images.png";
            
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            List<ProfilePicture> pictures = user.getProfilePictures();
            if (pictures != null && !pictures.isEmpty()) {
                ProfilePicture latestPicture = pictures.get(pictures.size() - 1);
                image_source = "data:image/png;base64," 
                    + Base64.getEncoder().encodeToString(latestPicture.getImageByte());
            }
        %>
    </head>
    <body>
        <div class="header">
            <div class="logo">
                <img src="image/istockphoto-1216719274-612x612.jpg" alt="Platform Logo">
                <h1>Online Hosting Hackathon Platform</h1>
            </div>
            <nav class="nav_links" aria-label="Main navigation">
                <ul>
                    <li><a href="participant_dashboard.jsp">Home</a></li>
                    <li><a href="ViewProfileServlet.do" class="active" aria-current="page">Profile</a></li>
                    <li><a href="my_hackathon.jsp">My Hackathons</a></li>
                    <li><a href="view_submissions.jsp">Submissions</a></li>
                    <li><a href="view_leaderboard.jsp">Leaderboard</a></li>
                    <li><a href="settings.jsp">Settings</a></li>
                    <li><a href="LogoutServlet.do" onclick="return confirm('Are you sure you want to log out?')" 
                           aria-label="Log out of the platform">Logout</a></li>
                </ul>
            </nav>
        </div>
        <main class="main-content">
            <section class="profile-container">
                <form class="profile-form" action="SaveProfileServlet.do" method="POST" enctype="multipart/form-data">
                    <div class="profile-header">
                        <h1>Your Profile</h1>
                        <img src="<%= image_source %>" alt="Profile Picture"/>
                        <p>Manage your personal information and view your hackathon history.</p>
                    </div>

                    <label for="profilePicture">Profile Picture</label>
                    <input type="file" id="profilePicture" name="profilePicture" accept="image/*" aria-describedby="profile-picture-desc">
                    <p id="profile-picture-desc" class="sr-only">Upload a new profile picture (optional).</p>

                    <label for="firstName">First Name</label>
                    <input type="text" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required aria-required="true">

                    <label for="lastName">Last Name</label>
                    <input type="text" id="lastName" name="lastName" value="<%= user.getLastName() %>" required aria-required="true">

                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" value="<%= user.getEmail() %>" required aria-required="true">

                    <label for="bio">Bio</label>
                    <textarea id="bio" name="bio" aria-describedby="bio-desc"><%= user.getBio() != null ? user.getBio() : "" %></textarea>
                    <p id="bio-desc" class="sr-only">A short description about yourself (optional).</p>

                    <button type="submit" class="save-btn" aria-label="Save profile changes">Save Changes</button>
                </form>

                <!-- Hardcoded Hackathon History -->
                <section class="hackathon-history">
                    <h2>Your Hackathon History</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Hackathon Name</th>
                                <th>Start Date</th>
                                <th>Status</th>
                                <th>Role</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>AI Innovation Hackathon</td>
                                <td>Jan 15, 2025</td>
                                <td>Completed</td>
                                <td>Participant</td>
                            </tr>
                            <tr>
                                <td>Web Development Challenge</td>
                                <td>Mar 20, 2025</td>
                                <td>In Progress</td>
                                <td>Participant</td>
                            </tr>
                        </tbody>
                    </table>
                </section>
            </section>
        </main>
    </body>
</html>