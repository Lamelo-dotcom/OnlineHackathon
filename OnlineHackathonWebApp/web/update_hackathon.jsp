<%-- 
    Document   : update_hackathon
    Created on : Apr 8, 2025, 9:34:41 PM
    Author     : Shezi
--%>

<%@page import="ac.za.tut.entities.HackathonEvent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Hackathon - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/admin_styling.css">
        <style>
            .container{
                display: flex;
                flex-direction: column;
                margin: 20px auto;
                padding: 10px;
                border-radius: 30px;
                max-width: 650px;
                text-align: center;
                font-weight: bold;
                box-shadow: 0 0 10px rgba(255, 255, 255, 0.7);
                border: 2px solid black;
                font-family: Arial, sans-serif;
            }
            label {
                display: block;
                font-weight: bold;
            }
            input[type="text"],
            input[type="date"],
            textarea {
                width: 80%;
                padding: 10px;
                margin-bottom: 10px;
                border: 1px solid lightskyblue;
                border-radius: 5px;
                font-size: 16px;
            }
            @media (max-width: 600px) {
                .container {
                    width: 90%;
                    padding: 15px;
                }
            }
        </style>

        <%
            HackathonEvent hackathon = (HackathonEvent) session.getAttribute("hackathon");
        %>
    </head>

    <body>
        <aside class="sidebar">
            <div class="sidebar-header">
                <h2>Hackathon Admin</h2>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="admin_dashboard.jsp">Dashboard</a></li>
                    <li><a href="#">Manage Hackathons</a></li>
                    <li><a href="#">Participants</a></li>
                    <li><a href="#">Submissions</a></li>
                    <li><a href="#">Judging</a></li>
                    <li><a href="#">Settings</a></li>
                    <li><a href="LogoutServlet.do">Logout</a></li>

                </ul>
            </nav>
        </aside>
        <div class="main-content">
            <div class="top-bar">
                <div class="welcome-message">
                    <h1>Welcome, Sakhile Lusiba</h1>
                </div>
                <div class="notifications">
                    <button class="notification-button" onclick="toggleNotifications()">
                        <i class="fa fa-bell"></i>
                        <span class="notification-badge">3</span>
                    </button>

                    <div id="notification-panel" class="notification-panel">
                        <ul>
                            <li>New notification 1</li>
                            <li>New notification 2</li>
                            <li>New notification 3</li>
                        </ul>
                    </div>
                </div>
            </div>
            <main class="main_content">
                <div class="container">
                    <form action="UpdateHackathonServlet.do" method="post">
                        <!-- Hidden field to keep the hackathon ID -->
                        <input type="hidden" name="hackathonId" value="<%= hackathon.getId()%>">

                        <label for="hackathonName">Hackathon Name</label>
                        <input type="text" id="hackathonName" name="hackathonName" value="<%= hackathon.getName()%>" required>

                        <label for="description">Description</label>
                        <textarea id="description" name="description" rows="3" required><%= hackathon.getDescription()%></textarea>

                        <label for="regClosingDate">Registration Closing Date</label>
                        <input type="date" id="regClosingDate" name="regClosingDate" value="<%= hackathon.getRegistrationDeadline()%>" required>

                        <label for="startDate">Start Date</label>
                        <input type="date" id="startDate" name="startDate" value="<%= hackathon.getStartDate()%>" required>

                        <label for="endDate">End Date</label>
                        <input type="date" id="endDate" name="endDate" value="<%= hackathon.getEndDate()%>" required>

                        <label for="location">Location</label>
                        <input type="text" id="location" name="location" value="<%= hackathon.getLocation()%>" required>

                        <button type="submit" class="btn">Update Hackathon</button>
                    </form>
                </div>
            </main>
        </div>
    </body>
</html>
