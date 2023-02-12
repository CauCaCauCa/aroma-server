<%-- Document : index.jsp Created on : Feb 7, 2023, 12:09:36 PM Author : dotie --%>

<%@page import="data.CookieMng"%>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Login V2</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" type="text/css" href="login/css/util.css">
        <link rel="stylesheet" type="text/css" href="login/css/main.css">

        <meta name="dotien" content="noindex, follow">

    </head>

    <body>
        <%
            if (!CookieMng.find("user", request.getCookies()).matches("")) {
                request.getRequestDispatcher("logout.jsp").forward(request, response);
            }

        %>
        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <a href="./" class="login100-form-title p-b-30">
                        AMORA
                    </a>
                    <br>
                    <form action="LoginController" method="post" class="login100-form validate-form">

                        <div class="wrap-input100 validate-input" data-validate="Enter phone">
                            <input class="input100" type="text" name="phone">
                            <span class="focus-input100" data-placeholder="Phone number"></span>
                        </div>
                        <div class="wrap-input100 validate-input" data-validate="Enter password">
                            <span class="btn-show-pass">
                            </span>
                            <input class="input100" type="password" name="password">
                            <span class="focus-input100" data-placeholder="Password"></span>
                        </div>
                        <div class="wrap-100" style="height: 20px">
                            <p style="display: block; color: red; font-weight: bold;">
                                ${wrong}
                            </p>
                        </div>
                        <div class="container-login100-form-btn">
                            <div class="wrap-login100-form-btn">
                                <div class="login100-form-bgbtn"></div>
                                <button class="login100-form-btn">
                                    Login
                                </button>
                            </div>
                        </div>
                    </form>
                    <div class="text-center p-t-115">
                        <span class="txt1">
                            Don’t have an account?
                        </span>
                        <a class="txt2" href="#">
                            Sign Up
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <div id="dropDownSelect1"></div>


        <script src="login/js/main.js"></script>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"
        type="text/javascript"></script>


    </body>

</html>