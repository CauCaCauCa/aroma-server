<%-- 
    Document   : admin
    Created on : Feb 9, 2023, 10:21:36 PM
    Author     : dotie
--%>
<%@page import="data.CookieMng"%>
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
        <jsp:useBean id="admin" class="admin.AdminAction" scope="request"/>

    </head>

    <body>
        <main>
            <h1>Aroma Shop Admin Page</h1>
            <section>
                <button onclick="changeDisplay('form1')">
                    <h2>Add a New Perfume</h2>
                </button>
                <button onclick="changeDisplay('form2')">
                    <h2>Manager Invoices</h2>
                </button>
                <br><br>
                <form action="AdminController" id="form1" method="post" enctype='multipart/form-data' style="display: none">
                    <!-- Add form fields for adding a new perfume, such as name, description, and image URL -->
                    <input type="text" placeholder="Perfume Name" name="name" required>
                    <input type="text" placeholder="Perfume Brand" name="brand" required>
                    <input type="text" placeholder="Perfume Price" name="price" required>
                    <input type="text" placeholder="Perfume Quantity" name="quantity" required>
                    <!-- tag use vietnamese here, be careful when get parameter -->
                    <textarea placeholder="Perfume Description" name="description" required></textarea> 
                    <!-- ------------------------------------------------------ -->
                    <input type="text" placeholder="Perfume Origin" name="origin" required>
                    <input type="number"placeholder="Perfume ForGender 1:men, 2:women, 3:unisex" name="type" required>
                    <label for="img1">Image 1</label>
                    <input type="file" name="img1" required>
                    <label for="img2">Image 2</label>
                    <input type="file" name="img2">
                    <label for="img3">Image 3</label>
                    <input type="file" name="img3">
                    <button type="submit" name="action" value="createProduct-null">Add Perfume</button>
                </form>
                <br>
                <form action="AdminController" method="post" id="form2">
                    <table>
                        <thead>
                            <tr>
                                <th>PHONE</th>
                                <th>NAME</th>
                                <th>DETAIL</th>
                                <th>TIME_ORDER</th>
                                <th>ADDRESS</th>
                                <th>PAYMENT</th>
                                <th>ISINVOICE</th>
                                <th>CONFIG</th>
                            </tr>
                        </thead>
                        <tbody>

                            <c:forEach items="${admin.invoices}" var="e">
                                <tr>
                                    <td>${e.phone}</td>
                                    <td>${e.name}</td>
                                    <td>${e.detail}</td>
                                    <td>${e.time_order}</td>
                                    <td>${e.address}</td>
                                    <td>${e.payment}</td>
                                    <td>${e.isInvoice}</td>
                                    <td>
                                        <button type="submit" name="action" value="setStatusInvoice-${e.phone}-${e.time_order}">Verify</button>
                                        <button type="submit" name="action" value="removeInvoice-${e.phone}-${e.time_order}">Remove</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
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
                                    <button onclick="window.location = 'AdminController?id=${e.proID}'">Remove</button>
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
