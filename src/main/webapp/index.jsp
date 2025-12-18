<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="UTF-8">
        <title>Student Management System</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 40px;
                background-color: #f5f5f5;
            }

            .container {
                max-width: 600px;
                margin: 0 auto;
                background: white;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            }

            h1 {
                color: #333;
                text-align: center;
            }

            .form-group {
                margin-bottom: 15px;
            }

            label {
                display: block;
                margin-bottom: 5px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="number"] {
                width: 100%;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                box-sizing: border-box;
            }

            .btn {
                background-color: #4CAF50;
                color: white;
                padding: 12px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-right: 10px;
            }

            .btn:hover {
                background-color: #45a049;
            }

            .btn-primary {
                background-color: #2196F3;
            }

            .btn-primary:hover {
                background-color: #1976D2;
            }

            .nav-links {
                text-align: center;
                margin-top: 20px;
            }

            .nav-links a {
                margin: 0 10px;
                color: #2196F3;
                text-decoration: none;
            }

            .nav-links a:hover {
                text-decoration: underline;
            }

            .message {
                padding: 10px;
                margin-bottom: 15px;
                border-radius: 4px;
            }

            .success {
                background-color: #d4edda;
                color: #155724;
            }

            .error {
                background-color: #f8d7da;
                color: #721c24;
            }
        </style>
    </head>

    <body>
        <div class="container">
            <h1>Student Management System</h1>

            <% String message=(String) request.getAttribute("message"); %>
                <% if (message !=null) { %>
                    <div class="message success">
                        <%= message %>
                    </div>
                    <% } %>

                        <% String error=(String) request.getAttribute("error"); %>
                            <% if (error !=null) { %>
                                <div class="message error">
                                    <%= error %>
                                </div>
                                <% } %>

                                    <h2>Add New Student</h2>
                                    <form action="add-student" method="post">
                                        <div class="form-group">
                                            <label for="fullName">Full Name:</label>
                                            <input type="text" id="fullName" name="fullName" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Address:</label>
                                            <input type="text" id="address" name="address" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Email:</label>
                                            <input type="text" id="email" name="email" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="contact">Contact:</label>
                                            <input type="text" id="contact" name="contact" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="dob">Date of Birth:</label>
                                            <input type="text" id="dob" name="dob" placeholder="YYYY-MM-DD" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="department">Department:</label>
                                            <select id="department" name="department" required
                                                style="width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box;">
                                                <option value="">-- Select Department --</option>
                                                <option value="School of Computing">School of Computing</option>
                                                <option value="School of Business">School of Business</option>
                                                <option value="School of Language">School of Language</option>
                                            </select>
                                        </div>
                                        <div class="form-group">
                                            <label for="course">Course:</label>
                                            <input type="text" id="course" name="course" required>
                                        </div>
                                        <button type="submit" class="btn">Add Student</button>
                                    </form>

                                    <div class="nav-links">
                                        <a href="search.jsp">Search Student</a> |
                                        <a href="display-students">View All Students</a>
                                    </div>
        </div>
    </body>

    </html>