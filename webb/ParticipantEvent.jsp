<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Balsamiq+Sans&display=swap">
    <link rel="stylesheet" href="total.css">
    <style>
        body {
            padding-top: 56px;
            /* Adjusted to accommodate fixed-top navbar */
            font-family: 'Balsamiq Sans', cursive;
            background-color: #f8f9fa;
            /* Bootstrap background color */
            color: #343a40;
            /* Bootstrap dark text color */
        }

        #common {
            margin-top: 20px;
            font-size: 30px;
            color: #007bff;
            /* Bootstrap primary color */
        }

        h2 {
            text-align: center;
            margin-top: 20px;
        }

        h3 {
            color: #007bff;
            /* Bootstrap primary color */
            margin-bottom: 20px;
        }

        button {
            padding: 8px 12px;
            /* Adjusted padding for a smaller button */
            border-radius: 8px;
            /* Increased border radius */
            cursor: pointer;
        }

        .container {
            text-align: center;
        }

        #upcomingEvents {
            margin-top: 50px;
        }

        #upcomingEvents table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        #upcomingEvents th,
        #upcomingEvents td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        #upcomingEvents th {
            background-color: #007bff;
            /* Bootstrap primary color */
            color: #fff;
        }

        #upcomingEvents button {
            padding: 8px 12px;
            /* Adjusted padding for a smaller button */
            border-radius: 8px;
            /* Increased border radius */
            cursor: pointer;
        }

        #upcomingEvents button:hover {
            background-color: #0056b3;
        }

        .navbar-brand {
            font-size: 24px;
        }

        .text-center {
            padding-top: 15px;
        }

        .col-md-6 {
            margin-top: 20px;
        }

        .navbar-toggler {
            padding: 0.25rem 0.75rem;
        }
    </style>
    <title>Page For Event Registration</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<body>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="#">Event Portal</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse"
                aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarCollapse">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="Parlogin.html">Home</a>
                    </li>
                </ul>
     
                <a href="Plogin.html"><button class="btn btn-sm btn-danger">Logout</button></a>
            </div>
        </div>
    </nav>
    <div class="text-center">
        <img src="images/reg.jpg" alt="Participants Image" width="200" height="100">
        <h2 id="common">Welcome Participants!</h2>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <h3>View Events</h3>
                <a href="ViewEvent1"><button type="button" class="btn btn-primary">View Events</button></a>
            </div>
            <div class="col-md-6">
                <h3>Register For Event</h3>
                <a href="Registration.html"><button type="button" class="btn btn-success">Register For Event</button></a>
            </div>
        </div>
    </div>
    <!-- Upcoming Events Table -->
    <div id="upcomingEvents" class="container">
        <h3>Upcoming Events</h3>
        <table>
            <tr>
                <th>EventID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Date and Time</th>
                <th>Location</th>
                <th>Duration</th>
                <th>Organizer</th>
                <th>Register</th>
            </tr>
            <!-- Fetch and display upcoming events from the database -->
            <%@ page import="java.sql.*" %>
            <%@ page import="java.io.*" %>
            <%@ page import="java.util.*" %>
            <%@ page import="java.text.*" %>

            <%
                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.cj.jdbc.Driver");

                    // Connection URL for MySQL
                    String conURL = "jdbc:mysql://your_database_url:3306/ASTU_StudentUnionDB";

                    // MySQL username and password
                    String user = "root";
                    String pass = "Fahmi@12345";

                    Connection con = DriverManager.getConnection(conURL, user, pass);

                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT e.EventID, e.Title, e.Description, e.DateAndTime, e.Location, e.Duration, c.Name AS Organizer FROM Events e INNER JOIN Clubs c ON e.Organizer = c.ClubID");

                    while (rs.next()) {
                        int eventId = rs.getInt("EventID");
                        String title = rs.getString("Title");
                        String description = rs.getString("Description");
                        Timestamp dateTime = rs.getTimestamp("DateAndTime");
                        String location = rs.getString("Location");
                        int duration = rs.getInt("Duration");
                        String organizer = rs.getString("Organizer");

                        // Render table row with data
                        out.println("<tr>");
                        out.println("<td>" + eventId + "</td>");
                        out.println("<td>" + title + "</td>");
                        out.println("<td>" + description + "</td>");
                        out.println("<td>" + dateTime + "</td>");
                        out.println("<td>" + location + "</td>");
                        out.println("<td>" + duration + "</td>");
                        out.println("<td>" + organizer + "</td>");
                        out.println("<td><button onclick=\"redirectToEventRegistration(" + eventId + ", '" + title + "')\">Register</button></td>");
                        out.println("</tr>");
                    }

                    con.close();
                } catch (Exception exe) {
                    System.out.println("Exception caught" + exe);
                }
            %>
        </table>
    </div>
    <!-- Bootstrap JS and dependencies -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>
