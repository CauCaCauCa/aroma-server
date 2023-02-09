/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

/**
 *
 * @author dotie
 */
public class test {

    public static void main(String[] args) {
//        SQLserver db = new SQLserver();
//        if (db.CheckKey("0356415082", "1675900502363")) {
//            System.out.println(db.getCart("0356415082"));
//        }
//        System.out.println(db.getCart("0356415082"));

        Cart cart = new Cart();
        cart.setData("plus", "P001", "0356415082");
        
        
//        System.out.println(cart.getData("P001:2:P003:1").size());
    }
}
