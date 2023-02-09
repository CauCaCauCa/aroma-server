package data;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import modules.Product;

/**
 *
 * @author dotie
 */
public class ProMng {

    public LinkedList<Product> takePerfumeList(int type) {
        SQLserver db = new SQLserver();
        String query;
        if (type == 0) {
            query = "select * from Products p";
        } else {
            query = "select * from Products p where p.typeID = " + type;
        }
        LinkedList<Product> list = new LinkedList<>();
        try {
            Statement Statement = db.connection.createStatement();
            ResultSet rs = Statement.executeQuery(query);
            System.out.println("get product success");
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
            System.out.println("get product fail");
            System.out.println(e);
        }
        return list;
    }

    public LinkedList<Product> takePerfumeList(int type, int amount) {
        SQLserver db = new SQLserver();
        String query;
        if (type == 0) {
            query = "select * from Products p";
        } else {
            query = "select * from Products p where p.typeID = " + type;
        }
        LinkedList<Product> list = new LinkedList<>();
        try {
            Statement Statement = db.connection.createStatement();
            ResultSet rs = Statement.executeQuery(query);
            System.out.println("get product success");
            int count = 0;
            while (rs.next() && count++ < amount) {
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
            System.out.println("get product fail");
            System.out.println(e);
        }
        return list;
    }

}
