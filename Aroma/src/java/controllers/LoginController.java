package controllers;

import data.SQLserver;
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
@WebServlet(name = "LoginController", urlPatterns = {"/LoginController"})
public class LoginController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("login/login.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check account first
        SQLserver db = new SQLserver();
        if (db.checkAcc(request.getParameter("phone"), request.getParameter("password"))) {
            long time = System.currentTimeMillis();
            String key = request.getParameter("phone") + ":" + time;
            db.SetKey(request.getParameter("phone"), time+"");
            Cookie c = new Cookie("user", key);
            c.setMaxAge(180);
            c.setPath("/");
            response.addCookie(c);
            response.sendRedirect("./");
        } else {
            request.setAttribute("wrong", "*wrong phone or password");
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        }
    }

}
