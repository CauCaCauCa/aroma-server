<%-- 
    Document   : order
    Created on : Feb 10, 2023, 11:52:30 PM
    Author     : dotie
--%>

<%@page import="data.SQLserver"%>
<%@page import="data.Cart"%>
<%@page import="java.util.LinkedList"%>
<%@page import="data.CookieMng"%>
<%@page import="modules.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <title>Perfume Order Form</title>
        <style>
            body {
                font-family: Arial, sans-serif;
            }

            h1 {
                text-align: center;
                margin-bottom: 50px;
            }

            form {
                width: 50%;
                margin: 0 auto;
                text-align: left;
                padding: 20px;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }

            input[type="text"],
            select, textarea {
                width: 100%;
                padding: 10px;
                margin-bottom: 20px;
                border: 1px solid gray;
                border-radius: 5px;
                box-sizing: border-box;
                font-size: medium;
            }

            input[type="submit"] {
                padding: 10px 20px;
                border: none;
                border-radius: 5px;
                background-color: rgb(49, 92, 76);
                color: white;
                font-weight: bold;
                cursor: pointer;
            }

            #page {
                position: absolute;
                left: 20%;
                border: solid gray 0.5px;
                display: flex;
                flex-direction: row;
                width: 60%;
                border-radius: 15px;
                box-shadow: rgba(50, 50, 93, 0.25) 0px 2px 5px -1px, rgba(0, 0, 0, 0.3) 0px 1px 3px -1px;
            }

            #left {
                width: 20rem;
            }

            #middle {
                width: 2rem;
            }

            #right {
                width: 40rem;
            }

            #right .show-product {
                display: flex;
                flex-direction: row;
                font-weight: bold;
                padding-top: 2rem;
                padding-right: 1rem;
                margin-right: 1rem;
            }

            #right .show-product :nth-child(1) {
                width: 55%;
                height: 1rem;
                margin-left: 2.5%;
                margin-right: 10%;
                overflow: hidden;
            }

            #right .show-product :nth-child(2) {
                width: 20%;
                height: 1rem;
                margin-right: 5%;
                overflow: hidden;
            }

            #right .show-product :nth-child(3) {
                width: 5%;
                height: 1rem;
                margin-right: 2.5%;
                overflow: hidden;
            }
        </style>
    </head>

    <body>
        <%
            String cart = CookieMng.find("cart", request.getCookies());
            if (cart.matches("") || cart == null) {
                response.sendRedirect("cart.jsp");
                return;
            }

            // check login user
            String user = CookieMng.find("user", request.getCookies());
            if (user == null || user.matches("")) {
                request.getRequestDispatcher("login/login.jsp").forward(request, response);
            }
            String arr[] = user.split(":");
            SQLserver db = new SQLserver();
        %>
        <h1>Aroma Order</h1>
        <div id="page">
            <form id="left" action="OrderController" method="post" onsubmit="return validateForm()">
                <label>Customer Name:</label>
                <p type="text" id="customer-name"><%=db.getUserName(arr[0])%></p><br>
                <label>Phone Number:</label>
                <p type="text" id="customer-phone"><%=arr[0]%></p><br>
                <label for="customer-address">Address:</label>
                <textarea type="text" id="customer-address" name="customer-address"></textarea><br>

                <label for="payment">Payment:</label>
                <select id="payment" name="payment" onchange="display()">
                    <option value="Payment-on-delivery" selected>Payment on delivery</option>
                    <option value="Momo">Momo</option>
                </select><br>
                <div id="momo">
                    <img src="resrc/momo.jpg" alt="#" width="100%">
                    <p>Upload your Payment Picture</p>
                    <input type="file" name="check-payment">
                </div><br><br><br>
                <input type="submit" value="Submit Order">
            </form>
            <div id="middle"></div>
            <div id="right">
                <%
                    String data = CookieMng.find("cart", request.getCookies());
                    LinkedList<Product> list = Cart.getData(data);
                    long total = 0;
                    for (Product p : list) {
                        total += p.getPrice() * p.getAmount();
                %>
                <div class="show-product">
                    <div><%=p.getName()%></div>
                    <div><%=p.getPriceS()%></div>
                    <div><%=p.getAmount()%></div>
                </div><br>
                <%
                    }
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

                <hr>
                <div style="font-size: 30px; text-align: right;">
                    <span style="position: relative; top: -0.5rem; left: -7rem;"><input type="button" value="EDIT"
                                                                                        onclick="window.location = 'cart.jsp'" style="width: 5rem;"></span>
                    <span style="font-weight: bold; margin: 0 7rem 0 0;">Total:</span><span
                        style="margin-right: 1rem;"><%=s%></span>
                </div>
            </div>
        </div>
        <script>
            window.onload = display();
            function display() {
                var payment = document.getElementById('payment');
                var momo = document.getElementById('momo');
                if (payment.value == 'Momo') {
                    momo.innerHTML = '<img src="resrc/momo.jpg" alt="#" width="100%"><p>Upload your Payment Picture</p><input type="file" name="check-payment">'
                } else {
                    momo.innerHTML = '';
                }
            }
            function validateForm() {
                var inputs = document.querySelectorAll('input[type="text"], textarea, input[type="file"]');
                for (var i = 0; i < inputs.length; i++) {
                    if (inputs[i].value === '') {
                        alert('Please fill in all fields');
                        return false;
                    }
                }
                return true;
            }
            function stopEnterKey(evt) {
                var evt = (evt) ? evt : ((event) ? event : null);
                var node = (evt.target) ? evt.target : ((evt.srcElement) ? evt.srcElement : null);
                if ((evt.keyCode == 13) && (node.type == "text")) {
                    return false;
                }
            }
            document.onkeypress = stopEnterKey;
        </script>

    </body>

</html>
