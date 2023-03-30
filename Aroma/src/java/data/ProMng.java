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
    
    public static void main(String[] args) {
        ProMng mng = new ProMng();
        System.out.println(mng.takeBrandID("Yves Saint Laurent"));
    }

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

    public LinkedList<Product> takePerfumeListSorted(int type, String sortDirect, String sortTo) {
        SQLserver db = new SQLserver();
        String query;
        if (type == 0) {
            query = "select * from Products p order by " + sortTo + " " + sortDirect;
        } else {
            query = "select * from Products p where p.typeID = " + type + " order by " + sortTo + " " + sortDirect;
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

    public LinkedList<Product> takePerfumeList(String query) {
        LinkedList<Product> list = takePerfumeList(0);
        if (!query.matches("")) {
            LinkedList<Product> result = new LinkedList<>();

            for (Product p : list) {
                if (p.getName().toUpperCase().contains(query.toUpperCase())) {
                    result.add(p);
                }
            }
            return result;
        }
        return list;
    }

    public Product takeProduct(String id) {
        LinkedList<Product> list = takePerfumeList(0);
        for (Product p : list) {
            if (p.getProID().matches(id)) {
                return p;
            }
        }
        return null;
    }

    public String takeBrand(String idB) {
        SQLserver db = new SQLserver();

        String query = "select name from Brand where brandID=" + idB;
        try {
            Statement Statement = db.connection.createStatement();
            ResultSet rs = Statement.executeQuery(query);
            System.out.println("get Brand success");
            while (rs.next()) {
                return rs.getString("name");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    
    public String takeBrandID(String name) {
        SQLserver db = new SQLserver();

        String query = "select brandID from Brand where name='" + name+ "'";
        try {
            Statement Statement = db.connection.createStatement();
            ResultSet rs = Statement.executeQuery(query);
            System.out.println("get BrandID success");
            while (rs.next()) {
                return rs.getString("brandID");
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public String addBrand(String brandName) {
        SQLserver db = new SQLserver();
        int amountBrand = 0;
        String query = "select count(name)from Brand";
        try {
            Statement Statement = db.connection.createStatement();
            ResultSet rs = Statement.executeQuery(query);
            while (rs.next()) {
                amountBrand = Integer.parseInt(rs.getString(1));
            }
            String query2 = "INSERT Brand(brandID,name) VAlUES (" + (amountBrand + 1) + ", N'" + brandName + "')";
            Statement.executeUpdate(query2);
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
}
