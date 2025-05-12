<%-- 
    Document   : mentor_dashboard
    Created on : May 8, 2025, 12:19:29 AM
    Author     : Shezi
--%>

<%@page import="ac.za.tut.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html>
    <head>
        <title>Mentor Dashboard - Online Hackathon Platform</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/mentor_style.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("User");
            if (user == null || !"Mentor".equals(user.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }
        %>
        <aside class="sidebar">
            <div class="sidebar-header">
                <h2>Mentor Hub</h2>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="mentor_dashboard.jsp" class="active">Dashboard</a></li>
                    <li><a href="mentee_progress.jsp">Mentee Progress</a></li>
                    <li><a href="provide_feedback.jsp">Provide Feedback</a></li>
                    <li><a href="settings.jsp">Settings</a></li>
                    <li><a href="LogoutServlet.do" onclick="return confirm('Are you sure you want to log out?')">Logout</a></li>
                </ul>
            </nav>
        </aside>
        <div class="main-content">
            <div class="top-bar">
                <div class="welcome-message">
                    <h1>Welcome, <%=user.getFirstName()%></h1>
                </div>
                <div class="notifications">
                    <button class="notification-button" onclick="toggleNotifications()">
                        <i class="fa fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </button>
                    <div id="notification-panel" class="notification-panel">
                        <ul>
                            <li>New submission from Team A</li>
                            <li>Feedback requested for Hackathon X</li>
                            <li>Mentee progress update</li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="dashboard-cards">
                <div class="card">
                    <h3>Manage Hackathons</h3>
                    <p>View and oversee your assigned hackathons.</p>
                    <a href="manage_hackathons.jsp">Go to Hackathons</a>
                </div>
                <div class="card">
                    <h3>Monitor Mentees</h3>
                    <p>Track participant progress and activity.</p>
                    <a href="mentee_progress.jsp">View Progress</a>
                </div>
                <div class="card">
                    <h3>Provide Feedback</h3>
                    <p>Submit feedback for participant submissions.</p>
                    <a href="provide_feedback.jsp">Give Feedback</a>
                </div>
                <div class="card">
                    <h3>Upcoming Deadlines</h3>
                    <p>Check deadlines for your hackathons.</p>
                    <p>Next: Hackathon Y - May 15, 2025</p>
                    <a href="deadlines.jsp">View All</a>
                </div>
            </div>
        </div>
    </body>
    <script>
        function toggleNotifications() {
            var panel = document.getElementById("notification-panel");
            panel.style.display = (panel.style.display === "block") ? "none" : "block";
        }
    </script>
</html>