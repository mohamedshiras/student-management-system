package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.StudentDAO;
import java.io.IOException;

@WebServlet("/add-student")
public class AddStudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String address = req.getParameter("address");
        String email = req.getParameter("email");
        String contact = req.getParameter("contact");
        String dob = req.getParameter("dob");
        String department = req.getParameter("department");
        String course = req.getParameter("course");

        // Add to MySQL database
        studentDAO.addStudent(fullName, address, email, contact, dob, department, course);

        // Redirect to display page
        resp.sendRedirect("display-students");
    }
}