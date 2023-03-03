package controllers;

import data.CookieMng;
import data.SQLserver;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dotie
 */
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

    protected void process(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String user = CookieMng.find("user", request.getCookies());
        String arr[] = user.split(":");
        SQLserver db = new SQLserver();
        if (user == "") {
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        } else if (db.CheckKey(arr[0], arr[1])) {
            request.getRequestDispatcher("user.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        process(request, response);
    }

}
