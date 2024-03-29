<%-- 
    Document   : showProduct
    Created on : Feb 12, 2023, 11:32:03 AM
    Author     : dotie
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="modules.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Home</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS v5.2.1 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">

        <!-- css customize -->
        <link rel="stylesheet" href="resrc/css/showProduct.css">
    </head>

    <body>
        <header>
            <div id="head" class="container-fluid">
                <div class="row">
                    <div class="col-lg-1"></div>

                    <div class="col-lg-2" id="search">

                        <form action="SearchController" method="get" class="input-group">
                            <input type="text" class="form-control radius-10" placeholder="search" aria-label="search"
                                   name="search" aria-describedby="basic-addon2">

                            <button type="submit" class="input-group-text radius-10" id="basic-addon2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                     class="bi bi-search" viewBox="0 0 16 16">
                                <path
                                    d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                </svg>
                            </button>
                        </form>

                    </div>

                    <div class="col-lg-2"></div>

                    <div class="col-lg-2" id="logo">
                        <a href="./"> <img src="./resrc/logo.png" alt="#" width="75%" height="auto"></a>
                    </div>

                    <div class="col-lg-3"></div>

                    <div class="col-lg-2 " id="login">

                        <a href="LoginController" class="text-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor"
                                 class="bi bi-box-arrow-in-right" viewBox="0 0 16 16">
                            <path fill-rule="evenodd"
                                  d="M6 3.5a.5.5 0 0 1 .5-.5h8a.5.5 0 0 1 .5.5v9a.5.5 0 0 1-.5.5h-8a.5.5 0 0 1-.5-.5v-2a.5.5 0 0 0-1 0v2A1.5 1.5 0 0 0 6.5 14h8a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-8A1.5 1.5 0 0 0 5 3.5v2a.5.5 0 0 0 1 0v-2z" />
                            <path fill-rule="evenodd"
                                  d="M11.854 8.354a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H1.5a.5.5 0 0 0 0 1h8.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3z" />
                            </svg>
                            <span>Login</span>
                        </a>

                        <span>&nbsp;|&nbsp;</span>

                        <a href="cart.jsp" class="text-white">
                            <svg xmlns="http://www.w3.org/2000/svg" width="25" height="25" fill="currentColor"
                                 class="bi bi-cart-plus" viewBox="0 0 16 16">
                            <path
                                d="M9 5.5a.5.5 0 0 0-1 0V7H6.5a.5.5 0 0 0 0 1H8v1.5a.5.5 0 0 0 1 0V8h1.5a.5.5 0 0 0 0-1H9V5.5z" />
                            <path
                                d="M.5 1a.5.5 0 0 0 0 1h1.11l.401 1.607 1.498 7.985A.5.5 0 0 0 4 12h1a2 2 0 1 0 0 4 2 2 0 0 0 0-4h7a2 2 0 1 0 0 4 2 2 0 0 0 0-4h1a.5.5 0 0 0 .491-.408l1.5-8A.5.5 0 0 0 14.5 3H2.89l-.405-1.621A.5.5 0 0 0 2 1H.5zm3.915 10L3.102 4h10.796l-1.313 7h-8.17zM6 14a1 1 0 1 1-2 0 1 1 0 0 1 2 0zm7 0a1 1 0 1 1-2 0 1 1 0 0 1 2 0z" />
                            </svg>
                            <span>Cart</span>
                        </a>

                    </div>

                </div>
            </div>

            <div id="options">
                <nav class="navbar navbar-expand-lg">
                    <div id="mobile" class="row">

                        <div id="button-mobile" class="col col-sm-4">
                            <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                                    aria-expanded="false" aria-label="Toggle navigation" onclick="back()">
                                <span class="navbar-toggler-icon"></span>
                            </button>
                        </div>

                        <div id="logo-mobile" class="col col-sm-4">
                            <a href="./"> <img src="./resrc/logo.png" alt="#"></a>
                        </div>

                        <div id="login-mobile" class="col col-sm-4">
                            <svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="currentColor"
                                 class="bi bi-person-circle text-black-50" viewBox="0 0 16 16">
                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                            <path fill-rule="evenodd"
                                  d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                            </svg>
                        </div>

                    </div>
                    <div class="collapse navbar-collapse" id="navbarSupportedContent">
                        <div class="container-fluid">
                            <div class="row" style="text-align: center;">

                                <div class="col-lg-2" id="search-mobile">
                                    <br>
                                    <form action="/index.jsp" method="get" class="input-group">
                                        <input type="text" class="form-control radius-10" placeholder="search"
                                               aria-label="search" name="search" aria-describedby="basic-addon2">

                                        <button type="submit" class="input-group-text radius-10" id="basic-addon2">
                                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16"
                                                 fill="currentColor" class="bi bi-search" viewBox="0 0 16 16">
                                            <path
                                                d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                            </svg>
                                        </button>
                                    </form>
                                    <br>
                                </div>

                                <div class="col-lg-1"></div>
                                <div class="col-lg-2">
                                    <p>GIỚI THIỆU</p>
                                </div>
                                <div class="col-lg-2">
                                    <p>THƯƠNG HIỆU</p>
                                </div>
                                <div class="col-lg-2">
                                    <p>NƯỚC HOA</p>
                                </div>
                                <div class="col-lg-2">
                                    <p>KIẾN THỨC</p>
                                </div>
                                <div class="col-lg-2">
                                    <p>LIÊN HỆ</p>
                                </div>
                                <div class="col-lg-1"></div>
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </header>
        <main>
            <%String status = "hết hàng"; %>
            <c:if test="${product.getQuantity() > 0}">
                <%status = "còn hàng";%>
            </c:if>
            <div id="section">
                <div id="path">
                    <p id="path1">Home > Men’s perfume > ${product.getName()}</p>
                </div>

                <div id="body" class="row">
                    <div id="left" class="col col-lg-4">
                        <img src="${product.getImg_path1()}" alt="#" id="img-main">
                        <div id="box-list">
                            <img src="${product.getImg_path1()}" alt="#" id="img1"
                                 onclick="setImageSource('img1')">
                            <img src="${product.getImg_path2()}" alt="#" id="img2"
                                 onclick="setImageSource('img2')">
                            <img src="${product.getImg_path3()}" alt="#" id="img3"
                                 onclick="setImageSource('img3')">
                        </div>
                    </div>
                    <div id="right" class="col col-lg-8">
                        <h3 class="fw-bold">${product.getName()}</h3>
                        <p><span class="fw-bold">Trạng thái:</span>&nbsp;<%=status%></p>
                        <p><span class="fw-bold">Giá:</span>&nbsp;${product.getPriceS()}đ</p>
                        <div id="paragraph">
                            <p>${product.getIntro()}</p>
                        </div>
                        <p><span class="fw-bold">Xuất xứ:</span>&nbsp;${product.getOrigin()}</p>
                        <form action="CartController" method="post">
                            <p class="fw-bold">Số lượng</p>
                            <div>
                                <input type="button" value="-" onclick="decrementQuantity()">
                                <input type="text" id="quantity" name="quantity" value="1"  style="width: 3rem; text-align: center;pointer-events:none;">
                                <input type="button" value="+" onclick="incrementQuantity()">
                            </div>
                            <button type="submit" name="action" value="add-${product.getProID()}">ADD TO CARD</button>
                        </form >

                    </div>
                </div>
            </div>




        </main>
        <footer>
            <!-- place footer here -->
        </footer>
        <script>
            function back() {
                var banner = document.getElementById('path');
                if (banner.style.zIndex == "-1") {
                    delay(300).then(() => banner.style.zIndex = "0");
                } else {
                    banner.style.zIndex = "-1";
                }
            }
            function delay(time) {
                return new Promise(resolve => setTimeout(resolve, time));
            }
            function setImageSource(id) {
                var main = document.getElementById('img-main');
                main.src = document.getElementById(id).src;
            }
            function decrementQuantity() {
                var quantity = document.getElementById('quantity');
                if (parseInt(quantity.value) > 1) {
                    quantity.value = parseInt(quantity.value) - 1;
                }
            }

            function incrementQuantity() {
                var quantity = document.getElementById('quantity');
                quantity.value = parseInt(quantity.value) + 1;
            }
        </script>
        <!-- Bootstrap JavaScript Libraries -->
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
                integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3" crossorigin="anonymous">
        </script>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.min.js"
                integrity="sha384-7VPbUDkoPSGFnVtYi0QogXtr74QeVeeIs99Qfg5YCF+TidwNdjvaKZX19NZ/e6oz" crossorigin="anonymous">
        </script>
    </body>

</html>
