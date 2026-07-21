package com.cs336.pkg;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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



    public static List<Map<String, Object>> query(String sql, Object... params) throws SQLException {
        List<Map<String, Object>> rows = new ArrayList<>();
        try(Connection conn = getConnection();
            PreparedStatement stmt = conn.prepareStatement(sql);) {

            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }
            try (ResultSet res = stmt.executeQuery()) {
                ResultSetMetaData meta = res.getMetaData();

                while (res.next()) {
                    Map<String, Object> row = new HashMap<>();
                    for (int i = 1; i <= meta.getColumnCount(); i++) {
                        if (meta.getColumnType(i) == Types.TIMESTAMP) row.put(meta.getColumnName(i), res.getObject(i, LocalDateTime.class));
                        else row.put(meta.getColumnName(i), res.getObject(i));
                    }
                    rows.add(row);
                }
                return rows;
            }
        }
    }




//    public static void main(String[] args) {
//        ApplicationDB dao = new ApplicationDB();
//
//        try {
//            Connection connection = dao.getConnection();
//            System.out.println("Database connection successful: " + connection);
//            dao.closeConnection(connection);
//        } catch (SQLException e) {
//            System.out.println("Database connection failed.");
//            e.printStackTrace();
//        }
//    }
}