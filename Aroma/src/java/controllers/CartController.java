/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.Cart;
import data.CookieMng;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dotie
 */
@WebServlet(name = "CartController", urlPatterns = {"/CartController"})
public class CartController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String cart = CookieMng.find("cart", request.getCookies());
        if (cart.matches("")) {
            Cookie c = new Cookie("cart", ":");
            c.setMaxAge(60);
            c.setPath("/");
            response.addCookie(c);
        }
        response.sendRedirect("cart.jsp");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");
        String cookie = CookieMng.find("cart", request.getCookies());
        String arr[] = action.split("-"); // action - proId; 

        if (!arr[0].matches("add") && !arr[0].matches("order")) {
            String cart = Cart.setData(arr[0], arr[1], cookie);
            Cookie c = new Cookie("cart", cart);
            c.setMaxAge(60 * 60);
            c.setPath("/");
            response.addCookie(c);
            response.sendRedirect("cart.jsp");
        } else if (request.getParameter("quantity") == null) {
            String cart = Cart.addToCart(arr[1], cookie);
            Cookie c = new Cookie("cart", cart);
            c.setMaxAge(60 * 60);
            c.setPath("/");
            response.addCookie(c);
//            request.setAttribute("notify", "block");
            response.sendRedirect("cart.jsp");
        } else {
            String cart = Cart.addToCart(arr[1], cookie);
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            System.out.println(quantity);
            for (int i = 0; i < quantity-1; i++) {
                cart = Cart.addToCart(arr[1], cart);
                System.out.println(i);
            }
            
            Cookie c = new Cookie("cart", cart);
            c.setMaxAge(60 * 60);
            c.setPath("/");
            response.addCookie(c);
            response.sendRedirect("cart.jsp");
        }
    }

}
