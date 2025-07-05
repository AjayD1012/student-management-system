package com.studentApp.Servlets;

import com.studentApp.utils.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

//@WebServlet("/addStudent")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        try {
            // Get DB connection
            Connection conn = DBConnection.getConnection();

            if (conn != null) {
                // Prepare SQL insert
                String sql = "INSERT INTO students1 (name, email) VALUES (?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, email);

                // Execute insert
                ps.executeUpdate();

                // Close connection
                ps.close();
                conn.close();

                // Redirect to view page
                response.sendRedirect("view-students.jsp");
            } else {
                // If DB connection fails
                response.getWriter().println("❌ Database connection failed.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("❌ Error while inserting: " + e.getMessage());
        }
    }
}
