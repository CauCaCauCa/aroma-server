package data;

import java.util.LinkedList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modules.Product;

/**
 *
 * @author dotie
 */
// auto check db and cookie browser to export cart
public class Cart {

    private static String data;

    public static void loadCart(HttpServletRequest req, HttpServletResponse res) throws Exception {

        String key = CookieMng.find("user", req.getCookies());
        String arr[] = key.split(":");
        SQLserver db = new SQLserver();
        if (!key.matches("")) {
            if (db.CheckKey(arr[0], arr[1])) {
                data = db.getCart(arr[0]);
            }
        } else {
            req.getRequestDispatcher("login/login.jsp").forward(req, res);
        }

    }

    public static LinkedList<Product> getData(HttpServletRequest req, HttpServletResponse res) throws Exception {
        loadCart(req, res);

        LinkedList<Product> list = new LinkedList<>();
        if (!data.matches("")) {
            ProMng promng = new ProMng();
            LinkedList<Product> fullPro = promng.takePerfumeList(0);
            String arr[] = data.split(":");
            for (int i = 0; i < arr.length; i += 2) {
                for (Product p : fullPro) {
                    if (arr[i].toUpperCase().matches(p.getProID())) {
                        p.amount = Integer.parseInt(arr[i + 1]);
                        list.add(p);
                        break;
                    }
                }
            }
        }
        return list;
    }

    public static void setData(String action, String proId, String user) {
//        String data = "P001:1";
        System.out.println("");
        if (!data.matches("")) {
            data = replaceAmount(data, proId, action);
        } else {
            data = proId + ":" + 1;
        }
        // record to db
        SQLserver db = new SQLserver();
        db.setCart(user, data);
        System.out.println(data);

    }

    public static String replaceAmount(String origin, String sample, String action) {
        String str = "";
        String arr[] = origin.split(":");
        for (int i = 0; i < arr.length; i += 2) {
            if (arr[i].matches(sample)) {
                if (action.matches("minus")) {
                    if (arr[i + 1].matches("1")) {
                        i += 2;
                    } else {
                        arr[i + 1] = Integer.parseInt(arr[i + 1]) - 1 + "";
                    }
                } else {
                    arr[i + 1] = Integer.parseInt(arr[i + 1]) + 1 + "";
                }
            }
            if (i < arr.length) {
                str += arr[i] + ":" + arr[i + 1] + ":";
            }
        }
        return str;
    }
    
    public static void addToCart(String user, String proid){
        
    }

}
