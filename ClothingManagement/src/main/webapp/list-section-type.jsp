<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>SectionType List</title>

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

<div class="sherah-body-area">
    <jsp:include page="include/sidebar.jsp"></jsp:include>
    <jsp:include page="include/header.jsp"></jsp:include>
    <!-- sherah Dashboard -->
    <section class="sherah-adashboard sherah-show">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="sherah-body">
                        <!-- Dashboard Inner -->
                        <div class="sherah-dsinner">
                            <!-- Sherah Breadcrumb -->
                            <%--                            <form action="search-product" method="get">--%>
                            <%--                                <div class="input-group mb-3">--%>
                            <%--                                    <input type="text" class="form-control" placeholder="Search for a product..." name="searchQuery" id="searchQuery">--%>
                            <%--                                    <button class="btn btn-primary" type="submit">Search</button>--%>
                            <%--                                </div>--%>
                            <%--                            </form>--%>

                            <div class="sherah-breadcrumb mg-top-30">
                                <h2 class="sherah-breadcrumb__title">Bin</h2>
                                <%--                                <ul class="sherah-breadcrumb__list">--%>
                                <%--                                    <li><a href="#">Home</a></li>--%>
                                <%--                                    <li class="active"><a href="profile-info.html">Personal Information</a></li>--%>
                                <%--                                </ul>--%>
                            </div>
                            <!-- End Sherah Breadcrumb -->
                            <!-- Product List -->
                            <div class="sherah-table sherah-page-inner sherah-border sherah-default-bg mg-top-25">
                                <table id="sherah-table__vendor" class="sherah-table__main sherah-table__main-v3">
                                    <thead class="sherah-table__head">
                                    <tr>
                                        <th class="sherah-table__column-2 sherah-table__h2">BinId</th>
                                        <th class="sherah-table__column-2 sherah-table__h2">Name</th>
                                        <th class="sherah-table__column-2 sherah-table__h2">Description</th>
                                        <th class="sherah-table__column-2 sherah-table__h2">Action</th>

                                    </tr>
                                    </thead>
                                    <tbody class="sherah-table__body">
                                    <c:if test="${not empty list}">
                                        <c:forEach var="st" items="${list}">
                                            <tr>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc">${st.sectionTypeId}</p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc">${st.sectionTypeName}</p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc">${st.description}</p>
                                                    </div>
                                                </td>
                                                <td class="sherah-table__column-2 sherah-table__data-2">
                                                    <div class="sherah-table__product-content">
                                                        <p class="sherah-table__product-desc">
                                                            <a href="${pageContext.request.contextPath}/view-list-section?id=${st.sectionTypeId}">
                                                                Detail
                                                            </a>
                                                        </p>
                                                    </div>
                                                </td>

                                            </tr>
                                        </c:forEach>

                                    </c:if>
                                    <c:if test="${empty list}">
                                        <tr>
                                            <td colspan="4" class="text-center">No bin available</td>
                                        </tr>
                                    </c:if>
                                    </tbody>
                                </table>
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

<!-- sherah Scripts -->
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    window.onload = function () {
        const alertMessage = '<%= session.getAttribute("alertMessage") != null ? session.getAttribute("alertMessage") : "" %>';
        const alertType = '<%= session.getAttribute("alertType") != null ? session.getAttribute("alertType") : "" %>';
        if (alertMessage.trim() !== "" && alertType.trim() !== "") {
            Swal.fire({
                icon: alertType,
                title: alertMessage,
                showConfirmButton: false,
                timer: 2000
            });
        }
        <%
            session.removeAttribute("alertMessage");
            session.removeAttribute("alertType");
        %>
    };

    function confirmDelete(url) {
        if (confirm("Are you sure you want to delete this product?")) {
            window.location.href = url;
        }
        return false;
    }

    function confirmRecovery(url) {
        if (confirm("Are you sure you want to recover this product?")) {
            window.location.href = url;
        }
        return false;
    }
</script>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</body>
</html>
