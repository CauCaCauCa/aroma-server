/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author dotie
 */
public class AdminAction {

    Connection connection;

    public AdminAction() {
        try {
            String user = "sa";
            String pass = "12345";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=perfume";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.print("Connected to Database ");
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public void setProductProperties(String id, String colname, String value) {
        try {
            Statement Statement = connection.createStatement();
            String sql = "UPDATE Products SET " + colname + "='" + value + "' WHERE proID ='" + id + "'";
            Statement.executeUpdate(sql);
            System.out.println("set name");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void removeProudct(String id) {
        try {
            Statement Statement = connection.createStatement();
            String sql = "DELETE FROM Products where proID='" + id + "'";
            Statement.executeUpdate(sql);
            System.out.println("remove" + id);
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
