<%-- 
    Document   : index
    Created on : Jan 9, 2023, 9:05:16 PM
    Author     : dotie
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            #log-box {
                background-color: rgb(210, 221, 221);
                width: 300px;
                padding: 2% 0% 1% 2%;
                margin: 10% 0 0 37.5%;
            }

            #log-box div {
                display: inline-block;
                width: 100px;
            }

            #log-submit {
                margin-left: 18px;
            }

            #error {
                display: inline-block;
                width: 200px;
                color: red;
            }

            @media screen and (max-width: 600px) {
                #log-box {
                    background-color: rgb(210, 221, 221);
                    width: 35%;
                    padding: 3%;
                    margin: 10% 32.5% 10% 32.5%;
                }

                #log-box div {
                    display: inline-block;
                    width: 4.3em;
                }

                #log-submit {
                    margin-left: 10px;
                }

                #error {
                    width: 100px;
                }
            }
        </style>
    </head>

    <body>
        <div id="log-box">
            <form action="../LoginController" method="post">
                <div>User:</div> <input type="text" name="user">
                <br><br>
                <div>Password:</div> <input type="password" name="password">
                <br>
                <p id="error">
                    ${noice}
                </p>
                <input type="submit" value="loggin">
            </form>
        </div>
    </body>
</html>
