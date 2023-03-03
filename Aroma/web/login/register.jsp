<%-- 
    Document   : register
    Created on : Feb 17, 2023, 7:15:00 PM
    Author     : dotie
--%>

<%@page import="data.CookieMng"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        <style>
            label{
                width: 8rem;
                display: inline-block;
            }
            span{
                color: red;
                font-weight: bold;
                font-size: smaller
            }
            form{
                width: 40%;
                margin-left: 30%;
            }
        </style>
    </head>
    <body>
        <%
            String phone = request.getParameter("phone") == null ? "" : request.getParameter("phone");
            String username = request.getParameter("username") == null ? "" : request.getParameter("username");
            String password = request.getParameter("password") == null ? "" : request.getParameter("password");
            String cofirm_password = request.getParameter("cofirm-password") == null ? "" : request.getParameter("cofirm-password");

            
            Cookie c[] = request.getCookies();
            if (!CookieMng.find("user", c).matches("")) {
                request.getRequestDispatcher("user.jsp").forward(request, response);
            }

        %>

        <a href="./" style="text-decoration: none; border: solid 1px gray; padding: 0.5rem; display: inline-block; margin-top: 0.5rem;">
            HOME
        </a>
            <h2 style="text-align: center;">USER REGISTER</h2>
            <form method="post" action="RegisterController">
            
                <label for="phone">Phone number:</label>
                <input type="text" id="phone" name="phone" required value="<%=phone%>">
                <span style="display: ${phoneerr}">*Registered phone number or wrong</span><br><br>
            
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required value="<%=username%>">
                <span style="display: ${usererr}">*User name must have 6 - 12 characters</span><br><br>
            
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required value="<%=password%>">            
                <span style="display: ${passworderr}">*User name must have 3 - 20 characters</span><br><br>
            
                <label for="password">Confirm Password:</label>
                <input type="password" id="confirm-password" name="confirm-password" required value="<%=cofirm_password%>">
                <span style="display: ${passconfirmerr}">*Confirm password is not correct</span><br><br>
            
                <input type="submit" value="Register">
            </form>
    </body>
</html>
