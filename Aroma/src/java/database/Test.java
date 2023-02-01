/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package database;

import java.util.LinkedList;
import modules.Product;

/**
 *
 * @author dotie
 */
public class Test {
    public static void main(String[] args) {
        SQLserver sql = new SQLserver();
        
        LinkedList<Product> list = sql.getMenPerfumeList();
        for (Product x : list) {
            System.out.println(x.toString());
        }
    }
}
