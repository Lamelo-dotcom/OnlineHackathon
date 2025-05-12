<%-- 
    Document   : user_management
    Created on : May 8, 2025, 4:02:31 AM
    Author     : Shezi
--%>

<%@page import="ac.za.tut.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entities.HackathonEvent"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Manage Users - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/admin_styling.css">
        <style>
        </style>
        <%
            Integer numOfMentors = (Integer) session.getAttribute("numOfMentors");
            Integer numOfPerticipants = (Integer) session.getAttribute("numOfPerticipants");
            Integer numOfSponsors = (Integer) session.getAttribute("numOfSponsors");
            Integer numOfUsers = (Integer) session.getAttribute("numOfUsers");
            List<User> users = (List<User>) session.getAttribute("users");
            List<User> participants = (List<User>) session.getAttribute("participants");
            List<User> mentors = (List<User>) session.getAttribute("mentors");
            List<User> sponsors = (List<User>) session.getAttribute("sponsors");
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
                    <li><a href="#">Manage Hackathons</a></li>
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

                <section class="manage-participants-report">
                    <h2>Manage Users</h2>
                    <a href="export_to_pdf.jsp" class="export-button"><button>Export To PDF</button></a>
                    <p>Total Registrations : <%=users.size()%></p>
                    <p>Total Participants : <%=participants.size()%></p>
                    <p>Total Mentors : <%=mentors.size()%></p>
                    <p>Total Sponsors : <%=sponsors.size()%></p>
                    
                </section>
                <section class="manage-participants">
                    <h2>Participants</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Date of Birth</th>
                                <th>Registration Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                if (participants != null) {

                                    for (User user : participants) {
                            %>
                            <tr>
                                <td><%=user.getFirstName()%></td>
                                <td><%=user.getLastName()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=user.getRole()%></td>
                                <td><%=user.getDob()%></td>
                                <td><%=user.getCreationDate()%></td>
                                <td><button>Remove</button></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </section>
                <section class="manage-participants">
                    <h2>Mentors</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Date of Birth</th>
                                <th>Registration Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                if (participants != null) {

                                    for (User user : mentors) {
                            %>
                            <tr>
                                <td><%=user.getFirstName()%></td>
                                <td><%=user.getLastName()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=user.getRole()%></td>
                                <td><%=user.getDob()%></td>
                                <td><%=user.getCreationDate()%></td>
                                <td><button>Remove</button></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </section>
                <section class="manage-participants">
                    <h2>Sponsors</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Surname</th>
                                <th>Email</th>
                                <th>Role</th>
                                <th>Date of Birth</th>
                                <th>Registration Date</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>

                            <%
                                if (participants != null) {

                                    for (User user : sponsors) {
                            %>
                            <tr>
                                <td><%=user.getFirstName()%></td>
                                <td><%=user.getLastName()%></td>
                                <td><%=user.getEmail()%></td>
                                <td><%=user.getRole()%></td>
                                <td><%=user.getDob()%></td>
                                <td><%=user.getCreationDate()%></td>
                                <td><button>Remove</button></td>
                            </tr>
                            <%
                                    }
                                }
                            %>
                        </tbody>
                    </table>
                </section>
            </main>
        </div>
    </body>
</html>

