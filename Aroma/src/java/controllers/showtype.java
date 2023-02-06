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
@WebServlet(urlPatterns = {"/showtype"})
public class showtype extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        SQLserver sql = new SQLserver();
        String type = req.getParameter("type");
        if (type.matches("men")) {
            LinkedList<Product> listMen = sql.getPerfumeList(1);
            req.setAttribute("list-men", listMen);
        } else if (type.matches("women")) {
            LinkedList<Product> listWomen = sql.getPerfumeList(2);
            req.setAttribute("list-women", listWomen);
        } else {
            LinkedList<Product> listUnisex = sql.getPerfumeList(3);
            req.setAttribute("list-unisex", listUnisex);
        }
        req.getRequestDispatcher("showTypes.jsp").forward(req, res);
    }

}
