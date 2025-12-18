package servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import dao.StudentDAO;
import model.Student;
import java.io.IOException;

@WebServlet("/search-student")
public class SearchStudentServlet extends HttpServlet {
    private StudentDAO studentDAO = new StudentDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String idStr = req.getParameter("searchId");
        Student student = null;

        if (idStr != null && !idStr.isEmpty()) {
            try {
                int id = Integer.parseInt(idStr);
                student = studentDAO.getStudentById(id);
            } catch (NumberFormatException e) {
                // Ignore
            }
        }

        req.setAttribute("searchResult", student);
        req.getRequestDispatcher("search.jsp").forward(req, resp);
    }
}