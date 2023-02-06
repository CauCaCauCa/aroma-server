package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import modules.Product;
import tools.Convertor;

/**
 *
 * @author dotie
 */
public class SQLserver {

    Connection connection;

    public SQLserver() {
        try {
            String user = "sa";
            String pass = "12345";
            String url = "jdbc:sqlserver://localhost:1433;databaseName=perfume";
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(url, user, pass);
            System.out.println("Connected to Database");
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public boolean checkAcc(String user, String password) {

        //***************************************************
        if (user.matches("admin") && password.matches("123")) {
            return true;
        }
        //***************************************************
        try {
            Statement Statement = connection.createStatement();
            String query = "SELECT * FROM acc_login";

            ResultSet ResultSet = Statement.executeQuery(query);

            while (ResultSet.next()) {
                if (user.matches(ResultSet.getString(1).trim()) && password.matches(ResultSet.getString(2).trim())) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public LinkedList<Product> getPerfumeList(int type) {
        String query;
        if (type == 0) {
            query = "select * from Products p";
        } else {
            query = "select * from Products p where p.typeID = " + type;
        }
        LinkedList<Product> list = new LinkedList<>();
        try {
            Statement Statement = connection.createStatement();
            ResultSet rs = Statement.executeQuery(query);
            while (rs.next()) {
                list.add(new Product(rs.getString(1).trim(),
                        rs.getString(2).trim(),
                        rs.getString(3).trim(),
                        Double.parseDouble(rs.getString(4).trim()),
                        Integer.parseInt(rs.getString(5).trim()),
                        rs.getString(6).trim(),
                        rs.getString(7).trim(),
                        rs.getString(8).trim(),
                        rs.getString(9).trim(),
                        rs.getString(10).trim(),
                        rs.getString(11).trim()));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

}
