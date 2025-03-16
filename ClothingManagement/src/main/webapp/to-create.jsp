<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="keywords" content="Site keywords here">
    <meta name="description" content="#">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">



    <!-- Font -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:ital,wght@0,300;0,400;0,500;0,700;0,900;1,300;1,400;1,500;1,700;1,900&display=swap"
          rel="stylesheet">

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


        h1 {
            text-align: center;
            color: #333;
        }

        .container {
            width: 100%;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        .form-row {
            display: flex;
            margin-bottom: 20px;
            justify-content: space-between;
        }

        .form-row label {
            font-weight: bold;
            margin-bottom: 8px;
            color: #333;
            width: 30%;
        }

        .form-row input,
        .form-row select {
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            width: 65%;
        }

        .form-buttons {
            text-align: center;
            margin-top: 203px;
        }

        button {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        button:hover {
            background-color: #45a049;
        }

        .suggestion-box {
            position: absolute;
            background-color: white;
            border: 1px solid #ccc;
            width: 65%;
            z-index: 10;
            margin-left: 311px;
            margin-top: 33px;
        }

        .suggestion-item {
            padding: 8px;
            cursor: pointer;
        }

        .suggestion-item:hover {
            background-color: #ddd;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table th, table td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }

        table th {
            background-color: #f2f2f2;
        }

        table tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .add-product-btn {
            background-color: #008CBA;
            margin-top: 10px;
        }

        .add-product-btn:hover {
            background-color: #007B8C;
        }

        /* Red color scheme for Action button and header */
        .delete-btn {
            background-color: #f44336;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 4px;
            cursor: pointer;
        }

        .delete-btn:hover {
            background-color: #d32f2f;
        }

        #suggestionBox {
            border: 1px solid #ccc;
            max-height: 300px;
            overflow-y: auto;
            position: absolute;
            background-color: white;
            width: 100%;
            z-index: 1000;
            box-shadow: 0 2px 5px rgba(0,0,0,0.2);
        }

        .error-message {
            color: red;  /* Set the text color to red */
            font-size: 14px;  /* Optional: set the font size */
            font-weight: bold;  /* Optional: make the error message bold */
            margin-top: 10px;  /* Optional: add some spacing */
        }

    </style>
</head>
<body id="sherah-dark-light">
<jsp:include page="include/sidebar.jsp"></jsp:include>
<jsp:include page="include/header.jsp"></jsp:include>
<!-- sherah Dashboard -->
<section class="sherah-adashboard sherah-show">
    <div class="container">
        <div class="row align-items-center justify-content-between">
            <div class="col-6">
                <div class="sherah-breadcrumb mg-top-30">
                    <h2 class="sherah-breadcrumb__title">Create new transfer order</h2>
                    <ul class="sherah-breadcrumb__list">
                        <li><a href="homepage.jsp">Home</a></li>
                    </ul>
                </div>
            </div>
        </div>
        <div style="margin-top: 50px;">
            <form action="/ClothingManagement_war/TOCreate" method="post">

                <!-- Transfer Order ID -->
                <div class="form-row">
                    <label for="toID">Transfer Order ID:</label>
                    <input type="text" id="toID" name="toID" value="${nextToID}" readonly>
                </div>

                <!-- Created Date -->
                <div class="form-row">
                    <label for="createdDate">Created Date:</label>
                    <input type="date" id="createdDate" name="createdDate" value="<%= java.time.LocalDate.now() %>" readonly>
                </div>

                <!-- Created By (Employee ID) -->
                <div class="form-row">
                    <label for="createdBy">Created By:</label>
                    <input type="text" id="createdByName" name="Name" value="${sessionScope.employeeName}" readonly>
                    <input type="hidden" id="createdBy" name="createdBy" value="${sessionScope.employeeId}">
                </div>


                <!-- Origin Bin -->
                <div class="form-row">
                    <label for="originBinID">Origin Bin:</label>
                    <select name="originBinID" id="originBinID">
                        <option value="">Select Origin Bin</option>
                        <c:forEach var="binId" items="${binIds}">
                            <option value="${binId}">${binId}</option>
                        </c:forEach>
                    </select>

                </div>

                <!-- Final Bin -->
                <div class="form-row">
                    <label for="finalBinID">Final Bin:</label>
                    <select name="finalBinID" id="finalBinID">
                        <option value="">Select Final Bin</option>
                        <c:forEach var="binId" items="${binIds}">
                            <option value="${binId}">${binId}</option>
                        </c:forEach>
                    </select>

                </div>

                <!-- Product Detail Search and Table -->
                <div class="form-row">
                    <label for="productDetailSearch">Search Product Detail ID:</label>
                    <input type="text" id="productDetailSearch" name="productDetailSearch" autocomplete="off">
                    <div id="suggestionBox" class="suggestion-box" style="display: none;"></div>
                </div>

                <!-- Product Detail ID, Product Name, Weight, and Quantity Table -->
                <table id="productDetailsTable">
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Product Detail ID</th>
                        <th>Product Name</th>
                        <th>Weight</th>
                        <th>Quantity</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody id="productDetailsBody">

                    </tbody>
                </table>

                <div class="form-buttons">
                    <button type="submit">Create Transfer Order</button>
                </div>

                <c:if test="${not empty errorGeneral}">
                    <p class="error-message">${errorGeneral}</p>
                </c:if>

                <c:if test="${not empty successMessage}">
                    <p style="color:green;">${successMessage}</p>
                </c:if>
                <c:if test="${not empty errorToID}">
                    <p class="error-message">${errorToID}</p>
                </c:if>
                <c:if test="${not empty errorBinSame}">
                    <p class="error-message">${errorBinSame}</p>
                </c:if>
                <c:if test="${not empty errorQuantity1}">
                    <p class="error-message">${errorQuantity1}</p>
                </c:if>
                <c:if test="${not empty errorQuantity2}">
                    <p class="error-message">${errorQuantity2}</p>
                </c:if>
                <c:if test="${not empty errorDetail}">
                    <p class="error-message">${errorDetail}</p>
                </c:if>
                <c:if test="${not empty errorBin}">
                    <p class="error-message">${errorBin}</p>
                </c:if>
                <c:if test="${not empty errorCapacity}">
                    <p class="error-message">${errorCapacity}</p>
                </c:if>

            </form>
        </div>

    </div>
</section>
<script>
    // Access the hidden input field with the employee ID
    var employeeID = document.getElementById('createdBy').value;
    var employeeName = document.getElementById('createdByName').value;
    console.log("employee Name: " + employeeName)

    // Log the employee ID to the console
    console.log("Employee ID: " + employeeID);
</script>
<script>
    let rowCount = 1;  // Start row number from 1

    document.addEventListener("DOMContentLoaded", function () {
        const originBinSelect = document.getElementById("originBinID");
        const finalBinSelect = document.getElementById("finalBinID");
        const searchInput = document.getElementById("productDetailSearch");
        const suggestionBox = document.getElementById("suggestionBox");

        // Function to update the available options in Final Bin dropdown
        function updateBinSelections() {
            const originBinID = originBinSelect.value;
            const finalBinID = finalBinSelect.value;

            // If Origin Bin is selected, disable that option in Final Bin
            Array.from(finalBinSelect.options).forEach(option => {
                if (originBinID === option.value && originBinID !== "") {
                    option.disabled = true;
                } else {
                    option.disabled = false;
                }
            });

            // If "Select Origin Bin" is selected, enable all options in Final Bin
            if (originBinID === "") {
                Array.from(finalBinSelect.options).forEach(option => {
                    option.disabled = false;
                });
            }
        }

        // Call the function initially to set the disabled states correctly when page loads
        updateBinSelections();

        // Add event listeners for changes in both bin selects
        originBinSelect.addEventListener("change", updateBinSelections);
        finalBinSelect.addEventListener("change", updateBinSelections);

        // Add an error message div after the search input
        const searchRow = searchInput.parentElement;
        const errorDiv = document.createElement("div");
        errorDiv.className = "error-message";
        errorDiv.id = "searchError";
        errorDiv.style.display = "none";
        searchRow.appendChild(errorDiv);

        function searchProductDetails() {
            const searchValue = searchInput.value.trim();
            const originBinID = originBinSelect.value;

            // Check if origin bin is selected
            if (originBinID === "") {
                errorDiv.textContent = "You must choose an Origin Bin first.";
                errorDiv.style.display = "block";
                suggestionBox.style.display = "none";
                return;
            } else {
                errorDiv.style.display = "none";
            }

            if (searchValue.length > 0) {
                const url = new URL("/ClothingManagement_war/searchProductDetail", window.location.origin);
                url.searchParams.append("query", searchValue);
                url.searchParams.append("binID", originBinID); // Pass the selected bin ID

                fetch(url.toString())
                    .then(response => {
                        if (!response.ok) {
                            throw new Error(`HTTP error! Status: ${response.status}`);
                        }
                        return response.json();
                    })
                    .then(data => {
                        suggestionBox.innerHTML = "";

                        if (data.success && data.suggestions && data.suggestions.length > 0) {
                            suggestionBox.style.display = "block";
                            data.suggestions.forEach(suggestion => {
                                console.log("Full suggestion object:", JSON.stringify(suggestion));

                                const div = document.createElement("div");
                                div.classList.add("suggestion-item");

                                // Extract raw values
                                const productDetailID = suggestion.productDetailID;
                                const productName = suggestion.productName;
                                const weight = suggestion.weight;
                                const quantity = suggestion.quantity;

                                console.log("Raw productDetailID:", productDetailID, typeof productDetailID);
                                console.log("Raw productName:", productName, typeof productName);
                                console.log("Raw weight:", weight, typeof weight);
                                console.log("Raw quantity:", quantity, typeof quantity);

                                // Create display values with explicit checking
                                let displayID = "No ID";
                                if (productDetailID !== undefined && productDetailID !== null && productDetailID !== "") {
                                    displayID = productDetailID;
                                }

                                let displayName = "No Name";
                                if (productName !== undefined && productName !== null && productName !== "") {
                                    displayName = productName;
                                }

                                let displayWeight = "No Weight";
                                if (weight !== undefined && weight !== null) {
                                    displayWeight = weight.toString() + " kg";
                                }

                                // Create display value for quantity
                                let displayQuantity = "No Quantity";
                                if (quantity !== undefined && quantity !== null) {
                                    displayQuantity = quantity.toString();
                                }


                                // Set text content using plain string concatenation
                                div.textContent = displayID + " - " + displayName + " - " + displayWeight + " - Quantity: " + displayQuantity;

                                div.onclick = () => selectSuggestion(suggestion);
                                suggestionBox.appendChild(div);
                            });
                        } else {
                            suggestionBox.innerHTML = "<div class='suggestion-item'>No products found in this bin</div>";
                            suggestionBox.style.display = "block";
                        }
                    })
                    .catch(error => {
                        console.error("Error fetching suggestions:", error);
                        suggestionBox.innerHTML = `<div class="error-message">Unable to fetch results. Please try again.</div>`;
                        suggestionBox.style.display = "block";
                    });
            } else {
                suggestionBox.style.display = "none";
            }
        }

        // Prevent searching if no origin bin is selected
        searchInput.addEventListener("focus", function() {
            const originBinID = originBinSelect.value;
            if (originBinID === "") {
                errorDiv.textContent = "You must choose an Origin Bin first.";
                errorDiv.style.display = "block";
                this.blur(); // Remove focus from the search input
            } else {
                errorDiv.style.display = "none";
            }
        });

        // Attach event listener for the search input
        searchInput.addEventListener("input", searchProductDetails);


        function selectSuggestion(suggestion) {
            const tableBody = document.getElementById("productDetailsBody");

            // Check if this product already exists in the table
            const existingProduct = Array.from(tableBody.getElementsByTagName("tr")).some(row => {
                const productDetailInput = row.querySelector('input[name="productDetailID[]"]');
                return productDetailInput && productDetailInput.value === suggestion.productDetailID;
            });

            // If the product is already in the table, don't add a new row
            if (existingProduct) {
                alert("This product is already added.");
                searchInput.value = "";
                return;
            }

            // Add a new row with product details
            const newRow = document.createElement("tr");

            const cell1 = document.createElement("td");
            cell1.textContent = rowCount;

            const cell2 = document.createElement("td");
            const productDetailInput = document.createElement("input");
            productDetailInput.setAttribute("type", "text");
            productDetailInput.setAttribute("name", "productDetailID[]");
            productDetailInput.setAttribute("readonly", true);
            productDetailInput.value = suggestion.productDetailID;
            cell2.appendChild(productDetailInput);

            const cell3 = document.createElement("td");
            const productNameSpan = document.createElement("span");
            productNameSpan.setAttribute("id", `productName${rowCount}`);
            productNameSpan.textContent = suggestion.productName;
            cell3.appendChild(productNameSpan);

            const cell4 = document.createElement("td");
            const productWeightSpan = document.createElement("span");
            productWeightSpan.setAttribute("id", `productWeight${rowCount}`);
            productWeightSpan.textContent = suggestion.weight;
            cell4.appendChild(productWeightSpan);

            const cell5 = document.createElement("td");
            const quantityInput = document.createElement("input");
            quantityInput.setAttribute("type", "number");
            quantityInput.setAttribute("name", "quantity[]");
            quantityInput.setAttribute("value", 1);  // Set initial quantity to 1
            quantityInput.setAttribute("min", 1);    // Minimum quantity is 1
            quantityInput.setAttribute("required", true);

            // Store available quantity as a data attribute
            quantityInput.dataset.availableQuantity = suggestion.quantity || 0;

            console.log(`display: ${displayQuantity}, qty: ${quantity}, suggest: ${suggest.quantity}`);

            // Store available quantity as a data attribute
            quantityInput.dataset.availableQuantity = suggestion.quantity || 0;

            // Define displayQuantity from the suggestion
            const displayQuantity = suggestion.quantity || 0;

            // Add error message element
            const errorSpan = document.createElement("span");
            errorSpan.className = "quantity-error";
            errorSpan.style.color = "red";
            errorSpan.style.display = "none";
            errorSpan.textContent = `Maximum available quantity: ${displayQuantity}`;

            // Add input event listener to validate quantity
            quantityInput.addEventListener("input", function() {
                const inputValue = parseInt(this.value) || 0;
                const availableQty = parseInt(this.dataset.availableQuantity) || 0;

                if (inputValue > availableQty) {
                    errorSpan.style.display = "block";
                    this.setCustomValidity(`Maximum available quantity is ${availableQty}`);
                } else {
                    errorSpan.style.display = "none";
                    this.setCustomValidity("");
                }
            });

            cell5.appendChild(quantityInput);
            cell5.appendChild(errorSpan);

            const cell6 = document.createElement("td");
            const deleteButton = document.createElement("button");
            deleteButton.textContent = "Remove";
            deleteButton.classList.add("delete-btn");
            deleteButton.type = "button"; // Prevent form submission

            // Add event listener to delete button
            deleteButton.onclick = function () {
                tableBody.removeChild(newRow);  // Remove the row from the table
                updateRowNumbers();  // Reassign row numbers after deletion
            };

            cell6.appendChild(deleteButton);

            // Append the cells to the new row
            newRow.appendChild(cell1);
            newRow.appendChild(cell2);
            newRow.appendChild(cell3);
            newRow.appendChild(cell4);
            newRow.appendChild(cell5);
            newRow.appendChild(cell6);

            // Append the new row to the table body
            tableBody.appendChild(newRow);

            rowCount++;

            // Clear search input and hide suggestion box
            searchInput.value = "";
            suggestionBox.style.display = "none";
        }

        // Function to update row numbers after adding/removing a product
        function updateRowNumbers() {
            const rows = document.querySelectorAll("#productDetailsBody tr");
            rows.forEach((row, index) => {
                row.querySelector('td').textContent = index + 1;  // Update row number starting from 1
            });
            rowCount = rows.length + 1;  // Update rowCount to next available row number
        }

        // Validation before form submission
        const form = document.querySelector('form');
        form.addEventListener('submit', function (event) {
            const productDetailsBody = document.getElementById("productDetailsBody");
            const rows = productDetailsBody.querySelectorAll('tr');
            const originBinID = originBinSelect.value;
            const finalBinID = finalBinSelect.value;

            // Check if origin bin is selected
            if (originBinID === "") {
                event.preventDefault();
                alert("Please select an Origin Bin.");
                return;
            }

            // Check if final bin is selected
            if (finalBinID === "") {
                event.preventDefault();
                alert("Please select a Final Bin.");
                return;
            }

            // If there are no rows (products) in the table, prevent form submission
            if (rows.length === 0) {
                event.preventDefault(); // Prevent the form from submitting
                alert("Please add at least one product to the transfer order.");
                return;
            }

            // Validate quantities
            let hasInvalidQuantity = false;
            let errorMessage = "";

            rows.forEach(row => {
                const quantityInput = row.querySelector('input[name="quantity[]"]');
                const productName = row.querySelector('[id^="productName"]').textContent;
                const inputValue = parseInt(quantityInput.value) || 0;
                const availableQty = parseInt(quantityInput.dataset.availableQuantity) || 0;

                if (inputValue <= 0) {
                    hasInvalidQuantity = true;
                    errorMessage = "All product quantities must be greater than 0.";
                } else if (inputValue > availableQty) {
                    hasInvalidQuantity = true;
                    errorMessage = `Cannot transfer ${inputValue} units of ${productName}. Maximum available: ${availableQty}`;
                }
            });

            if (hasInvalidQuantity) {
                event.preventDefault();
                alert(errorMessage);
                return;
            }
        });
    });
</script>
<script src="js/jquery.min.js"></script>
<script src="js/jquery-migrate.js"></script>
<script src="js/jquery-ui.min.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/charts.js"></script>
<script src="js/final-countdown.min.js"></script>
<script src="js/fancy-box.min.js"></script>
<script src="js/fullcalendar.min.js"></script>
<script src="js/datatables.min.js"></script>
<script src="js/circle-progress.min.js"></script>
<script src="js/jquery-jvectormap.js"></script>
<script src="js/jvector-map.js"></script>
<script src="js/main.js"></script>
</body>
</html>