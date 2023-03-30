/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package admin;

import data.ProMng;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modules.Invoice;
import modules.Product;
import tools.CheckValidate;
import tools.HandleFile;

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
    
    public static void main(String[] args) {
        AdminAction admin = new AdminAction();
        System.out.println(admin.isExist("Dolce & Gabbana The One Eau de Parfum for Men 100ml"));
    }
    
    public String createProduct(HttpServletRequest request, HttpServletResponse response) {
        String name = request.getParameter("name").trim();
        String brand = request.getParameter("brand").trim();
        String price = request.getParameter("price").trim();
        String quantity = request.getParameter("quantity").trim();
        String description = request.getParameter("description").trim();
        String origin = request.getParameter("origin").trim();
        String type = request.getParameter("type").trim();
        
        if (isExist(name)) {
            return "Product's name is exist";
        }
        
        ProMng mng = new ProMng();
        if (mng.takeBrandID(brand) == null) {
            mng.addBrand(brand);
        }
        // set path for images
        LinkedList<String> paths = HandleFile.recordFileFromClient(request, type, name);
        // // // //
        try {
            Statement Statement = connection.createStatement();
            String sql = "insert Products(proID, name, brandID, price, quantity, intro, origin, typeID, img_path1, img_path2, img_path3) "
                    + "values ('P" + CheckValidate.setFomatID(mng.takePerfumeList(0).size() + 1 + "", 3) + "', "
                    + "'" + name + "', '" + mng.takeBrandID(brand) + "', " + price + "," + quantity + ",'" + description + "',"
                    + "'" + origin + "', '" + type + "', '" + paths.get(0) + "', '" + paths.get(1) + "', '" + paths.get(2) + "'" + ")";
            Statement.executeUpdate(sql);
            System.out.println("set name");
        } catch (Exception e) {
            System.out.println(e);
        }
        
        return "Create new product successfully.";
    }
    
    public boolean isExist(String name) {
        try {
            Statement Statement = connection.createStatement();
            String query = "SELECT [name] FROM [Perfume].[dbo].[Products] ";
            
            ResultSet rs = Statement.executeQuery(query);
            
            while (rs.next()) {
                if (name.toLowerCase().matches(rs.getString("name").toLowerCase())) {
                    System.out.println("admin check");
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
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
            System.out.println("admin get invoices fail");
            System.out.println(e);
        }
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
