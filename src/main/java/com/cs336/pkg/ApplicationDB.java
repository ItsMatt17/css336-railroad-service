package com.cs336.pkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ApplicationDB {

    private static final String CONNECTION_URL =
        "jdbc:mysql://localhost:3306/Project?useSSL=false&serverTimezone=UTC";

    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "1234";

    public ApplicationDB() {
    }

    
    // Note: Converted to static
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException(
                "MySQL JDBC driver was not found in WEB-INF/lib.",
                e
            );
        }

        return DriverManager.getConnection(
            CONNECTION_URL,
            DATABASE_USER,
            DATABASE_PASSWORD
        );
    }

    public static void closeConnection(Connection connection) {
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    public static void main(String[] args) {
        ApplicationDB dao = new ApplicationDB();

        try {
            Connection connection = dao.getConnection();
            System.out.println("Database connection successful: " + connection);
            dao.closeConnection(connection);
        } catch (SQLException e) {
            System.out.println("Database connection failed.");
            e.printStackTrace();
        }
    }
}