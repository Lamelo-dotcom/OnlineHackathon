<%-- 
    Document   : confirm_withdrawal
    Created on : May 4, 2025, 11:02:55 PM
    Author     : Shezi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Confirm Withdrawal - Online Hackathon Platform</title>
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
            .warning-message {
                color: #d32f2f;
                font-weight: bold;
                margin-bottom: 20px;
            }
            .button-group {
                display: flex;
                justify-content: center;
                gap: 20px;
                margin-top: 20px;
            }
            .confirm-btn {
                background-color: #d32f2f;
                color: white;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
            .cancel-btn {
                background-color: #cccccc;
                color: black;
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
            }
        </style>
        <%
            String hackathonId = request.getParameter("hackathonId");
            if (hackathonId == null) {
                response.sendRedirect("participant_dashboard.jsp");
                return;
            }
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
                <h2>Confirm Withdrawal</h2>
                <p class="warning-message">Warning: Withdrawing from this hackathon will result in the loss of all associated activities, including submissions, team collaborations, and progress. This action cannot be undone.</p>
                <p>Are you sure you want to withdraw from this hackathon?</p>
                <div class="button-group">
                    <button class="confirm-btn" onclick="location.href='WithdrawHackathonServlet.do?hackathonId=<%=hackathonId%>'">Confirm Withdrawal</button>
                    <button class="cancel-btn" onclick="location.href='participant_dashboard.jsp'">Cancel</button>
                </div>
            </div>
        </main>
    </body>
</html>
