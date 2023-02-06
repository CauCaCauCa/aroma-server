package controllers;

import database.SQLserver;
import java.io.IOException;
import java.util.LinkedList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import modules.Product;

/**
 *
 * @author dotie
 */
@WebServlet(urlPatterns = {"/home"})
public class HomeController extends HttpServlet {

    protected void doAll(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        SQLserver sql = new SQLserver();
        LinkedList<Product> listMen = sql.getPerfumeList(1);
        req.setAttribute("list-men", listMen);
        req.getRequestDispatcher("home.jsp").forward(req, resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doAll(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doAll(req, resp);
    }

}
