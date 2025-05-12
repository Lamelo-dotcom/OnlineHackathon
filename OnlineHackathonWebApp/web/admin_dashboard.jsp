<%-- 
    Document   : admin_dashboard
    Created on : Mar 16, 2025, 4:02:53 PM
    Author     : Shezi
--%>

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
           Integer numOfHackathons = (Integer)session.getAttribute("numOfHackathons");
           Integer numOfPerticipant = (Integer)session.getAttribute("numOfPerticipant");
           Integer numOfSubmission = (Integer)session.getAttribute("numOfSubmission");
           Integer numOfJudging = (Integer)session.getAttribute("numOfJudging");
           List<HackathonEvent> hackathons = (List<HackathonEvent>)session.getAttribute("hackathons");
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

                <section class="dashboard-overview">
                    <div class="stats-box">
                        <h3>Total Hackathons</h3>
                        <p><%=numOfHackathons%></p>
                    </div>
                    <div class="stats-box">
                        <h3>Total Participants</h3>
                        <p><%=numOfPerticipant%></p>
                    </div>
                    <div class="stats-box">
                        <h3>Total Submissions</h3>
                        <p><%=numOfSubmission%></p>
                    </div>
                    <div class="stats-box">
                        <h3>Pending Judging</h3>
                        <p><%=numOfJudging%></p>
                    </div>
                </section>

                <section class="manage-hackathons">
                    <h2>Manage Hackathons</h2>
                    <button onclick="location.href = 'create_hackathon.html'">Create New Hackathon</button>
                   <div class="hackathon_grid">
                   <%
                   for (HackathonEvent hackathon : hackathons) {
                   %>
                    <div class="hackathon_container">
                        <h4><%=hackathon.getName()%></h4>
                        <p><%=hackathon.getDescription()%> , <%=hackathon.getLocation()%></p>
                        <p>Closing date : <%=hackathon.getRegistrationDeadline()%></p>
                        <p>Start Date : <%=hackathon.getStartDate()%> , End Date : <%=hackathon.getEndDate()%></p>
                        <button onclick="location.href='GetHackathonServlet.do?hackathonId=<%=hackathon.getId()%>'">Edit</button>
                        <button onclick="location.href='DeleteHackathon.do?hackathonId=<%=hackathon.getId()%>'">Delete</button>
                    </div>
                    <%
                        }
                    %>
                   </div>
                  
                </section>

                <!-- Participant Management -->
                <section class="manage-participants">
                    <h2>Manage Participants</h2>
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Hackathon</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>John Doe</td>
                                <td>johndoe@email.com</td>
                                <td>AI Innovation Hackathon</td>
                                <td>Registered</td>
                                <td><button>View</button> <button>Remove</button></td>
                            </tr>
                            <tr>
                                <td>Jane Smith</td>
                                <td>janesmith@email.com</td>
                                <td>Web Development Hackathon</td>
                                <td>Pending</td>
                                <td><button>View</button> <button>Remove</button></td>
                            </tr>
                        </tbody>
                    </table>
                </section>

                <!-- Submissions Management -->
                <section class="manage-submissions">
                    <h2>Manage Submissions</h2>
                    <button onclick="location.href = 'view-submissions.html'">View All Submissions</button>
                    <table>
                        <thead>
                            <tr>
                                <th>Submission Title</th>
                                <th>Participant</th>
                                <th>Hackathon</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>AI Chatbot</td>
                                <td>John Doe</td>
                                <td>AI Innovation Hackathon</td>
                                <td>Submitted</td>
                                <td><button>View</button> <button>Approve</button> <button>Reject</button></td>
                            </tr>
                            <tr>
                                <td>Responsive Portfolio</td>
                                <td>Jane Smith</td>
                                <td>Web Development Hackathon</td>
                                <td>Under Review</td>
                                <td><button>View</button> <button>Approve</button> <button>Reject</button></td>
                            </tr>
                        </tbody>
                    </table>
                </section>

            </main>
        </div>
    </body>
  <script>
    function deleteHackathon(id, buttonElement) {
        // Send AJAX request to delete from server
        fetch('DeleteHackathon.do?id=' + id, {
            method: 'GET'
        })
        .then(response => {
            if (response.ok) {
                // Remove the parent container div from UI
                const hackathonDiv = buttonElement.closest('.hackathon_container');
                if (hackathonDiv) {
                    hackathonDiv.remove();
                }
            } else {
                alert("Failed to delete hackathon.");
            }
        })
        .catch(error => {
            console.error('Error:', error);
            alert("An error occurred while deleting.");
        });
    }
</script>

</html>

