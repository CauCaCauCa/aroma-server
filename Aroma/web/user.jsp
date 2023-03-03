<%-- 
    Document   : user
    Created on : Feb 17, 2023, 12:05:59 PM
    Author     : dotie
--%>

<%@page import="modules.Product"%>
<%@page import="data.Cart"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="modules.Invoice"%>
<%@page import="java.util.LinkedList"%>
<%@page import="data.CookieMng"%>
<%@page import="data.SQLserver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
    <title>Customer Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: rgb(49, 92, 76);
            color: #fff;
            padding: 1rem;
        }

        header h1 {
            margin: 0;
        }

        main {
            display: flex;
            flex-direction: column;
            justify-content: center;
            padding: 1rem;
            margin-left: 31rem;
        }

        .customer-info {
            border: 1px solid #ccc;
            border-radius: 5px;
            box-shadow: 0 0 10px #ccc;
            padding: 1rem;
            width: 50%;
        }

        .customer-info h2 {
            margin-top: 0;
        }

        .customer-info ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }

        .customer-info li {
            margin-bottom: 1rem;
        }

        .customer-info label {
            font-weight: bold;
            margin-right: 0.5rem;
        }

        .customer-info li img {
            width: 30px;
        }

        .customer-info li p {
            position: relative;
            top: 1rem;
            display: inline-block;
            overflow: hidden;
        }
    </style>
</head>

<body>
    <header>
        <a href="./" style="color: white; text-decoration: none;"><h1>Customer Information</h1></a>
        <br>
        <a href="login/logout.jsp" style="color: white; text-decoration: none;">Logout</a>
    </header>
    <main>
        <%
            String user = CookieMng.find("user", request.getCookies());
            SQLserver db = new SQLserver();
            String arr[] = user.split(":");
            String name = db.getUserName(arr[0]);
        %>
        <div class="customer-info">
            <h2><%=name%></h2>
            <ul>
                <li>
                    <label>Phone:</label>
                    <%=arr[0]%>
                </li>
            </ul>
        </div>
        <br>
        <h2>Invoices</h2>
        <%
            if (!user.matches("")) {               
                LinkedList<Invoice> list = db.getInvoices(arr[0]);
                for (Invoice inv : list) {
                    Date d = new Date(inv.getTime_order());
                    SimpleDateFormat df2 = new SimpleDateFormat("dd MMM yyyy HH:mm:ss");
                    String dateText = df2.format(d);
        %>
        <div class="customer-info invoice">
            <h3><%=dateText%></h3>
            <span>Status:&nbsp;<%=inv.getIsInvoice()%></span>
            <p>Address:&nbsp;<%=inv.getAddress()%></p>
            <ul>
                <%
                    int total = 0;
                    LinkedList<Product> proList = Cart.getData(inv.getDetail());
                    for (Product p : proList) {
                        total += p.getPrice()* p.getAmount();
                %>
                <li>
                    <img src="<%=p.getImg_path1()%>" alt="#">
                    <p style="width: 300px; height: 20px;">&nbsp;<%=p.getName()%> &nbsp;&nbsp;</p>
                    <p>&nbsp;<%=p.getPriceS()%>  &nbsp;&nbsp; <%=p.getAmount()%> </p>
                </li>
                <%}
                    String s = "";
                        String totalS = total + "";
                        int count = 0;
                        for (int i = totalS.length() - 1; i >= 0; i--) {
                            if (count == 3) {
                                count = 0;
                                s = "." + s;
                            }
                            s = totalS.charAt(i) + s;
                            count++;
                        }
                %>
                <div id="total" style="text-align: right;"><span style="font-weight: bold;">Total:</span>&nbsp;<%=s%></div>
            </ul>
        </div>
        <%
                }
            } else {
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            }
        %>
    </main>
</body>

</html>
