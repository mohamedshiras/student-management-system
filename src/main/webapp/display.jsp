<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="model.Student" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>All Students</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 40px; background-color: #f5f5f5; }
        .container { max-width: 1100px; margin: 0 auto; background: white; padding: 30px; border-radius: 8px; box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); }
        h1 { color: #333; text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { padding: 12px; text-align: left; border-bottom: 1px solid #ddd; }
        th { background-color: #4CAF50; color: white; }
        tr:hover { background-color: #f5f5f5; }
        .btn { padding: 6px 12px; border: none; border-radius: 4px; cursor: pointer; color: white; }
        .btn-delete { background-color: #f44336; }
        .btn-delete:hover { background-color: #d32f2f; }
        .nav-links { text-align: center; margin-top: 20px; }
        .nav-links a { margin: 0 10px; color: #2196F3; text-decoration: none; }
        .nav-links a:hover { text-decoration: underline; }
        .empty-message { text-align: center; color: #666; padding: 20px; }
    </style>
</head>
<body>
    <div class="container">
        <h1>All Students (MySQL Database)</h1>
        <% 
        @SuppressWarnings("unchecked")
        List<Student> students = (List<Student>) request.getAttribute("students");
        if (students != null && !students.isEmpty()) { 
        %>
            <table>
                <thead>
                    <tr>
                        <th>ID</th><th>Full Name</th><th>Address</th><th>Email</th><th>Contact</th><th>DOB</th><th>Department</th><th>Course</th><th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (Student student : students) { %>
                        <tr>
                            <td><%= student.getId() %></td>
                            <td><%= student.getFullName() %></td>
                            <td><%= student.getAddress() %></td>
                            <td><%= student.getEmail() %></td>
                            <td><%= student.getContact() %></td>
                            <td><%= student.getDob() %></td>
                            <td><%= student.getDepartment() %></td>
                            <td><%= student.getCourse() %></td>
                            <td>
                                <form action="delete-student" method="post" style="display: inline;">
                                    <input type="hidden" name="id" value="<%= student.getId() %>">
                                    <button type="submit" class="btn btn-delete" onclick="return confirm('Delete this student?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    <% } %>
                </tbody>
            </table>
        <% } else { %>
            <div class="empty-message"><p>No students found. Add some students to get started!</p></div>
        <% } %>
        <div class="nav-links">
            <a href="index.jsp">Add Student</a> | <a href="search.jsp">Search Student</a>
        </div>
    </div>
</body>
</html>
