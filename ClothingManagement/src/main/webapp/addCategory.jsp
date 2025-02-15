<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/29/2025
  Time: 5:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.text.SimpleDateFormat" %>
<%@ page session="true" %>

<!DOCTYPE html>
<html>
<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="#">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <title>Add Category</title>

    <style>
        /* Căn giữa form */
        .container {
            width: 60%;
            margin: auto;
            text-align: center;
        }

        /* Căn giữa và tạo viền cho form thêm danh mục */
        .add-category-form {
            width: 60%;
            margin: auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            background: #fff;
            text-align: center;
        }

        .add-category-form label {
            font-weight: bold;
            display: block;
            margin-bottom: 5px;
        }

        .add-category-form input {
            width: 100%;
            padding: 8px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .add-category-form button {
            padding: 10px 15px;
            background-color: #28a745;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
        }

        .add-category-form button:hover {
            background-color: #218838;
        }

    </style>
    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap" rel="stylesheet">

    <!-- Fav Icon -->
    <link rel="icon" href="img/favicon.png">

    <!-- sherah Stylesheet -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <link rel="stylesheet" href="css/font-awesome-all.min.css">
    <link rel="stylesheet" href="css/charts.min.css">
    <link rel="stylesheet" href="css/datatables.min.css">
    <link rel="stylesheet" href="css/jvector-map.css">
    <link rel="stylesheet" href="css/slickslider.min.css">
    <link rel="stylesheet" href="css/jquery-ui.css">
    <link rel="stylesheet" href="css/reset.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body id="sherah-dark-light">
<jsp:include page="include/sidebar.jsp"></jsp:include>
<jsp:include page="include/header.jsp"></jsp:include>

<h2 style="text-align: center;">Add Category</h2>

<div class="container">
    <form action="AddCategoryServlet" method="post" class="add-category-form">
        <%--@declare id="categoryname"--%><label for="categoryName">Category Name:</label>
        <input type="text" name="categoryName" required>
        <button type="submit">Add Category</button>
    </form>
</div>



<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/charts.js"></script>
<script src="js/datatables.min.js"></script>
<script src="js/circle-progress.min.js"></script>
<script src="js/jquery-jvectormap.js"></script>
<script src="js/jvector-map.js"></script>
<script src="js/main.js"></script>
</body>
</html>

