package com.cs336.pkg;

import java.sql.*;
import java.time.LocalDateTime;
import java.util.*;


public class ApplicationDB {

    private static final String CONNECTION_URL =
            "jdbc:mysql://localhost:3306/Project?useSSL=false&serverTimezone=UTC";

    private static final String DATABASE_USER = "root";
    private static final String DATABASE_PASSWORD = "1234";

    public ApplicationDB() {}

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

//    public static Line getLine(String name) throws SQLException {
//        String sql = "SELECT * FROM Line " +
//                     "WHERE lname = ?";
//
//        List<Map<String, Object>> res = query(sql, name);
//        if (res.isEmpty()) return null;
//
//
//        Map<String, Object> r = res.getFirst();
//
//        return new Line(
//                    (String) r.getOrDefault("name", "Unknown"),
//                    (float) r.getOrDefault("fare", -1.0),
//                    (int) r.getOrDefault("duration_mins", 0),
//                    getStation((int) r.getOrDefault("origin", -1)),
//                    getStation((int) r.getOrDefault("dest", -1)));
//    }


//    public static List<Line> getLines(int originId, int destId) throws SQLException {
//        String sql =  "SELECT O.lname " +
//                      "FROM LineStop O, LineStop D " +
//                        "WHERE O.lname = D.lname " +
//                        "AND O.station = ? " +
//                        "AND D.station = ? " +
//                        "AND O.stop_num < D.stop_num";
//
//        List<Line> lines = new ArrayList<>();
//        List<Map<String, Object>> res = query(sql);
//        for (Map<String, Object> r : res) {
//            Line line = new Line(
//                    (String) r.getOrDefault("name", "Unknown"),
//                    (float) r.getOrDefault("fare", -1.0),
//                    (int) r.getOrDefault("duration_mins", 0),
//                    getStation((int) r.getOrDefault("origin", -1)),
//                    getStation((int) r.getOrDefault("dest", -1)));
//            lines.add(line);
//        }
//        return lines;
//    }


    public static List<Station> getStations() {
        String sql = "SELECT * FROM Station";
        return query(sql)
                .stream()
                .map(Station::fromRow)
                .toList();
    }

    public static Optional<Station> getStation(int id) {
        String sql = "SELECT * FROM Station " +
                     "WHERE id = ?";

        return query(sql, id).stream()
                .findFirst()
                .map(Station::fromRow);
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

    // This is used for deletes, inserts, and update methods in sql
    public static int update(String sql, Object... params) throws SQLException {
        try (Connection conn = getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);) {

            for (int i = 0; i < params.length; i++) {
                stmt.setObject(i + 1, params[i]);
            }
            return stmt.executeUpdate();
        }
    }

    public static List<Map<String, Object>> query(String sql, Object... params)  {
        System.out.println(sql);
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
                        Object v = switch(meta.getColumnType(i)){
                            case Types.TIMESTAMP  ->  res.getObject(i, LocalDateTime.class);
                            case Types.DECIMAL -> res.getFloat(i);
                            default -> res.getObject(i);
                        };
                        row.put(meta.getColumnLabel(i), v);
                    }
                    rows.add(row);
                }
            } catch(Exception ex){
                System.err.println("Database Query error whilst parsing ResultSet: " + ex);
                ex.printStackTrace();
            }
        }catch(Exception ex) {
            System.err.println("Database query error whilst connecting to database: " + ex);
            ex.printStackTrace();
        }
        return rows;
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