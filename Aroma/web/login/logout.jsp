<%-- 
    Document   : logout
    Created on : Feb 9, 2023, 11:20:36 PM
    Author     : dotie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>

        <style>
            body {
                padding: 0;
                margin: 0;
            }

            #addPromt {
                position: absolute;
                width: 100vw;
                height: 100vh;
                background-color: rgba(158, 220, 202, 0.611);
            }

            #addPromt-box {
                position: relative;
                top: 11rem;
                left: 40%;
                padding-top: 1rem;
                text-align: center;
                background-color: rgb(177, 184, 195);
                border-radius: 6px;
                width: 20%;
                height: 300px;
                animation-name: move_right;
                animation-duration: 1.5s;
            }

            #addPromt-box img {
                width: 30%;
                height: auto;
            }

            #addPromt-box p {
                font-weight: bold;
            }

            #addPromt-box button {
                width: 40%;
                height: 3rem;
                border-radius: 5px;
                font-weight: bold;
                font-size: larger;
                margin: 0 5% 0 5%;
            }

            /* animation */
            @keyframes move_right {
                0% {
                    top: 0px;
                }

                100% {
                    top: 11rem;
                }
            }
        </style>
    </head>

    <body>
        <div id="addPromt">
            <form action="../LoginController" id="addPromt-box">
                <img src="../login/logout.png" alt="#"><br><br><br><br>
                <p>Bạn muốn đăng xuất?</p><br><br>
               <div style="display: flex; flex-direction: row;">
                 <button type="submit" name="logout" value="true">Có</button>
                 <button type="submit" name="cancle-logout" value="true">Không</button>
               </div>
            </form>
        </div>

    </body>

</html>
