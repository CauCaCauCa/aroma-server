<%-- 
    Document   : modifier
    Created on : Feb 9, 2023, 11:29:32 PM
    Author     : dotie
--%>

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
    <h2>Modify Perfume Details</h2>
    <section>
        <div id="left">
            <form action="admin/admin.jsp">
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
                <br>
                <button type="submit">Add Perfume</button>
            </form>
        </div>
        <div id="middle"></div>
        <div id="right">

        </div>
    </section>
</body>

</html>
