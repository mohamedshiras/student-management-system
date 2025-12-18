<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Student" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Search Student</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
        .container { max-width: 600px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #333; text-align: center; }
        .form-group { margin-bottom: 15px; }
        label { display: block; margin-bottom: 5px; font-weight: bold; }
        input[type="text"] { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 4px; box-sizing: border-box; }
        .btn { background-color: #2196F3; color: white; padding: 12px 20px; border: none; border-radius: 4px; cursor: pointer; }
        .btn:hover { background-color: #1976D2; }
        .result { margin-top: 20px; padding: 15px; border-radius: 4px; }
        .found { background-color: #d4edda; color: #155724; }
        .not-found { background-color: #f8d7da; color: #721c24; }
        .student-details { margin-top: 10px; }
        .student-details p { margin: 5px 0; }
        .nav-links { text-align: center; margin-top: 20px; }
        .nav-links a { margin: 0 10px; color: #2196F3; text-decoration: none; }
        .nav-links a:hover { text-decoration: underline; }
        .btn-delete { background-color: #f44336; color: white; padding: 8px 16px; border: none; border-radius: 4px; cursor: pointer; margin-top: 10px; }
        .btn-delete:hover { background-color: #d32f2f; }
    </style>
</head>
<body>
    <div class="container">
        <h1>Search Student</h1>
        <form action="search-student" method="post">
            <div class="form-group">
                <label for="searchId">Enter Student ID:</label>
                <input type="text" id="searchId" name="searchId" required>
            </div>
            <button type="submit" class="btn">Search</button>
        </form>
        <% 
        Student student = (Student) request.getAttribute("searchResult");
        if (student != null) { 
        %>
            <div class="result found">
                <h3>Student Found:</h3>
                <div class="student-details">
                    <p><strong>ID:</strong> <%= student.getId() %></p>
                    <p><strong>Full Name:</strong> <%= student.getFullName() %></p>
                    <p><strong>Address:</strong> <%= student.getAddress() %></p>
                    <p><strong>Email:</strong> <%= student.getEmail() %></p>
                    <p><strong>Contact:</strong> <%= student.getContact() %></p>
                    <p><strong>Date of Birth:</strong> <%= student.getDob() %></p>
                    <p><strong>Department:</strong> <%= student.getDepartment() %></p>
                    <p><strong>Course:</strong> <%= student.getCourse() %></p>
                </div>
                <form action="delete-student" method="post" style="display: inline;">
                    <input type="hidden" name="id" value="<%= student.getId() %>">
                    <button type="submit" class="btn btn-delete" onclick="return confirm('Delete this student?');">Delete Student</button>
                </form>
            </div>
        <% } else if (request.getParameter("searchId") != null) { %>
            <div class="result not-found">
                <p>No student found with ID: <%= request.getParameter("searchId") %></p>
            </div>
        <% } %>
        <div class="nav-links">
            <a href="index.jsp">Add Student</a> | <a href="display-students">View All Students</a>
        </div>
    </div>
</body>
</html>
