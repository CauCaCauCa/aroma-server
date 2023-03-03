/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.CookieMng;
import data.Order;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
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
@WebServlet(name = "OrderController", urlPatterns = {"/OrderController"})
public class OrderController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // for order
        String user = CookieMng.find("user", request.getCookies());
        String cart = CookieMng.find("cart", request.getCookies());
        if (user.matches("") || user == null) {
            request.getRequestDispatcher("login/login.jsp");
        } else if (cart.matches("") || cart == null) {
            response.sendRedirect("cart.jsp");
        } else {
            try {
                String arr[] = user.split(":");
                
                String address = request.getParameter("customer-address");
                byte[] bytes = address.getBytes(StandardCharsets.ISO_8859_1);
                address = new String(bytes, StandardCharsets.UTF_8);
                
                Order.recordOrder(arr[0], cart, System.currentTimeMillis(),
                        address,
                        request.getParameter("payment"), "0");
                System.out.println( request.getParameter("customer-address"));
            } catch (Exception e) {
                System.out.println(e);
            }
            Cookie c = new Cookie("cart", "");
            c.setMaxAge(60 * 60);
            c.setPath("/");
            response.addCookie(c);
            response.sendRedirect("index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
