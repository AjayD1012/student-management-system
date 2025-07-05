package com.studentApp.Servlets;

import com.studentApp.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        System.out.println("Update request received");
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            
            // Validate inputs
            if (name == null || name.trim().isEmpty() || email == null || email.trim().isEmpty()) {
                throw new ServletException("Name and email must not be empty");
            }

            // Update database
            try (Connection conn = DBConnection.getConnection();
                 PreparedStatement ps = conn.prepareStatement(
                     "UPDATE students1 SET name=?, email=? WHERE id=?")) {
                
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setInt(3, id);
                
                int rowsUpdated = ps.executeUpdate();
                System.out.println(rowsUpdated + " row(s) updated");
            }
            
            // Redirect to view students with force refresh
            response.sendRedirect(request.getContextPath() + "/viewStudents?refresh=" + System.currentTimeMillis());
            
        } catch (NumberFormatException e) {
            throw new ServletException("Invalid student ID", e);
        } catch (SQLException e) {
            throw new ServletException("Database error during update", e);
        }
    }
}