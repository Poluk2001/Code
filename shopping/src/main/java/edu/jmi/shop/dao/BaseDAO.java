package edu.jmi.shop.dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class BaseDAO {
    private final static String URL = "jdbc:mysql://localhost:3306/shopping?serverTimezone=UTC";
    private final static String USER = "root";
    private final static String PASSWORD = "123456";

    public Connection getConnection() {
        Connection c = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            c = DriverManager.getConnection(URL, USER, PASSWORD);
            return c;
        } catch (Exception ex) {
            ex.printStackTrace();
            return null;
        }
    }


    public void closeConnection(Connection c) {
        try {
            c.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
