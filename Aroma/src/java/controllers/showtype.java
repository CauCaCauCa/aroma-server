package controllers;

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
@WebServlet(urlPatterns = {"/showtype"})
public class showtype extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {
        String type = req.getParameter("type");
        req.setAttribute("type", type);
        req.getRequestDispatcher("showTypes.jsp").forward(req, res);
    }

}
