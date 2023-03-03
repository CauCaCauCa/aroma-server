/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import data.SQLserver;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import tools.CheckValidate;

/**
 *
 * @author dotie
 */
@WebServlet(name = "RegisterController", urlPatterns = {"/RegisterController"})
public class RegisterController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("phoneerr", "none");
        request.setAttribute("usererr", "none");
        request.setAttribute("passworderr", "none");
        request.setAttribute("passconfirmerr", "none");
        request.getRequestDispatcher("login/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        boolean flag = true;
        // check validate register
        String phone = request.getParameter("phone").trim();
        String user = request.getParameter("username").trim();
        String password = request.getParameter("password");
        String password_confirm = request.getParameter("confirm-password");

        // reset
        request.setAttribute("phoneerr", "none");
        request.setAttribute("usererr", "none");
        request.setAttribute("passworderr", "none");
        request.setAttribute("passconfirmerr", "none");

        if (!CheckValidate.length(6, 12, user)) {
            request.setAttribute("usererr", "inline-block"); // set display propertie
            flag = false;
        }
        if (!CheckValidate.length(3, 20, password)) {
            request.setAttribute("passworderr", "inline-block");
            flag = false;
        }
        if (!password.matches(password_confirm)) {
            request.setAttribute("passconfirmerr", "inline-block");
            flag = false;
        }
        
        if (!CheckValidate.length(10, 10, phone)) {
            request.setAttribute("phoneerr", "inline-block");
            flag = false;

        }
        SQLserver db = new SQLserver();
        if (db.checkUser(phone)) {
            request.setAttribute("phoneerr", "inline-block");
            flag = false;

        }
        //************************
        if (flag) {
            db.addAcc(phone, user, password);
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login/register.jsp").forward(request, response);
        }
    }

}
