package com.fin.db.dbutility;

import java.sql.*;

public class DBConnection {

    Connection con = null;
    Statement st = null;
    ResultSet rs;
    Integer temp = null;

    public void queryi(String sql) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "");
            st = (Statement) con.createStatement();
            st.execute(sql);
            //error=null;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error" + e.getLocalizedMessage());
        }
    }

    public Integer queryint(String sql) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "");
            st = (Statement) con.createStatement();
            rs = st.executeQuery(sql);
            rs.next();
            temp = rs.getInt(1);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e.getMessage());
        }
        return temp;
    }

    public ResultSet querys(String sql) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "");
            st = con.createStatement();
            rs = st.executeQuery(sql);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println(e.getMessage());
        }
        return rs;
    }

    public void queryud(String sql) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = (Connection) DriverManager.getConnection("jdbc:mysql://localhost:3306/testdb", "root", "");
            st = con.createStatement();
            st.executeUpdate(sql);
            //error=null;
        } catch (Exception e) {
            // TODO Auto-generated catch block
            System.out.println("error" + e.getLocalizedMessage());
        }
    }
}
