package dao;

import util.DBConnection;
import model.Student;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class StudentDAO {

    // Add a new student
    public boolean addStudent(String fullName, String address, String email,
            String contact, String dob, String department, String course) {
        String sql = "INSERT INTO students (full_name, address, email, contact, dob, department, course) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, fullName);
            stmt.setString(2, address);
            stmt.setString(3, email);
            stmt.setString(4, contact);
            stmt.setString(5, dob);
            stmt.setString(6, department);
            stmt.setString(7, course);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get all students
    public List<Student> getAllStudents() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM students ORDER BY id";

        try (Connection conn = DBConnection.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Student student = new Student(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("contact"),
                        rs.getString("dob"),
                        rs.getString("department"),
                        rs.getString("course"));
                students.add(student);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return students;
    }

    // Search student by ID
    public Student getStudentById(int id) {
        String sql = "SELECT * FROM students WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Student(
                        rs.getInt("id"),
                        rs.getString("full_name"),
                        rs.getString("address"),
                        rs.getString("email"),
                        rs.getString("contact"),
                        rs.getString("dob"),
                        rs.getString("department"),
                        rs.getString("course"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Delete student by ID
    public boolean deleteStudent(int id) {
        String sql = "DELETE FROM students WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update student
    public boolean updateStudent(int id, String fullName, String address, String email,
            String contact, String dob, String department, String course) {
        String sql = "UPDATE students SET full_name=?, address=?, email=?, contact=?, dob=?, department=?, course=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
                PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, fullName);
            stmt.setString(2, address);
            stmt.setString(3, email);
            stmt.setString(4, contact);
            stmt.setString(5, dob);
            stmt.setString(6, department);
            stmt.setString(7, course);
            stmt.setInt(8, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
