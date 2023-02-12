/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.nio.charset.StandardCharsets;

/**
 *
 * @author dotie
 */
public class test {

    public static void main(String[] args) {
//        Order.recordOrder("0356415082", "cart", System.currentTimeMillis(),
//                "thủ đức",
//                "payment", "0");
//        System.out.println(Order.getOrder().getLast());
//        SQLserver db = new SQLserver();
//        System.out.println(db.checkUser("0356415082"));

        String item = "thá»§ Äá»©c";

        byte[] bytes = item.getBytes(StandardCharsets.ISO_8859_1);
        item = new String(bytes, StandardCharsets.UTF_8);
        
        System.out.println(item);
    }
}
