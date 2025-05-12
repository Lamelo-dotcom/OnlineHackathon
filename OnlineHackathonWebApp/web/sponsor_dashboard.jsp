<%@page import="ac.za.tut.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entities.HackathonEvent"%>
<html>
    <head>
        <title>Sponsor Dashboard - Online Hackathon Platform</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="css/sponsor_style.css">
    </head>
    <body>
        <%
            User user = (User) session.getAttribute("User");
            if (user == null || !"Sponsor".equals(user.getRole())) {
                response.sendRedirect("login.jsp");
                return;
            }
            String contextPath = request.getContextPath();
            List<HackathonEvent> hackathons = (List<HackathonEvent>) session.getAttribute("hackathons");
        %>
        <div class="layout-wrapper">
            <aside class="sidebar">
                <div class="sidebar-header">
                    <h2>Sponsor Portal</h2>
                </div>
                <nav class="sidebar-nav">
                    <ul>
                        <li><a href="sponsor_dashboard.jsp" class="active">Dashboard</a></li>
                        <li><a href="sponsored_hackathons.jsp">Sponsored Hackathons</a></li>
                        <li><a href="participant_stats.jsp">Participant Stats</a></li>
                        <li><a href="contributions.jsp">Contributions</a></li>
                        <li><a href="settings.jsp">Settings</a></li>
                        <li><a href="LogoutServlet.do" onclick="return confirm('Are you sure you want to log out?')">Logout</a></li>
                    </ul>
                </nav>
            </aside>
            <div class="main-content">
                <div class="top-bar">
                    <div class="welcome-message">
                        <h1>Welcome, <%=user.getFirstName() != null ? user.getFirstName() : "Sponsor"%></h1>
                    </div>
                    <div class="notifications">
                        <button class="notification-button" onclick="toggleNotifications()">
                            <span class="notification-icon">?</span>
                            <span class="notification-badge">2</span>
                        </button>
                        <div id="notification-panel" class="notification-panel">
                            <ul>
                                <li>New participant in Hackathon Z</li>
                                <li>Contribution update for Hackathon Y</li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="dashboard-cards">
                    <div class="card">
                        <h3>Sponsored Hackathons</h3>
                        <p>View and manage your sponsored events.</p>
                        <a href="sponsored_hackathons.jsp">Go to Hackathons</a>
                    </div>
                    <div class="card">
                        <h3>Participant Stats</h3>
                        <p>Analyze participant engagement and progress.</p>
                        <a href="participant_stats.jsp">View Stats</a>
                    </div>
                    <div class="card">
                        <h3>Contributions</h3>
                        <p>Track your sponsorship contributions.</p>
                        <a href="contributions.jsp">Manage Contributions</a>
                    </div>
                    <div class="card">
                        <h3>Upcoming Events</h3>
                        <p>Check upcoming sponsored hackathons.</p>
                        <p>Next: Hackathon Z - May 20, 2025</p>
                        <a href="upcoming_events.jsp">View All</a>
                    </div>
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