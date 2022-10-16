package com.javafile.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class SqlConnection {

    public Connection connect() throws SQLException {
        Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/shopdb?autoReconnect=true&useSSL=false&characterEncoding=UTF-8","root","");
        return connect;
    }
}
