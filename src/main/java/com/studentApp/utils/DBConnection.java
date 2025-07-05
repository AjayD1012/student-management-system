package com.studentApp.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {
    private static final String URL = "jdbc:mysql://localhost:3306/studentdb";
    private static final String USER = "root";
    private static final String PASSWORD = "123";

    static {
        try {
            // Load driver explicitly (not needed for newer JDBC versions but good practice)
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("✅ MySQL JDBC Driver loaded successfully");
        } catch (ClassNotFoundException e) {
            System.err.println("❌ Failed to load MySQL JDBC Driver");
            throw new ExceptionInInitializerError(e);
        }
    }

    public static Connection getConnection() throws SQLException {
        Connection conn = null;
        try {
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("✅ Database connection established");
            // Enable auto-commit to ensure each statement executes as a transaction
            conn.setAutoCommit(true);
            return conn;
        } catch (SQLException e) {
            System.err.println("❌ Database connection failed");
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Error Code: " + e.getErrorCode());
            System.err.println("Message: " + e.getMessage());
            throw e; // Re-throw to let calling code handle it
        }
    }
}