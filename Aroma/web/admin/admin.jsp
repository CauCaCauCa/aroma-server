<%-- 
    Document   : admin
    Created on : Feb 9, 2023, 10:21:36 PM
    Author     : dotie
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfumer Shop Admin Page</title>
        <!-- Add any CSS or JavaScript here -->
        <link rel="stylesheet" href="admin/css/admin.css">
        <jsp:useBean id="a" class="data.ProMng" scope="request"/>
    </head>

    <body>
        <header>
            <!-- Add header content here, such as a logo and navigation -->
        </header>
        <main>
            <h1>Aroma Shop Admin Page</h1>
            <section>
                <button onclick="changeDisplay('form1')">
                    <h2>Add a New Perfume</h2>
                </button>
                <br><br>
                <form action="admin/admin.jsp" id="form1" style="display: none;">
                    <!-- Add form fields for adding a new perfume, such as name, description, and image URL -->
                    <input type="text" placeholder="Perfume Name" name="name">
                    <input type="text" placeholder="Perfume Brand" name="brand">
                    <input type="text" placeholder="Perfume Price" name="price">
                    <input type="text" placeholder="Perfume Quantity" name="quantity">
                    <!-- tag use vietnamese here, be careful when get parameter -->
                    <textarea placeholder="Perfume Description" name="address"></textarea> 
                    <!-- ------------------------------------------------------ -->
                    <input type="text" placeholder="Perfume Origin" name="origin">
                    <input type="number" placeholder="Perfume ForGender 1:men, 2:women, 3:unisex" name="type">
                    <input type="text" placeholder="Image_1 URL" name="img1_path">
                    <input type="file" name="img1">
                    <input type="text" placeholder="Image_2 URL" name="img2_path">
                    <input type="file" name="img2">
                    <input type="text" placeholder="Image_3 URL" name="img3_path">
                    <input type="file" name="img3">

                    <button type="submit">Add Perfume</button>
                </form>
            </section>
            <section>
                <h2>Manage Existing Perfumes</h2>
                <form action="SearchController" method="get">
                    <input type="text" name="query" placeholder="Search..." style="width: 300px; display: inline-block;">
                    <button type="submit" style="display: inline-block;">Go</button>
                </form>

                <table>
                    <thead>
                        <tr>
                            <th>Perfume Name</th>
                            <th>Type</th>
                            <th>Price</th>
                            <th>Quantity</th>
                            <th>Modifiers</th>
                        </tr>
                    </thead>
                    <tbody>
                        <!-- Use JavaScript to dynamically populate the table with existing perfumes -->
                        <c:forEach items="${a.takePerfumeList(query)}" var="e">
                            <tr>
                            <td>${e.name}</td>
                            <td>${e.typeID}</td>
                            <td>${e.price}</td>
                            <td>${e.quantity}</td>
                            <td>
                                <button onclick="window.location = 'admin/modifier.jsp?id=${e.proID}'">Open</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </section>
        </main>
        <!-- we dont need footer here ok -->
        <script>
            function changeDisplay(id) {
                var element = document.getElementById(id);
                if (element.style.display == 'none') {
                    element.style.display = 'block';
                } else {
                    element.style.display = 'none';
                }
            }
        </script>
    </body>

</html>
