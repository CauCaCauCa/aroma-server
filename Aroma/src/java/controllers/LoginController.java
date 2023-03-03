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
        if (request.getParameter("cancle-logout") == null) {
            if (request.getParameter("logout") != null) { // clear cookie user login
                Cookie c = new Cookie("user", "");
                c.setMaxAge(0);
                c.setPath("/");
                response.addCookie(c);
                response.sendRedirect("./");
                return;
            }
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        } else {
            request.getRequestDispatcher("user.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Check account first
        SQLserver db = new SQLserver();
        if (request.getParameter("user") != null) {
            if (db.AdminLogin(request.getParameter("user"), request.getParameter("password"))) {
                request.setAttribute("query", "");
                Cookie c = new Cookie("admin", "true");
                c.setMaxAge(60 * 10);
                c.setPath("/");
                response.addCookie(c);
                request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
            } else {
                request.setAttribute("noice", "*wrong user or password");
                response.sendRedirect("admin");
            }
            return;
        }
        if (db.checkAcc(request.getParameter("phone"), request.getParameter("password"))) {
            long time = System.currentTimeMillis();
            String key = request.getParameter("phone") + ":" + time;
            db.SetKey(request.getParameter("phone"), time + "");
            Cookie c = new Cookie("user", key);
            c.setMaxAge(300);
            c.setPath("/");
            response.addCookie(c);
            response.sendRedirect("./");
        } else {
            request.setAttribute("wrong", "*wrong phone or password");
            request.getRequestDispatcher("login/login.jsp").forward(request, response);
        }
    }

}
