<%-- 
    Document   : modifier
    Created on : Feb 9, 2023, 11:29:32 PM
    Author     : dotie
--%>

<%@page import="modules.Product"%>
<%@page import="data.ProMng"%>
<%@page import="data.CookieMng"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="UTF-8">
        <title>Product Modification</title>
        <style>
            form {
                display: flex;
                flex-direction: column;
            }

            input,
            textarea {
                margin: 0.5rem;
            }

            input {
                height: 2rem;
            }

            textarea {
                height: 3rem;
            }

            button {
                height: 3rem;
                margin: 1rem;
            }
            section{
                display: flex;
                flex-direction: row;
            }
            #left {
                width: 45%;
            }

            #middle {
                background-color: gray;
                width: 1rem;
                margin: 0 1.5rem 0 1rem;
            }
        </style>
    </head>

    <body>
        <%
            if (CookieMng.find("admin", request.getCookies()).matches("")) {
                response.sendRedirect("../admin");
            }
        %>
        <%
            String id = request.getParameter("id");
            ProMng mng = new ProMng();
            Product pro = mng.takeProduct(id);
        %>
        <section>
            <div id="left">
                <h2>Modify Perfume Details</h2>
                <form action=".././AdminController" method="post">
                    <!-- Add form fields for adding a new perfume, such as name, description, and image URL -->
                    <input type="text" placeholder="Perfume Name" name="name">
                    <input type="text" placeholder="Perfume Price" name="price">
                    <input type="text" placeholder="Perfume Quantity" name="quantity">
                    <!-- tag use vietnamese here, be careful when get parameter -->
                    <textarea placeholder="Perfume Description" name="intro"></textarea>
                    <!-- ------------------------------------------------------ -->
                    <input type="text" placeholder="Perfume Origin" name="origin">
                    <input type="number" placeholder="Perfume ForGender 1:men, 2:women, 3:unisex" name="typeID" id="type" onchange="limit('type',1,3)">
                    <!-- <input type="text" placeholder="Image_1 URL" name="img1_path">
                    <input type="file" name="img1">
                    <input type="text" placeholder="Image_2 URL" name="img2_path">
                    <input type="file" name="img2">
                    <input type="text" placeholder="Image_3 URL" name="img3_path">
                    <input type="file" name="img3"> -->
                    <br>
                    <button type="submit" name="setPro" value="<%=id%>">Set Perfume</button>
                </form>
            </div>
            <div id="middle"></div>
            <div id="right">
                <h2>Current Perfume Details</h2>
                <div id="now">
                    <p id="name">Name: <span><%=pro.getName()%></span></p>
                    <p id="price">Price: <span><%=pro.getPrice()%></span></p>
                    <p id="quantity">Quantity: <span><%=pro.getQuantity()%></span></p>
                    <p id="intro">Intro: <span><%=pro.getIntro()%></span></p>
                    <p id="origin">Origin: <span><%=pro.getOrigin()%></span></p>
                    <p id="type">Type: <span><%=pro.getTypeID()%></span></p>
                </div>
            </div>
        </section>

        <script>
            function limit(id, min, max){
                var ele = document.getElementById(id);
                if (parseInt(ele.value) < min || parseInt(ele.value) > max) {
                    ele.value = '';
                    alert('Limit range (1,3) for input TYPE');
                }
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
