<%-- 
    Document   : confirm_hackathon
    Created on : May 4, 2025, 12:29:24 PM
    Author     : Shezi
--%>

<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="ac.za.tut.entities.HackathonEvent"%>
<%@page import="ac.za.tut.entities.User"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Join Confirmation - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/participant_style.css">
        <style>
            .confirmation-container {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background: white;
                border-radius: 8px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            .success-message {
                color: #2e7d32;
                font-weight: bold;
                margin-bottom: 20px;
            }
            .info-message {
                color: #424242;
                margin-bottom: 20px;
            }
            .button-group {
                margin-top: 20px;
            }
            .back-btn {
                background-color: #1976d2;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                text-decoration: none;
            }
        </style>
        <%
            User user = (User) session.getAttribute("User");
            if (user == null) {
                response.sendRedirect("login.jsp");
                return;
            }
            String hackathonIdStr = request.getParameter("hackathonId");
            HackathonEvent joinedHackathon = null;
            if (hackathonIdStr != null) {
                Long hackathonId = Long.parseLong(hackathonIdStr);
                List<HackathonEvent> hackathons = (List<HackathonEvent>) session.getAttribute("hackathons");
                if (hackathons != null) {
                    for (HackathonEvent he : hackathons) {
                        if (he.getId().equals(hackathonId)) {
                            joinedHackathon = he;
                            break;
                        }
                    }
                }
            }
            if (joinedHackathon == null) {
                response.sendRedirect("participant_dashboard.jsp");
                return;
            }
            String contextPath = request.getContextPath();
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
                    <li><a href="participant_dashboard.jsp">Home</a></li>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="my_hackathon.jsp">My Hackathons</a></li>
                    <li><a href="view_submissions.jsp">Submissions</a></li>
                    <li><a href="view_leaderboard.jsp">Leaderboard</a></li>
                    <li><a href="settings.jsp">Settings</a></li>
                    <li><a href="LogoutServlet.do">Logout</a></li>
                </ul>
            </nav>
        </div>
        <main class="main-content">
            <div class="confirmation-container">
                <h2>Join Confirmation</h2>
                <p class="success-message">Success! You have joined the hackathon: <%=joinedHackathon.getName() != null ? joinedHackathon.getName() : "Unnamed Hackathon"%>.</p>
                <p class="info-message">You can exit this hackathon anytime by selecting the 'WITHDRAW' option on the dashboard. Any associated activities, submissions, or progress will be lost upon withdrawal.</p>
                <div class="button-group">
                    <a href="ParticipantDataServlet.do" class="back-btn">Back to Dashboard</a>
                </div>
            </div>
        </main>
    </body>
</html>
