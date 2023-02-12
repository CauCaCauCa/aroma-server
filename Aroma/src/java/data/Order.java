package data;

import java.sql.ResultSet;
import java.sql.Statement;
import java.util.LinkedList;
import modules.Invoice;

/**
 *
 * @author dotie
 */
public class Order {

    private static SQLserver db = new SQLserver();

    public static void recordOrder(String user, String data, long time, String address, String payment, String isInvoice) {
        if (db.checkUser(user)) {
            try {
                Statement Statement = db.connection.createStatement();
                
                String sql = "INSERT Invoice(phone, detail, time_order, address, payment, isInvoice) VAlUES (N'" + user + "', N'" + data + "', " + time + ", N'" + address + "', N'" + payment + "', " + isInvoice + ")";
                Statement.executeUpdate(sql);
                Statement.close();
            } catch (Exception e) {
                System.out.println(e);
            }
        } else {
            System.out.print(" wrong user ");
        }
        System.out.println("record order");
    }

    public static LinkedList<Invoice> getOrder() {
        LinkedList<Invoice> list = new LinkedList<>();
        try {
            Statement Statement = db.connection.createStatement();
            String query = "SELECT * FROM Invoice";

            ResultSet rs = Statement.executeQuery(query);

            while (rs.next()) {
                list.add(new Invoice(rs.getString("phone"), rs.getString("detail"), Long.parseLong(rs.getString("time_order")), rs.getString("address"), rs.getString("payment"), rs.getString("isInvoice")));
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }

    public static LinkedList<Invoice> getOrder(String user) {
        LinkedList<Invoice> list = new LinkedList<>();
        try {
            Statement Statement = db.connection.createStatement();
            String query = "SELECT * FROM Invoice";

            ResultSet rs = Statement.executeQuery(query);

            while (rs.next()) {
                if (rs.getString("phone").matches(user)) {
                    list.add(new Invoice(rs.getString("phone"), rs.getString("detail"), rs.getLong("time_order"), rs.getString("address"), rs.getString("payment"), rs.getString("isInvoice")));
                }
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return list;
    }
}
