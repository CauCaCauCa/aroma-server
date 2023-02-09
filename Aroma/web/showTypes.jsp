<%-- 
    Document   : showTypes
    Created on : Feb 3, 2023, 1:24:20 PM
    Author     : dotie
--%>

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
    <link rel="stylesheet" href="./resrc/css/showTypes.css">


</head>

<body>
    <header>
        <div id="head" class="container-fluid">
            <div class="row">
                <div class="col-lg-1"></div>

                <div class="col-lg-2" id="search">

                    <form action="/index.html" method="get" class="input-group">
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
                    <a href="./"> <img src="./resrc/logo.png" alt="#" width="100%" height="auto"></a>
                </div>

                <div class="col-lg-3"></div>

                <div class="col-lg-2 " id="login">

                    <a href="#" class="text-white">
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

                    <a href="#" class="text-white">
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
                                <form action="/index.html" method="get" class="input-group">
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

        <div id="path">
            <p id="path1">Home > Men’s perfume</p>
        </div>
        <div class="row">
            <div class="col col-lg-3" id="filter">
                <h5 class="text-center">BỘ LỌC</h5>
                <div class="detail">

                    <div id="search-brand">
                        <form class="d-flex" role="search">
                            <input class="form-control me-2" type="search" placeholder="Tìm thương hiệu" aria-label="Search">
                            <button type="submit" class="input-group-text radius-10" id="basic-addon2">
                                <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor"
                                    class="bi bi-search" viewBox="0 0 16 16">
                                    <path
                                        d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
                                </svg>
                            </button>
                        </form>
                    </div>

                    <div id="result">
                        <input type="checkbox" id="vehicle1" name="vehicle1" value="Bike">
                        <label for="vehicle1"> I have a bike</label><br>
                        <input type="checkbox" id="vehicle2" name="vehicle2" value="Car">
                        <label for="vehicle2"> I have a car</label><br>
                        <input type="checkbox" id="vehicle3" name="vehicle3" value="Boat">
                        <label for="vehicle3"> I have a boat</label><br><br>
                    </div>



                </div>
            </div>
            <div style="width: 2rem;"></div>
            <div class="col col-lg-8" id="product">
                <h5 class="text-center">NƯỚC HOA NAM</h5>
                <div id="sort">
                    <p>Xếp theo:</p>
                    <p>
                        <select class="form-select" aria-label="Default select example"
                            style="width: 150px; height: 35px;">
                            <option selected value="name">Theo tên</option>
                            <option value="ascending">Giá tăng</option>
                            <option value="descending ">Giá giảm</option>
                        </select>
                    </p>
                </div>
                <div class="detail">
                    <div class="row">

                        <div class="card">
                            <img src="./perfume/man/Armaf Club De Nuit Intense For Man/img1.png" class="card-img-top"
                                alt="...">
                            <div class="card-body" id="card1">
                                <a href="#">
                                    <h6 class="card-title">Armaf Club De Nuit Intense For Man 100ml</h6>
                                </a>
                                <p class="card-text">1.000.000đ</p>
                            </div>
                            <div class="card-body">
                                <a href="#" class="btn">Add to cart</a>
                            </div>
                        </div>


                        <div class="card rounded-circle" id="more">
                            <a href="#">
                                <svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" fill="currentColor"
                                    class="bi bi-arrow-right-circle" viewBox="0 0 16 16" style="margin: 0.4rem;">
                                    <path fill-rule="evenodd"
                                        d="M1 8a7 7 0 1 0 14 0A7 7 0 0 0 1 8zm15 0A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM4.5 7.5a.5.5 0 0 0 0 1h5.793l-2.147 2.146a.5.5 0 0 0 .708.708l3-3a.5.5 0 0 0 0-.708l-3-3a.5.5 0 1 0-.708.708L10.293 7.5H4.5z" />
                                </svg>
                            </a>
                        </div>


                    </div>
                </div>
            </div>
        </div>

    </main>
    <footer>
        <!-- place footer here -->
    </footer>

    <script>
        function back() {
            var banner = document.getElementById('path1');
            if (banner.style.zIndex == "-1") {
                delay(300).then(() => banner.style.zIndex = "0");
            } else {
                banner.style.zIndex = "-1";
            }
        }
        function delay(time) {
            return new Promise(resolve => setTimeout(resolve, time));
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