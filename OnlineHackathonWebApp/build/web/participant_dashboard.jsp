<%-- 
    Document   : participant_dashboard
    Created on : Mar 11, 2025, 9:09:31 PM
    Author     : Shezi
--%>

<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="ac.za.tut.entities.HackathonEvent"%>
<%@page import="java.util.List"%>
<%@page import="ac.za.tut.entities.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Participant Dashboard - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/participant_style.css">
        <style>
            button:disabled {
                background-color: #cccccc;
                cursor: not-allowed;
            }
            .button-group {
                margin-top: 10px;
            }

        </style>
        <%
            User user = (User) session.getAttribute("User");
            Integer numOfHackathons = (Integer) session.getAttribute("numOfHackathons");
            Integer numOfPerticipant = (Integer) session.getAttribute("numOfPerticipant");
            Integer numOfSubmission = (Integer) session.getAttribute("numOfSubmission");
            Integer numOfJudging = (Integer) session.getAttribute("numOfJudging");
            List<HackathonEvent> hackathons = (List<HackathonEvent>) session.getAttribute("hackathons");
            List<HackathonEvent> userHackathons = null;
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
                    <li><a href="ViewProfileServlet.do?userId=<%=user.getId()%>">Profile</a></li>
                    <li><a href="my_hackathon.jsp">My Hackathons</a></li>
                    <li><a href="view_submissions.jsp">Submissions</a></li>
                    <li><a href="view_leaderboard.jsp">Leaderboard</a></li>
                    <li><a href="settings.jsp">Settings</a></li>
                    <li><a href="LogoutServlet.do">Logout</a></li>
                </ul>
            </nav>
        </div>
        <main class="main-content">
            <header>
                <h1>Welcome, <%=user.getFirstName()%> <%=user.getLastName()%></h1>
            </header>

            <!-- Dashboard Overview -->
            <section class="dashboard-overview">
                <div class="stats-box">
                    <h3>Registered Hackathons</h3>
                    <p>3</p>
                </div>
                <div class="stats-box">
                    <h3>Pending Submissions</h3>
                    <p>1</p>
                </div>
                <div class="stats-box">
                    <h3>Accepted Submissions</h3>
                    <p>0</p>
                </div>
                <div class="stats-box">
                    <h3>Rank</h3>
                    <p>Not Ranked</p>
                </div>
            </section>

            <!-- My Hackathons Section -->
            <section class="my-hackathons">

                <h2>My Hackathons</h2>
                <div class="hackathon_grid">
                    <%
                        for (HackathonEvent hackathon : hackathons) {
                            boolean hasJoined = false;
                            userHackathons = user.getHackathons();
                            if (user != null && userHackathons != null) {
                                for (HackathonEvent userHackathon : userHackathons) {
                                    if (userHackathon.getId().equals(hackathon.getId())) {
                                        hasJoined = true;
                                        break;
                                    }
                                }
                            }
                    %>
                    <div class="hackathon_container">
                        <h4><%=hackathon.getName()%></h4>
                        <p><%=hackathon.getDescription()%> , <%=hackathon.getLocation()%></p>
                        <p>Closing date : <%=hackathon.getRegistrationDeadline()%></p>
                        <p>Start Date : <%=hackathon.getStartDate()%> , End Date : <%=hackathon.getEndDate()%></p>
                        <p>Status : <%=hackathon.getStatus()%></p>
                        <div class="button-group">
                            <button onclick="location.href = 'JoinHackathonServlet.do?hackathonId=<%=hackathon.getId()%>'" <%= hasJoined ? "disabled" : ""%>>JOIN</button>
                            <button onclick="location.href = 'confirm_withdrawal.jsp?hackathonId=<%=hackathon.getId()%>'" <%= hasJoined ? "" : "disabled"%>>WITHDRAW</button>
                        </div>
                        <div class="countdown" id="countdown-<%=hackathon.getId()%>">
                            Countdown: Loading...
                        </div>
                    </div>
                    <%
                        }
                    %>
                </div>

            </section>

            <!-- My Submissions Section -->
            <section class="my-submissions">
                <h2>My Submissions</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Submission Title</th>
                            <th>Hackathon</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>AI Chatbot</td>
                            <td>AI Innovation Hackathon</td>
                            <td>Pending</td>
                            <td><button>Update Submission</button> <button>Withdraw</button></td>
                        </tr>
                    </tbody>
                </table>
                <button onclick="location.href = 'submit-project.html'">Submit New Project</button>
            </section>

            <!-- Leaderboard Section -->
            <section class="leaderboard">
                <h2>Leaderboard</h2>
                <table>
                    <thead>
                        <tr>
                            <th>Rank</th>
                            <th>Team Name</th>
                            <th>Hackathon</th>
                            <th>Score</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>1</td>
                            <td>Tech Innovators</td>
                            <td>AI Innovation Hackathon</td>
                            <td>95%</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>Code Warriors</td>
                            <td>Web Development Hackathon</td>
                            <td>90%</td>
                        </tr>
                    </tbody>
                </table>
            </section>
        </main>
    </div>
    <script>
        function startCountdown(deadlineId, endDate) {
            const countdownElement = document.getElementById(`countdown-${deadlineId}`);
            if (!countdownElement) return;

            const countDownDate = new Date(endDate).getTime();

            const updateCountdown = setInterval(() => {
                const now = new Date().getTime();
                const distance = countDownDate - now;

                if (distance < 0) {
                    clearInterval(updateCountdown);
                    countdownElement.innerHTML = "Registration Closed";
                    return;
                }

                const days = Math.floor(distance / (1000 * 60 * 60 * 24));
                const hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
                const minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
                const seconds = Math.floor((distance % (1000 * 60)) / 1000);

                countdownElement.innerHTML = `Countdown: ${days}d ${hours}h ${minutes}m ${seconds}s`;
            }, 1000);
        }

        // Initialize countdowns using a JSON array from JSP
        <%
            if (hackathons != null && !hackathons.isEmpty()) {
                out.println("const countdowns = [");
                boolean first = true;
                // Try multiple date formats
                SimpleDateFormat[] dateFormats = {
                    new SimpleDateFormat("yyyy-MM-dd HH:mm:ss"),
                    new SimpleDateFormat("yyyy-MM-dd"),
                    new SimpleDateFormat("dd-MM-yyyy HH:mm:ss"),
                    new SimpleDateFormat("dd/MM/yyyy HH:mm:ss")
                };
                SimpleDateFormat outputFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                for (HackathonEvent hackathon : hackathons) {
                    if (hackathon.getRegistrationDeadline() != null) {
                        String rawDeadline = hackathon.getRegistrationDeadline();
                        java.util.Date deadlineDate = null;
                        // Debug: Log the raw deadline
                        out.println("// Debug: rawDeadline for hackathon " + hackathon.getId() + " = '" + rawDeadline + "'");
                        // Try parsing with each format
                        for (SimpleDateFormat sdf : dateFormats) {
                            try {
                                deadlineDate = sdf.parse(rawDeadline);
                                break;
                            } catch (ParseException e) {
                                // Continue to the next format
                            }
                        }
                        if (deadlineDate != null) {
                            // Successfully parsed, format for JavaScript
                            String deadline = outputFormat.format(deadlineDate);
                            if (!first) out.println(",");
                            out.println("{ id: " + hackathon.getId() + ", deadline: \"" + deadline.replace("\"", "\\\"") + "\" }");
                            first = false;
                        } else {
                            // Log error and set a fallback message
                            out.println("// Error: Unable to parse date for hackathon " + hackathon.getId());
                            out.println("document.getElementById('countdown-" + hackathon.getId() + "').innerHTML = 'Invalid Deadline';");
                        }
                    }
                }
                out.println("];");
                out.println("countdowns.forEach(item => startCountdown(item.id, item.deadline));");
            }
        %>
    </script>
</body>
</html>
