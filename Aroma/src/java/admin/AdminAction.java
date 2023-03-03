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
import java.util.LinkedList;
import modules.Invoice;

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

    public LinkedList<Invoice> getInvoices() {
        LinkedList<Invoice> list = new LinkedList<>();
        try {
            Statement Statement = connection.createStatement();
            String query = "SELECT i.phone, i.detail, i.time_order, i.address, i.payment, i.isInvoice, a.name FROM Invoice i JOIN AccountCustomer a on i.phone = a.phone ORDER BY time_order desc";

            ResultSet rs = Statement.executeQuery(query);

            while (rs.next()) {
                Invoice inv = new Invoice(rs.getString(1), rs.getString(2), Long.parseLong(rs.getString(3)),
                        rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(inv);
            }
            System.out.println("admin get invoices");
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("admin get invoices fail");
        return list;
    }

    public void setStatusInvoices(String user, long time_order) {
        try {
            Statement Statement = connection.createStatement();
            String sql = "UPDATE Invoice SET isInvoice = 1 WHERE phone = '" + user + "' AND time_order = '" + time_order + "'";
            Statement.executeUpdate(sql);
            System.out.println("verify");
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public void removeInvoices(String user, long time_order) {
        try {
            Statement Statement = connection.createStatement();
            String sql = "DELETE FROM Invoice WHERE phone = '" + user + "' AND time_order = '" + time_order + "'";
            Statement.executeUpdate(sql);
            System.out.println("remove invoice");
        } catch (Exception e) {
            System.out.println(e);
        }
    }
}
