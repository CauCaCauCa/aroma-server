package admin;

import data.CookieMng;
import data.ProMng;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author dotie
 */
@MultipartConfig
@WebServlet(name = "AdminController", urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String check = CookieMng.find("admin", req.getCookies());
        if (check != null && check.matches("true")) {
            String id = req.getParameter("id");
            AdminAction admin = new AdminAction();
            admin.removeProudct(id);
            req.setAttribute("query", "");
            req.getRequestDispatcher("admin/admin.jsp").forward(req, resp);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("setPro");
        if (id != null) {
            AdminAction todo = new AdminAction();
            if (!request.getParameter("name").matches("")) {
                todo.setProductProperties(id, "name", request.getParameter("name"));
            }
            if (!request.getParameter("price").matches("")) {
                todo.setProductProperties(id, "price", request.getParameter("price"));
            }
            if (!request.getParameter("quantity").matches("")) {
                todo.setProductProperties(id, "quantity", request.getParameter("quantity"));
            }
            if (!request.getParameter("intro").matches("")) {
                todo.setProductProperties(id, "intro", request.getParameter("intro"));
            }
            if (!request.getParameter("origin").matches("")) {
                todo.setProductProperties(id, "origin", request.getParameter("origin"));
            }
            if (!request.getParameter("typeID").matches("")) {
                todo.setProductProperties(id, "typeID", request.getParameter("typeID"));
            }
            request.setAttribute("query", "");
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
        } else {
            String action = request.getParameter("action");
            String arr[] = action.split("-");
            AdminAction todo = new AdminAction();
            if (action != null) {
                switch (arr[0]) {
                    case "setStatusInvoice":
                        todo.setStatusInvoices(arr[1], Long.parseLong(arr[2]));
                        break;
                    case "removeInvoice":
                        todo.removeInvoices(arr[1], Long.parseLong(arr[2]));
                        break;
                    case "createProduct":
                        if (!todo.createProduct(request, response).matches("Create new product successfully.")) {
                            response.sendRedirect("admin/upload.jsp?err=product-name-is-exist");
                            return;
                        }
                        break;
                }
            }
            request.setAttribute("query", "");
            request.getRequestDispatcher("admin/admin.jsp").forward(request, response);
        }
    }

}
