<%-- 
    Document   : settings
    Created on : Mar 26, 2025, 7:04:09 PM
    Author     : Shezi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Settings - Online Hackathon Platform</title>
        <link rel="stylesheet" href="css/main.css">
        <link rel="stylesheet" href="css/participant_style.css">
        <style>
         .main-content {
            align-content: center;
            padding: 30px;
            background-color: #f4f7fa;
            min-height: 100vh;
            font-family: Arial, sans-serif;
        }

        .settings-container {
            max-width: 600px;
            margin: 20px auto;
            padding: 25px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border: 1px solid #e0e0e0;
        }

        .settings-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .settings-header h1 {
            font-size: 22px;
            color: #333333;
            margin-bottom: 10px;
        }

        .settings-header p {
            font-size: 14px;
            color: #555555;
        }

        .settings-form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        .settings-form h2 {
            font-size: 18px;
            color: #333333;
            margin-top: 20px;
            margin-bottom: 10px;
        }

        .settings-form label {
            font-size: 15px;
            color: #333333;
            display: flex;
            align-items: center;
            gap: 10px;
        }

        .settings-form input[type="checkbox"] {
            width: 18px;
            height: 18px;
            accent-color: #21ced7;
        }

        .settings-form input[type="password"],
        .settings-form select {
            width: 100%;
            padding: 10px;
            border: 1px solid #cccccc;
            border-radius: 6px;
            font-size: 15px;
            box-sizing: border-box;
            transition: border-color 0.3s ease;
        }

        .settings-form input[type="password"]:focus,
        .settings-form select:focus {
            border-color: #21ced7;
            outline: none;
            box-shadow: 0 0 5px rgba(33, 206, 215, 0.3);
        }

        .settings-form input[type="password"][readonly] {
            background-color: #f9f9f9;
            cursor: not-allowed;
        }

        .settings-form select {
            appearance: none;
            background-image: url('data:image/svg+xml;utf8,<svg xmlns="http://www.w3.org/2000/svg" width="12" height="12" viewBox="0 0 24 24"><path fill="%23555555" d="M7 10l5 5 5-5z"/></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
            background-size: 12px;
        }

        .settings-form .save-btn {
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

        .settings-form .save-btn:hover {
            background-color: #1abac2;
            box-shadow: 0 0 10px rgba(33, 206, 215, 0.6);
            transform: scale(1.02);
        }

        .password-change {
            margin-top: 30px;
            padding: 15px;
            background-color: #f9f9f9;
            border-radius: 6px;
            border: 1px solid #e0e0e0;
        }

        .password-change h2 {
            font-size: 18px;
            color: #333333;
            margin-bottom: 10px;
        }

        .password-change p {
            font-size: 14px;
            color: #555555;
            margin-bottom: 15px;
        }

        .password-change button {
            padding: 10px 20px;
            font-size: 15px;
            background-color: #21ced7;
            color: white;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .password-change button:hover {
            background-color: #1abac2;
            box-shadow: 0 0 10px rgba(33, 206, 215, 0.6);
        }

        .message {
            margin-top: 20px;
            font-size: 14px;
            color: #21ced7;
            text-align: center;
        }

        .sr-only {
            position: absolute;
            width: 1px;
            height: 1px;
            padding: 0;
            margin: -1px;
            overflow: hidden;
            clip: rect(0, 0, 0, 0);
            border: 0;
        }

        @media (max-width: 768px) {
            .main-content {
                margin-left: 0;
                padding: 20px;
                margin-top: 120px;
            }

            .header {
                flex-direction: column;
                align-items: flex-start;
                padding: 10px 20px;
            }

            .nav_links ul {
                flex-direction: column;
                gap: 10px;
                margin-top: 10px;
            }

            .settings-container {
                width: 100%;
                padding: 20px;
            }

            .settings-form .save-btn {
                width: 100%;
            }
        }
        </style>
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
                    <li><a href="ViewProfileServlet.do">Profile</a></li>
                    <li><a href="my_hackathon.jsp">My Hackathons</a></li>
                    <li><a href="view_submissions.jsp">Submissions</a></li>
                    <li><a href="view_leaderboard.jsp">Leaderboard</a></li>
                    <li><a href="settings.jsp" class="active" aria-current="page">Settings</a></li>
                    <li><a href="LogoutServlet.do" onclick="return confirm('Are you sure you want to log out?')" 
                           aria-label="Log out of the platform">Logout</a></li>
                </ul>
            </nav>
        </div>
        <main class="main-content">
            <section class="settings-container">
                <header class="settings-header">
                    <h1>Settings</h1>
                    <p>Configure your account preferences and security options.</p>
                </header>

                <!-- Hardcoded Settings Form -->
                <form class="settings-form" method="POST">
                    <h2>Notification Preferences</h2>
                    <label>
                        <input type="checkbox" name="notifications" checked aria-label="Enable email notifications">
                        Enable Email Notifications
                    </label>
                    <label>
                        <input type="checkbox" name="updates" aria-label="Enable update alerts">
                        Enable Update Alerts
                    </label>

                    <h2>Theme Preferences</h2>
                    <label for="theme">Select Theme</label>
                    <select id="theme" name="theme">
                        <option value="light">Light Theme</option>
                        <option value="dark" selected>Dark Theme</option>
                    </select>

                    <h2>Account Security</h2>
                    <label for="currentPassword">Current Password</label>
                    <input type="password" id="currentPassword" name="currentPassword" value="********" readonly>

                    <label for="newPassword">New Password</label>
                    <input type="password" id="newPassword" name="newPassword" value="">

                    <label for="confirmPassword">Confirm New Password</label>
                    <input type="password" id="confirmPassword" name="confirmPassword" value="">

                    <button type="submit" aria-label="Save settings changes">Save Changes</button>
                </form>

                <!-- Hardcoded Password Change Section -->
                <div class="password-change">
                    <h2>Change Password</h2>
                    <p>Update your password for enhanced security.</p>
                    <button type="button" onclick="alert('Password change feature is hardcoded and not functional.')" 
                            aria-label="Initiate password change">Change Password</button>
                </div>

                <!-- Hardcoded Message -->
                <p class="message">Settings saved successfully!</p>
            </section>
        </main>
    </body>
</html>
