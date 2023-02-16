package controllers;

import data.ProMng;
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
        String type = req.getParameter("type");
        int typeInt = type.matches("men") ? 1 : type.matches("women") ? 2 : type.matches("unisex") ? 3 : 0;
        String sort = req.getParameter("sort");
        String thing = sort.matches("name") ? "name" : "price";
        if (sort.matches("name") || sort.matches("ascending")) {
            sort = "asc";
        } else {
            sort = "desc";
        }
        ProMng mng = new ProMng();
        LinkedList<Product> list = mng.takePerfumeListSorted(typeInt, sort, thing);
        req.setAttribute("list", list);
        if (thing.matches("name")) {
            req.setAttribute("name", "selected");
            req.setAttribute("ascending", "");
            req.setAttribute("descending", "");
        } else if (thing.matches("price") && sort.matches("asc")) {
            req.setAttribute("name", "");
            req.setAttribute("ascending", "selected");
            req.setAttribute("descending", "");
        } else {
            req.setAttribute("name", "");
            req.setAttribute("ascending", "");
            req.setAttribute("descending", "selected");
        }
        req.getRequestDispatcher("showTypes.jsp").forward(req, res);
    }

}
