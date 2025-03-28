
<%@ page import="org.example.clothingmanagement.entity.ProductDetail" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="#">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Site Title -->
    <title>DashBoard</title>

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
    <style>
        /* General styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 20px;
        }

        /* SearchInventoryDocServlet form */
        form {
            margin-bottom: 20px;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        .pagination a {
            padding: 8px 12px;
            margin: 0 5px;
            border: 1px solid #ddd;
            text-decoration: none;
            color: #333;
        }
        .pagination a:active {
            background-color: #09ad95;
            color: white;
            font-weight: bold;
        }
        .pagination a:hover {
            background-color: #ddd;
        }

        .search-input {
            padding: 8px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 4px;
        }

        button:hover {
            background-color: #0056b3;
        }

        /* Table container */
        .sherah-table {
            background: white;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* Table styling */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td a {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }

        td a:hover {
            text-decoration: underline;
        }

        /* Alternate row colors */
        tbody tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        /* No product message */
        td[colspan="9"] {
            font-size: 16px;
            font-weight: bold;
        }
    </style>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body id="sherah-dark-light">
<div class="sherah-body-area">
    <jsp:include page="include/sidebar.jsp"></jsp:include>
    <jsp:include page="include/header.jsp"></jsp:include>
    <!-- sherah Dashboard -->
    <section class="sherah-adashboard sherah-show">
        <div class="container">
            <div class="row">
                <div class="col-12 sherah-main__column">
                    <div class="sherah-body">
                        <!-- Dashboard Inner -->
                        <div class="sherah-dsinner">
                            <div class="row mg-top-10">
                                <div class="col-lg-3 col-md-6 col-12">
                                    <!-- Progress Card -->
                                    <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                        <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                            <svg class="sherah-color3__fill" xmlns="http://www.w3.org/2000/svg" width="30.359" height="30.366" viewBox="0 0 30.359 30.366">
                                                <g id="Group_69" data-name="Group 69" transform="translate(-242.991 -23.995)">
                                                    <path id="Path_244" data-name="Path 244" d="M249.517,188.942c.854.139,1.633.271,2.413.391.448.069.945.14.856.737s-.609.506-1.042.441c-.721-.107-1.44-.232-2.227-.36,0,.35,0,.662,0,.974a.622.622,0,0,1-.693.7q-2.579,0-5.158,0c-.464,0-.674-.266-.674-.718q0-5.217,0-10.434c0-.494.264-.711.745-.709,1.166,0,2.332-.013,3.5.008a2.439,2.439,0,0,1,2.017,1.223c.265-.168.508-.33.758-.479a4.631,4.631,0,0,1,5.791.613,1.642,1.642,0,0,0,1.167.425c1.581-.027,3.162-.011,4.743-.01,2.125,0,3.145,1.373,2.527,3.394a.879.879,0,0,0,.027.213c.215-.144.406-.249.572-.386,1.524-1.258,3.038-2.527,4.565-3.781a2.38,2.38,0,1,1,3.021,3.675c-2.271,1.779-4.522,3.583-6.826,5.317a8.274,8.274,0,0,1-6.68,1.494c-.408-.072-.817-.143-1.227-.2s-.834-.176-.778-.693c.062-.571.521-.554.957-.488.547.082,1.092.172,1.638.255a7.061,7.061,0,0,0,5.569-1.452c2.177-1.674,4.331-3.378,6.491-5.074a1.2,1.2,0,1,0-1.5-1.842c-1.6,1.319-3.188,2.656-4.8,3.96a1.569,1.569,0,0,1-.9.338c-2.391.027-4.782.021-7.173.006a1.128,1.128,0,0,1-.691-.225.59.59,0,0,1-.085-.577,1.007,1.007,0,0,1,.663-.361c1.462-.032,2.924-.016,4.387-.016.2,0,.4.007.593,0a1.191,1.191,0,0,0,1.208-1.2,1.178,1.178,0,0,0-1.239-1.165c-1.877-.012-3.755.014-5.632-.022a2.192,2.192,0,0,1-.992-.381c-.387-.231-.71-.567-1.094-.8-1.629-1.006-3.114-.64-4.628.712a.708.708,0,0,0-.162.356,1.561,1.561,0,0,0-.007.354C249.517,185.066,249.517,186.98,249.517,188.942Zm-1.189,1.668c0-2.792.005-5.514,0-8.236a1.1,1.1,0,0,0-.946-1.183c-1.053-.058-2.111-.016-3.154-.016v9.435Z" transform="translate(0 -137.466)" />
                                                    <path id="Path_245" data-name="Path 245" d="M336.414,31.727A7.71,7.71,0,1,1,328.756,24,7.725,7.725,0,0,1,336.414,31.727Zm-8.331,4.064a2.433,2.433,0,0,1-1.723-1.929c-.08-.415-.053-.847.453-.942s.656.256.724.71a1.161,1.161,0,0,0,1.579.955,1.183,1.183,0,0,0,.762-1.268,1.212,1.212,0,0,0-1.2-1.019,2.371,2.371,0,0,1-2.274-1.821c-.3-1.19.281-2.2,1.677-2.886V25.243a6.486,6.486,0,0,0,0,12.919Zm1.24,2.387a6.524,6.524,0,0,0,5.892-6.927c-.2-3.155-3.04-6.041-5.886-5.971v2.34a2.421,2.421,0,0,1,1.741,2.139.593.593,0,0,1-.507.741c-.4.056-.619-.185-.672-.578a1.991,1.991,0,0,0-.062-.348,1.187,1.187,0,0,0-1.286-.822,1.185,1.185,0,0,0-.071,2.335,3.567,3.567,0,0,0,.413.031,2.368,2.368,0,0,1,.836,4.5c-.136.067-.276.126-.4.181Z" transform="translate(-68.751 0)"/>
                                                    <path id="Path_246" data-name="Path 246" d="M338.739,264.607c-.144-.236-.43-.5-.392-.7a.836.836,0,0,1,.6-.519c.156-.017.494.352.5.552,0,.225-.281.452-.44.679Z" transform="translate(-84.043 -210.998)" />
                                                </g>
                                            </svg>
                                        </div>
                                        <div class="sherah-progress-card__content">
                                            <div class="sherah-progress-card__heading">
                                                <span class="sherah-pcolor">Total PO Value</span>
                                                <h4 class="sherah-progress-card__title"><b class="count-animate">${totalOrderValue} VND</b></h4>
                                            </div>
                                            <div class="sherah-progress-card__button">
                                                <p class="sherah-progress-card__text sherah-color3">
                                                </p>
<%--                                                <a href="#" class="sherah-see-all">View net earnings</a>--%>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>
                                <div class="col-lg-3 col-md-6 col-12">
                                    <!-- Progress Card -->
                                    <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                        <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                            <svg class="sherah-color2__fill" xmlns="http://www.w3.org/2000/svg" width="26.672" height="30.636" viewBox="0 0 26.672 30.636">
                                                <g id="Group_70" data-name="Group 70" transform="translate(-272.518 -5.918)">
                                                    <path id="Path_251" data-name="Path 251" d="M285.855,36.554q-5.443,0-10.885,0a2.152,2.152,0,0,1-2.447-2.412q-.01-9.39.014-18.78a3.035,3.035,0,0,1,.383-1.406c1.292-2.312,2.644-4.59,3.947-6.9a2.07,2.07,0,0,1,1.993-1.141q7,.028,13.995,0a2.075,2.075,0,0,1,1.991,1.147c1.327,2.338,2.7,4.652,4.022,6.991a2.4,2.4,0,0,1,.306,1.124q.028,9.48.011,18.959a2.152,2.152,0,0,1-2.445,2.414Q291.3,36.556,285.855,36.554ZM297.39,15.348H274.351c-.012.211-.03.387-.031.562q0,9.057-.011,18.113c0,.577.186.746.758.744q10.73-.025,21.461-.011c.858,0,.86,0,.86-.861q0-8.937,0-17.874ZM284.969,7.724c-2.077,0-4.089-.01-6.1.017a.778.778,0,0,0-.516.374c-.971,1.646-1.92,3.305-2.871,4.963a2.945,2.945,0,0,0-.152.376h9.64Zm11.423,5.748a1.4,1.4,0,0,0-.08-.258c-1-1.741-2-3.485-3.029-5.212a.773.773,0,0,0-.576-.267c-1.832-.02-3.664-.013-5.5-.009a2.737,2.737,0,0,0-.373.048v5.7Z" />
                                                    <path id="Path_252" data-name="Path 252" d="M351.281,143.152l3.6-3.605c.141-.141.275-.288.426-.418a.889.889,0,1,1,1.262,1.253c-.4.439-.837.851-1.259,1.273q-1.582,1.583-3.166,3.164c-.63.627-1.05.632-1.669.02-.636-.629-1.274-1.258-1.9-1.9a.886.886,0,0,1-.063-1.365.906.906,0,0,1,1.328.1C350.317,142.133,350.762,142.615,351.281,143.152Z" transform="translate(-66.652 -117.042)" />
                                                </g>
                                            </svg>
                                        </div>
                                        <div class="sherah-progress-card__content">
                                            <div class="sherah-progress-card__heading">
                                                <span class="sherah-pcolor">Total PO</span>
                                                <h4 class="sherah-progress-card__title"><b class="count-animate">${totalOrders} Orders</b></h4>
                                            </div>
                                            <div class="sherah-progress-card__button">
                                                <p class="sherah-progress-card__text sherah-color2">
                                                </p>
<%--                                                <a href="#" class="sherah-see-all">View all orders</a>--%>
                                            </div>

                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>
                                <div class="col-lg-3 col-md-6 col-12">
                                    <!-- Progress Card -->
                                    <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                        <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                            <svg class="sherah-color1__fill" xmlns="http://www.w3.org/2000/svg" width="35.176" height="30.636" viewBox="0 0 35.176 30.636">
                                                <g id="Group_1177" data-name="Group 1177" transform="translate(-207.977 -44.521)">
                                                    <path id="Path_253" data-name="Path 253" d="M218.474,150.774c3.084-3.627,11.1-3.619,14.16-.016.113-.172.217-.333.324-.493a4.348,4.348,0,0,1,3.515-2.1,12.57,12.57,0,0,1,3.269.165,4.445,4.445,0,0,1,3.4,4.375c.019,2.426.01,4.853,0,7.28a2.083,2.083,0,0,1-2.259,2.276c-1.808.022-3.617.016-5.425,0-.419,0-.63.082-.767.542a2.316,2.316,0,0,1-2.413,1.657c-1.579.019-3.159.006-4.739.006q-4.224,0-8.447,0a2.493,2.493,0,0,1-2.761-1.87.806.806,0,0,0-.625-.312c-1.739-.025-3.479-.012-5.219-.015-1.79,0-2.51-.716-2.511-2.482,0-2.289,0-4.578,0-6.868a4.633,4.633,0,0,1,4.607-4.8c.343-.014.687.007,1.03-.008A4.854,4.854,0,0,1,218.474,150.774Zm7.083,11.624c2.172,0,4.345,0,6.517,0,.424,0,.705-.08.7-.594-.023-1.966.05-3.937-.055-5.9a5.977,5.977,0,0,0-4.737-5.523,15.559,15.559,0,0,0-3.272-.2,6.2,6.2,0,0,0-6.351,6.325c-.023,1.692.02,3.385-.017,5.076-.014.644.219.826.836.818C221.3,162.381,223.431,162.4,225.558,162.4Zm15.5-2.242c0-2.623.055-5.2-.025-7.779a2.373,2.373,0,0,0-2.232-2.155,14.355,14.355,0,0,0-1.85-.035,2.591,2.591,0,0,0-2.6,3.3,21.233,21.233,0,0,1,.49,5.781c0,.287,0,.575,0,.885Zm-24.813,0c.014-.264.033-.486.035-.708a22.529,22.529,0,0,1,.495-5.987,2.59,2.59,0,0,0-2.632-3.277c-.457-.015-.915-.013-1.372,0a2.581,2.581,0,0,0-2.727,2.773c-.007,2.2,0,4.392,0,6.588,0,.2.021.4.033.612Z" transform="translate(0 -89.312)"/>
                                                    <path id="Path_254" data-name="Path 254" d="M298.589,44.523a5.972,5.972,0,1,1-6.069,5.89A5.967,5.967,0,0,1,298.589,44.523Zm-.1,2.068a3.9,3.9,0,1,0,3.912,3.931A3.889,3.889,0,0,0,298.486,46.591Z" transform="translate(-72.929 0)"/>
                                                    <path id="Path_255" data-name="Path 255" d="M224.343,84.1a3.77,3.77,0,1,1,3.749-3.755A3.764,3.764,0,0,1,224.343,84.1Zm-.03-2.066a1.7,1.7,0,1,0-1.693-1.7A1.688,1.688,0,0,0,224.313,82.03Z" transform="translate(-10.849 -27.636)"/>
                                                    <path id="Path_256" data-name="Path 256" d="M400.423,76.561a3.769,3.769,0,1,1-3.855,3.644A3.755,3.755,0,0,1,400.423,76.561Zm1.613,3.752a1.7,1.7,0,1,0-1.67,1.719A1.685,1.685,0,0,0,402.036,80.312Z" transform="translate(-162.683 -27.637)"/>
                                                </g>
                                            </svg>
                                        </div>
                                        <div class="sherah-progress-card__content">
                                            <div class="sherah-progress-card__heading">
                                                <span class="sherah-pcolor">Total Suppliers</span>
                                                <h4 class="sherah-progress-card__title"><b class="count-animate">${totalSuppliers}</b></h4>
                                            </div>
                                            <div class="sherah-progress-card__button">
                                                <p class="sherah-progress-card__text sherah-color1">
                                                </p>
                                                <a href="managesupplier" class="sherah-see-all">See details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>
                                <div class="col-lg-3 col-md-6 col-12">
                                    <!-- Progress Card -->
                                    <div class="sherah-progress-card sherah-border sherah-default-bg mg-top-30">
                                        <div class="sherah-progress-card__icon sherah-default-bg sherah-border">
                                            <svg class="sherah-color4__fill" xmlns="http://www.w3.org/2000/svg" width="35.176" height="30.636" viewBox="0 0 35.176 30.636">
                                                <g id="Group_1177" data-name="Group 1177" transform="translate(-207.977 -44.521)">
                                                    <path id="Path_253" data-name="Path 253" d="M218.474,150.774c3.084-3.627,11.1-3.619,14.16-.016.113-.172.217-.333.324-.493a4.348,4.348,0,0,1,3.515-2.1,12.57,12.57,0,0,1,3.269.165,4.445,4.445,0,0,1,3.4,4.375c.019,2.426.01,4.853,0,7.28a2.083,2.083,0,0,1-2.259,2.276c-1.808.022-3.617.016-5.425,0-.419,0-.63.082-.767.542a2.316,2.316,0,0,1-2.413,1.657c-1.579.019-3.159.006-4.739.006q-4.224,0-8.447,0a2.493,2.493,0,0,1-2.761-1.87.806.806,0,0,0-.625-.312c-1.739-.025-3.479-.012-5.219-.015-1.79,0-2.51-.716-2.511-2.482,0-2.289,0-4.578,0-6.868a4.633,4.633,0,0,1,4.607-4.8c.343-.014.687.007,1.03-.008A4.854,4.854,0,0,1,218.474,150.774Zm7.083,11.624c2.172,0,4.345,0,6.517,0,.424,0,.705-.08.7-.594-.023-1.966.05-3.937-.055-5.9a5.977,5.977,0,0,0-4.737-5.523,15.559,15.559,0,0,0-3.272-.2,6.2,6.2,0,0,0-6.351,6.325c-.023,1.692.02,3.385-.017,5.076-.014.644.219.826.836.818C221.3,162.381,223.431,162.4,225.558,162.4Zm15.5-2.242c0-2.623.055-5.2-.025-7.779a2.373,2.373,0,0,0-2.232-2.155,14.355,14.355,0,0,0-1.85-.035,2.591,2.591,0,0,0-2.6,3.3,21.233,21.233,0,0,1,.49,5.781c0,.287,0,.575,0,.885Zm-24.813,0c.014-.264.033-.486.035-.708a22.529,22.529,0,0,1,.495-5.987,2.59,2.59,0,0,0-2.632-3.277c-.457-.015-.915-.013-1.372,0a2.581,2.581,0,0,0-2.727,2.773c-.007,2.2,0,4.392,0,6.588,0,.2.021.4.033.612Z" transform="translate(0 -89.312)"/>
                                                    <path id="Path_254" data-name="Path 254" d="M298.589,44.523a5.972,5.972,0,1,1-6.069,5.89A5.967,5.967,0,0,1,298.589,44.523Zm-.1,2.068a3.9,3.9,0,1,0,3.912,3.931A3.889,3.889,0,0,0,298.486,46.591Z" transform="translate(-72.929 0)"/>
                                                    <path id="Path_255" data-name="Path 255" d="M224.343,84.1a3.77,3.77,0,1,1,3.749-3.755A3.764,3.764,0,0,1,224.343,84.1Zm-.03-2.066a1.7,1.7,0,1,0-1.693-1.7A1.688,1.688,0,0,0,224.313,82.03Z" transform="translate(-10.849 -27.636)"/>
                                                    <path id="Path_256" data-name="Path 256" d="M400.423,76.561a3.769,3.769,0,1,1-3.855,3.644A3.755,3.755,0,0,1,400.423,76.561Zm1.613,3.752a1.7,1.7,0,1,0-1.67,1.719A1.685,1.685,0,0,0,402.036,80.312Z" transform="translate(-162.683 -27.637)"/>
                                                </g>
                                            </svg>
                                        </div>
                                        <div class="sherah-progress-card__content">
                                            <div class="sherah-progress-card__heading">
                                                <span class="sherah-pcolor">Total Employees</span>
                                                <h4 class="sherah-progress-card__title"><b class="count-animate">${totalEmployees}</b></h4>
                                            </div>
                                            <div class="sherah-progress-card__button">
                                                <p class="sherah-progress-card__text sherah-color4">
                                                </p>
                                                <a href="manageemployee" class="sherah-see-all">See details</a>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Progress Card -->
                                </div>

                            </div>

                            <div class="row sherah-gap-30">

                                <div class="col-lg-6 col-12">
                                    <!-- Charts Two -->
                                    <div class="charts-main sherah-default-bg charts-home-two sherah-border mg-top-30">
                                        <div class="charts-main__heading  mg-btm-20 charts-main__heading--v2">
                                            <h3 class="sherah-heading__title">Total Po Value Months</h3>
                                            <div class="sherah-charts-tabs" style="display: flex; align-items: center; gap: 10px;">
                                                <input type="date" id="startDate" style="width: 130px; padding: 5px; font-size: 14px;">
                                                <input type="date" id="endDate" style="width: 130px; padding: 5px; font-size: 14px;">
                                                <button onclick="filterPO()" style="padding: 5px 10px; font-size: 14px;">Lọc</button>
                                            </div>
                                            <!-- End Topbar -->
                                        </div>
                                        <div class="tab-content" id="nav-tabContent">
                                            <div class="tab-pane fade show active" id="sherah_tab1" role="tabpanel" aria-labelledby="sherah_tab1">
                                                <div class="sherah-chart__inside sherah-chart__total--sales">
                                                    <canvas id="poChart"></canvas>
                                                    <script>
                                                        // Lấy dữ liệu từ Servlet
                                                        var totalPOByMonthJson = '<%= request.getAttribute("totalPOByMonthJson") %>';
                                                        try {
                                                            var poData = JSON.parse(totalPOByMonthJson);
                                                            var ctx = document.getElementById("poChart").getContext("2d");
                                                            var poChart = new Chart(ctx, {
                                                                type: "bar",
                                                                data: {
                                                                    labels: Object.keys(poData), // Tháng
                                                                    datasets: [{
                                                                        label: "Tổng giá trị PO",
                                                                        data: Object.values(poData), // Giá trị
                                                                        backgroundColor: "rgba(54, 162, 235, 0.6)",
                                                                        borderColor: "rgba(54, 162, 235, 1)",
                                                                        borderWidth: 1
                                                                    }]
                                                                },
                                                                options: {
                                                                    responsive: true,
                                                                    scales: {
                                                                        y: {
                                                                            beginAtZero: true
                                                                        }
                                                                    }
                                                                }
                                                            });
                                                        } catch (error) {
                                                            console.error("Lỗi khi parse JSON:", error);
                                                        }
                                                    </script>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End Charts Two -->
                                </div>
<%--                                <div class="col-lg-6 col-12">--%>
<%--                                    <!-- Charts One -->--%>
<%--                                    <div class="charts-main sherah-default-bg charts-home-two sherah-border mg-top-30">--%>
<%--                                        <!-- Top Heading -->--%>
<%--                                        <div class="charts-main__heading  mg-btm-20">--%>
<%--                                            <h3 class="sherah-heading__title"></h3>--%>
<%--                                        </div>--%>
<%--                                        <div class="charts-main__one">--%>
<%--                                            <div class="tab-content" id="nav-tabContent">--%>
<%--                                                <div class="tab-pane fade show active" id="sherah-chart__t1" role="tabpanel" aria-labelledby="sherah-chart__t1">--%>
<%--                                                    <div class="sherah-chart__inside sherah-chart__monthly--states">--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                        </div>--%>
<%--                                    </div>--%>
<%--                                    <!-- End Charts One -->--%>
<%--                                </div>--%>
                            </div>

                            <div class="row">
                                <div class="col-12">
                                    <form action="dashboard" method="GET">
                                        <label for="product-search">Input productId:</label>
                                        <input type="text" id="product-search" name="productId" class="search-input" placeholder="Nhập mã sản phẩm...">
                                        <button type="submit">Search</button>
                                    </form>
                                    <div class="sherah-table sherah-default-bg sherah-border mg-top-30">
                                        <div class="sherah-table__heading">
                                            <h3 class="sherah-heading__title mb-0">Product Information</h3>
                                        </div>
                                        <div>
                                            <h3>
                                                Tổng số lượng theo ProductDetailId:
                                            </h3>
                                            <ul>
                                                <p>Số lượng: <c:out value="${binDetail.totalQuantity}" /></p>
                                            </ul>
                                        </div>
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>ProductId</th>
                                                <th>Product Name</th>
                                                <th>Bin</th>
                                                <th>Section</th>
                                                <th>Color</th>
                                                <th>Size</th>
                                                <th>Available Quantity</th>
                                                <th>Blocked Quantity</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:choose>
                                                <c:when test="${not empty productList}">
                                                    <c:forEach var="product" items="${productList}">
                                                        <tr>
                                                            <td>
                                                                <a href="#">${product.id}</a>
                                                            </td>
                                                            <td>
                                                                <span>${product.productName}</span>
                                                            </td>
                                                            <td >
                                                                <span>${product.binId}</span>
                                                            </td>
                                                            <td >
                                                                <span style="font-weight: bold;">${product.sectionId}</span>
                                                            </td>
                                                            <td>
                                                                <span>${product.color}</span>
                                                            </td>
                                                            <td>
                                                                <span>${product.size}</span>
                                                            </td>
                                                            <td>
                                                                <span>${product.availableQuantity}</span>
                                                            </td>
                                                            <td>
                                                                <span>${product.blockedQuantity}</span>
                                                            </td>
                                                        </tr>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td colspan="9" style="text-align: center; color: green;">No product found</td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-12">
                                    <div class="sherah-table sherah-default-bg sherah-border mg-top-30">
                                        <div class="sherah-table__heading">
                                            <h3 class="sherah-heading__title mb-0">Bin Information</h3>
                                        </div>
                                        <table>
                                            <thead>
                                            <tr>
                                                <th>BinID</th>
                                                <th>TotalWeightInBin</th>
                                                <th>MaxCapacity</th>
                                                <th>% Full</th>
                                                <th>% Not Full</th>
                                            </tr>
                                            </thead>
                                            <tbody>
                                            <c:choose>
                                                <c:when test="${not empty list}">
                                                        <c:forEach var="bin" items="${list}">
                                                            <tr>
                                                                <td>${bin.binId}</td>
                                                                <td>${bin.weight}</td>
                                                                <td>${bin.maxCapacity}</td>
                                                                <td>${bin.binFullPercentage}%</td>
                                                                <td>${bin.binRemainingPercentage}%</td>
                                                            </tr>
                                                        </c:forEach>
                                                </c:when>
                                                <c:otherwise>
                                                    <tr>
                                                        <td colspan="5" style="text-align: center; color: green;">No data avaiable</td>
                                                    </tr>
                                                </c:otherwise>
                                            </c:choose>
                                            </tbody>
                                        </table>
                                        <div class="pagination">
                                            <c:if test="${currentPage > 1}">
                                                <a href="dashboard?page=${currentPage - 1}">Previous</a>
                                            </c:if>

                                            <c:forEach var="i" begin="1" end="${totalPages}">
                                                <a href="dashboard?page=${i}" class="${i == currentPage ? 'active' : ''}">${i}</a>
                                            </c:forEach>

                                            <c:if test="${currentPage < totalPages}">
                                                <a href="dashboard?page=${currentPage + 1}">Next</a>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- End Dashboard Inner -->
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- End sherah Dashboard -->
</div>

<!-- Sherah Scripts -->
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
<script src="js/slickslider.min.js"></script>
<script src="js/main.js"></script>

<script>
    function filterPO() {
        var startDate = document.getElementById("startDate").value;
        var endDate = document.getElementById("endDate").value;

        if (!startDate || !endDate) {
            alert("Vui lòng chọn khoảng thời gian!");
            return;
        }
        window.location.href = "dashboard?startDate=" + startDate + "&endDate=" + endDate;
    }
</script>
</body>
</html>