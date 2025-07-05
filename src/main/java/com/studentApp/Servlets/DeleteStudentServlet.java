package com.studentApp.Servlets;

import com.studentApp.utils.DBConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

//@WebServlet("/deleteStudent")
public class DeleteStudentServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            response.sendRedirect("viewStudents");
            return;
        }

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement("DELETE FROM students1 WHERE id = ?")) {
            
            ps.setInt(1, Integer.parseInt(idStr));
            ps.executeUpdate();
            response.sendRedirect(request.getContextPath() + "/viewStudents");
            
        } catch (SQLException e) {
            throw new ServletException("Delete failed", e);
        }
    }
}