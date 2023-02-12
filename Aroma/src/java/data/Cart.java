package data;

import java.io.IOException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modules.Product;

/**
 *
 * @author dotie
 */
// auto check db and cookie browser to export cart
public class Cart {

    public static LinkedList<Product> getData(String data) {

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

    public static String setData(String action, String proId, String data) {
        System.out.println("");
        if (!data.matches("")) {
            data = replaceAmount(data, proId, action);
        } else {
            data = proId + ":" + 1;
        }
        return data;
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

    public static String addToCart(String proId, String data) {
        String arr[] = data.split(":");
        for (int i = 0; i < arr.length; i += 2) {
            if (arr[i].matches(proId)) {
                System.out.println("ok");
                data = setData("plus", proId, data); // have function update db inside
                return data;
            }
        }
        data += proId + ":1:";
        return data;
    }

}
