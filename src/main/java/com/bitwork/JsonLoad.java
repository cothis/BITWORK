package com.bitwork;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class JsonLoad {
    public static void main(String[] args) {

        // JSON 읽기

        // Jdbc
        try {
            Class.forName("oracle.jdbc.OracleDriver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        String url = "jdbc:oracle:thin:@localhost:1521:xe";
        String id = "mystudy";
        String pw = "mystudypw";
        try {
            Connection conn = DriverManager.getConnection(url, id, pw);
            String sql = "";
            conn.prepareStatement(sql);



        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
