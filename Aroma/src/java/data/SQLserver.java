package data;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
            System.out.print("Connected to Database ");
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public boolean checkAcc(String user, String password) {
        try {
            Statement Statement = connection.createStatement();
            String query = "SELECT * FROM AccountCustomer";

            ResultSet ResultSet = Statement.executeQuery(query);

            while (ResultSet.next()) {
                if (user.matches(ResultSet.getString(1).trim()) && password.matches(ResultSet.getString(3).trim())) {
                    System.out.println("get account info");
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("get account fail");
        return false;
    }

    public boolean AdminLogin(String user, String password) {
        if (user.matches("admin") && password.matches("123")) {
            return true;
        }
        return false;
    }

    public boolean checkUser(String user) {
        System.out.println("check user");
        try {
            Statement Statement = connection.createStatement();
            String query = "SELECT phone FROM AccountCustomer";

            ResultSet ResultSet = Statement.executeQuery(query);

            while (ResultSet.next()) {
                if (user.matches(ResultSet.getString(1).trim())) {
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public boolean CheckKey(String user, String key) {
        try {
            Statement Statement = connection.createStatement();
            String query = "SELECT phone, sessionKey FROM AccountCustomer";

            ResultSet ResultSet = Statement.executeQuery(query);

            while (ResultSet.next()) {
                if (user.matches(ResultSet.getString(1).trim()) && key.matches(ResultSet.getString(2).trim())) {
                    System.out.println("check key");
                    return true;
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("check key");
        return false;
    }

    public boolean SetKey(String user, String key) {
        if (checkUser(user)) {
            try {
                Statement Statement = connection.createStatement();
                String sql = "UPDATE AccountCustomer SET sessionKey = " + key + " WHERE phone = " + user;
                Statement.executeUpdate(sql);
                System.out.println("set key");
                return true;
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        System.out.println("can not set key");
        return false;
    }

    public String getUserName(String user) {
        if (checkUser(user)) {
            try {
                Statement Statement = connection.createStatement();
                String query = "SELECT name FROM AccountCustomer WHERE phone=" + user;

                ResultSet rs = Statement.executeQuery(query);

                while (rs.next()) {
                   return rs.getString("name");
                }
            } catch (Exception e) {
                System.out.println(e);
            }
        }
        return null;
    }

}
