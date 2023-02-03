/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class home extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       SQLserver sql = new SQLserver();
        LinkedList<Product> listMen =   sql.getMenPerfumeList();
        request.setAttribute("list-men", listMen);
       request.getRequestDispatcher("home.jsp").forward(request, response);
    }
    

}
