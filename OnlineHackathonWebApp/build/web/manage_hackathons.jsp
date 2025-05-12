<%-- 
    Document   : admin_dashboard
    Created on : Mar 16, 2025, 4:02:53 PM
    Author     : Shezi
--%>

<%@page import="ac.za.tut.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entities.HackathonEvent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Admin Dashboard - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/admin_styling.css">
        <style>
        </style>
        <%
        List<HackathonEvent> hackathons = (List<HackathonEvent>) session.getAttribute("hackathons");
        %>
    </head>
    <body>
        <aside class="sidebar">
            <div class="sidebar-header">
                <h2>Hackathon Admin</h2>
            </div>
            <nav class="sidebar-nav">
                <ul>
                    <li><a href="AdminDataServlet.do">Dashboard</a></li>
                    <li><a href="ManageHacthonsServlet.do">Manage Hackathons</a></li>
                    <li><a href="ManageUsersServlet.do">Manage Users</a></li>
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

            <main class="main-content">
                <header>
                    <h1>Welcome to the Admin Dashboard</h1>
                </header>
                  
                <section class="manage-participants">
                    <h2>Manage Hackhathons</h2>
                    <a href="export_to_hackathon_participation_pdf.jsp"><button class="export-button">Export To PDF</button></a>
        <table>
            <tr>
                <th>Hackathon Name</th>
                <th>Start Date</th>
                <th>End Date</th>
                <th>Number of Participants</th>
                <th>Participant Name</th>
                <th>Participant Email</th>
                <th>Role</th>
                <th>Registration Date</th>
            </tr>
            <%
                if (hackathons != null) {
                    for (HackathonEvent event : hackathons) {
                        List<User> users = event.getUsers();
                        int participantCount = users != null ? users.size() : 0;
                        boolean firstRow = true;
                        if (users != null && !users.isEmpty()) {
                            for (User user : users) {
            %>
            <tr>
                <%
                    if (firstRow) {
                %>
                <td rowspan="<%= participantCount %>"><%= event.getName() != null ? event.getName() : "N/A" %></td>
                <td rowspan="<%= participantCount %>"><%= event.getStartDate() != null ? event.getStartDate() : "N/A" %></td>
                <td rowspan="<%= participantCount %>"><%= event.getEndDate() != null ? event.getEndDate() : "N/A" %></td>
                <td rowspan="<%= participantCount %>"><%= participantCount %></td>
                <%
                        firstRow = false;
                    }
                %>
                <td><%= user.getFirstName() != null ? user.getFirstName() + " " + (user.getLastName() != null ? user.getLastName() : "") : "N/A" %></td>
                <td><%= user.getEmail() != null ? user.getEmail() : "N/A" %></td>
                <td><%= user.getRole() != null ? user.getRole() : "N/A" %></td>
                <td><%= user.getCreationDate() != null ? user.getCreationDate() : "N/A" %></td>
            </tr>
            <%
                            }
                        } else {
            %>
            <tr>
                <td><%= event.getName() != null ? event.getName() : "N/A" %></td>
                <td><%= event.getStartDate() != null ? event.getStartDate() : "N/A" %></td>
                <td><%= event.getEndDate() != null ? event.getEndDate() : "N/A" %></td>
                <td>0</td>
                <td colspan="5">No participants</td>
            </tr>
            <%
                        }
                    }
                } else {
            %>
            <tr>
                <td colspan="9">No hackathons available</td>
            </tr>
            <%
                }
            %>
        </table>
                </section>
            </main>
        </div>
    </body>
  <script>
    }
</script>

</html>

