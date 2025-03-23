<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored="false" %>
<div class="sherah-body-area">
    <!-- sherah Admin Menu -->
    <div class="sherah-smenu">
        <!-- Admin Menu -->
        <div class="admin-menu">

            <!-- Logo -->
            <div class="logo sherah-sidebar-padding">
                <a href="#!">
                    <img class="sherah-logo__main" src="img/logo.png" alt="#">
                </a>
                <div class="sherah__sicon close-icon d-xl-none">
                    <svg width="9" height="15" viewBox="0 0 9 15" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <path d="M6.19855 7.41927C4.22908 5.52503 2.34913 3.72698 0.487273 1.90989C0.274898 1.70227 0.0977597 1.40419 0.026333 1.11848C-0.0746168 0.717537 0.122521 0.36707 0.483464 0.154695C0.856788 -0.0643475 1.24249 -0.0519669 1.60248 0.199455C1.73105 0.289929 1.84438 0.404212 1.95771 0.514685C4.00528 2.48321 6.05189 4.45173 8.09755 6.4212C8.82896 7.12499 8.83372 7.6145 8.11565 8.30687C6.05856 10.2878 4.00052 12.2677 1.94152 14.2467C1.82724 14.3562 1.71391 14.4696 1.58439 14.5591C1.17773 14.841 0.615842 14.781 0.27966 14.4324C-0.056522 14.0829 -0.0946163 13.5191 0.202519 13.1248C0.296802 12.9991 0.415847 12.8915 0.530129 12.781C2.29104 11.0868 4.05194 9.39351 5.81571 7.70212C5.91761 7.60593 6.04332 7.53355 6.19855 7.41927Z"></path>
                    </svg>
                </div>
            </div>
            <!-- Main Menu -->
            <div class="admin-menu__one sherah-sidebar-padding">
                <!-- Nav Menu -->
                <div class="menu-bar">
                    <ul class="menu-bar__one sherah-dashboard-menu" id="sherahMenu">
                        <c:if test="${account.getRoleId() == 1}">
                            <li><a href="dashboard" class="collapsed"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg" --%>
                                                     width="18.075" height="18.075" viewBox="0 0 18.075 18.075">
                                                <g id="Icon" transform="translate(0 0)">
                                                <path id="Path_29" data-name="Path 29"
                                                      d="M6.966,6.025H1.318A1.319,1.319,0,0,1,0,4.707V1.318A1.319,1.319,0,0,1,1.318,0H6.966A1.319,1.319,0,0,1,8.284,1.318V4.707A1.319,1.319,0,0,1,6.966,6.025ZM1.318,1.13a.188.188,0,0,0-.188.188V4.707a.188.188,0,0,0,.188.188H6.966a.188.188,0,0,0,.188-.188V1.318a.188.188,0,0,0-.188-.188Zm0,0"/>
                                                <path id="Path_30" data-name="Path 30"
                                                      d="M6.966,223.876H1.318A1.319,1.319,0,0,1,0,222.558V214.65a1.319,1.319,0,0,1,1.318-1.318H6.966a1.319,1.319,0,0,1,1.318,1.318v7.908A1.319,1.319,0,0,1,6.966,223.876Zm-5.648-9.414a.188.188,0,0,0-.188.188v7.908a.188.188,0,0,0,.188.188H6.966a.188.188,0,0,0,.188-.188V214.65a.188.188,0,0,0-.188-.188Zm0,0"
                                                      transform="translate(0 -205.801)"/>
                                                <path id="Path_31" data-name="Path 31"
                                                      d="M284.3,347.357H278.65a1.319,1.319,0,0,1-1.318-1.318V342.65a1.319,1.319,0,0,1,1.318-1.318H284.3a1.319,1.319,0,0,1,1.318,1.318v3.389A1.319,1.319,0,0,1,284.3,347.357Zm-5.648-4.9a.188.188,0,0,0-.188.188v3.389a.188.188,0,0,0,.188.188H284.3a.188.188,0,0,0,.188-.188V342.65a.188.188,0,0,0-.188-.188Zm0,0"
                                                      transform="translate(-267.542 -329.282)"/>
                                                <path id="Path_32" data-name="Path 32"
                                                      d="M284.3,10.544H278.65a1.319,1.319,0,0,1-1.318-1.318V1.318A1.319,1.319,0,0,1,278.65,0H284.3a1.319,1.319,0,0,1,1.318,1.318V9.226A1.319,1.319,0,0,1,284.3,10.544ZM278.65,1.13a.188.188,0,0,0-.188.188V9.226a.188.188,0,0,0,.188.188H284.3a.188.188,0,0,0,.188-.188V1.318a.188.188,0,0,0-.188-.188Zm0,0"
                                                      transform="translate(-267.542)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">DashBoard</span></span></a></span>
                            </li>
                        </c:if>
                        <li><a href="#!" class="collapsed" data-bs-toggle="collapse"
                               data-bs-target="#menu-item_vendors"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="22.038" height="17.943" viewBox="0 0 22.038 17.943">
                                                <g id="Icon" transform="translate(-325.516 -274.72)">
                                                <path id="Path_221" data-name="Path 221"
                                                      d="M340.751,385.008c.034.446.08.824.088,1.2a.755.755,0,0,1-.86.88q-6.792.005-13.585,0c-.619,0-.88-.279-.878-.907a7.668,7.668,0,0,1,12.323-5.909c.071.054.145.1.241.172a5.8,5.8,0,0,1,2.906-1.574,5.524,5.524,0,0,1,6.566,5.177c.016.69-.23.954-.916.956-1.775,0-3.549,0-5.324,0Zm-1.467.59a6.1,6.1,0,0,0-6.281-5.43c-3.108.1-6.1,2.872-5.9,5.43Zm-.127-4.139c.349.615.686,1.16.97,1.731a.524.524,0,0,0,.55.351c1.649-.013,3.3-.006,4.947-.008.117,0,.234-.019.394-.034a4.053,4.053,0,0,0-6.861-2.042Z"
                                                      transform="translate(0 -94.43)"/>
                                                <path id="Path_222" data-name="Path 222"
                                                      d="M363.308,278.9a4.192,4.192,0,1,1,4.144,4.208A4.177,4.177,0,0,1,363.308,278.9Zm1.472-.009a2.721,2.721,0,1,0,2.718-2.7A2.717,2.717,0,0,0,364.779,278.892Z"
                                                      transform="translate(-34.322)"/>
                                                <path id="Path_223" data-name="Path 223"
                                                      d="M474.686,302.114a3.121,3.121,0,1,1-3.123,3.119A3.121,3.121,0,0,1,474.686,302.114Zm1.649,3.123a1.651,1.651,0,1,0-1.665,1.648A1.652,1.652,0,0,0,476.335,305.237Z"
                                                      transform="translate(-132.638 -24.879)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Section</span></span> <span
                                class="sherah__toggle"></span></a></span>
                            <!-- Dropdown Menu -->
                            <div class="collapse sherah__dropdown" id="menu-item_vendors" data-bs-parent="#sherahMenu">
                                <ul class="menu-bar__one-dropdown">
                                    <li><a href="${pageContext.request.contextPath}/view-list-section-type"><span
                                            class="menu-bar__text"><span class="menu-bar__name">List SectionType</span></span></a>
                                    </li>
<%--                                    <li><a href="vendor-list.html"><span class="menu-bar__text"><span--%>
<%--                                            class="menu-bar__name">Vendor List</span></span></a></li>--%>
<%--                                    <li><a href="vendor-profile.html"><span class="menu-bar__text"><span--%>
<%--                                            class="menu-bar__name">Vendor Profile</span></span></a></li>--%>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#!" class="collapsed" data-bs-toggle="collapse"
                               data-bs-target="#menu-item__customers"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="21.732" height="18" viewBox="0 0 21.732 18">
                                                <g id="Icon" transform="translate(-525.662 -352.927)">
                                                <path id="Path_208" data-name="Path 208"
                                                      d="M536.507,455.982q-4.327,0-8.654,0a1.953,1.953,0,0,1-2.188-2.2c0-.99-.005-1.979,0-2.969a3.176,3.176,0,0,1,3.309-3.315c.875,0,1.749.052,2.624.062a.451.451,0,0,0,.33-.168,3.237,3.237,0,0,1,2.94-1.527q1.654.024,3.309,0a3.262,3.262,0,0,1,2.947,1.52.621.621,0,0,0,.449.153,30.091,30.091,0,0,1,3.212.044,3.044,3.044,0,0,1,2.594,3.014c.021,1.117.014,2.234.005,3.351a1.909,1.909,0,0,1-2.054,2.032Q540.919,455.989,536.507,455.982Zm3.812-1.288c0-.187,0-.326,0-.465-.008-1.781.026-3.564-.042-5.342a1.8,1.8,0,0,0-1.929-1.74c-1.131-.012-2.263,0-3.394,0a1.961,1.961,0,0,0-2.22,2.212q0,2.439,0,4.878v.46Zm-8.89.011c.013-.11.026-.165.026-.22,0-1.781-.006-3.562.009-5.343,0-.337-.178-.37-.422-.37-.749,0-1.5-.024-2.248.006a1.849,1.849,0,0,0-1.837,1.763c-.044,1.172-.022,2.346-.013,3.519a.581.581,0,0,0,.6.639C528.826,454.716,530.111,454.705,531.429,454.705Zm10.165-.005c1.354,0,2.664.018,3.974-.011.377-.008.544-.315.544-.688,0-1.117.017-2.234-.007-3.35a1.867,1.867,0,0,0-1.823-1.87c-.762-.035-1.526,0-2.29-.01-.3,0-.41.114-.406.431.017,1.4.007,2.8.007,4.2Z"
                                                      transform="translate(0 -85.056)"/>
                                                <path id="Path_209" data-name="Path 209"
                                                      d="M609.243,356.712a3.775,3.775,0,1,1,3.788,3.764A3.775,3.775,0,0,1,609.243,356.712Zm1.279-.076a2.5,2.5,0,1,0,2.611-2.434A2.5,2.5,0,0,0,610.523,356.636Z"
                                                      transform="translate(-76.492)"/>
                                                <path id="Path_210" data-name="Path 210"
                                                      d="M548.151,397.022a2.819,2.819,0,1,1-2.842-2.82A2.827,2.827,0,0,1,548.151,397.022Zm-1.278.023a1.542,1.542,0,1,0-1.531,1.542A1.548,1.548,0,0,0,546.873,397.045Z"
                                                      transform="translate(-15.421 -37.775)"/>
                                                <path id="Path_211" data-name="Path 211"
                                                      d="M698.51,397.045a2.819,2.819,0,1,1,2.839,2.819A2.831,2.831,0,0,1,698.51,397.045Zm4.361.032a1.542,1.542,0,1,0-1.56,1.512A1.55,1.55,0,0,0,702.871,397.076Z"
                                                      transform="translate(-158.187 -37.776)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Category</span></span> <span
                                class="sherah__toggle"></span></a></span>
                            <!-- Dropdown Menu -->
                            <div class="collapse sherah__dropdown" id="menu-item__customers"
                                 data-bs-parent="#sherahMenu">
                                <ul class="menu-bar__one-dropdown">
                                    <li><a href="CategoryServlet"><span class="menu-bar__text"><span
                                            class="menu-bar__name">Category List</span></span></a></li>
                                    <li><a href="addCategory.jsp"><span class="menu-bar__text"><span
                                            class="menu-bar__name">Add Category</span></span></a></li>
                                </ul>
                            </div>
                        </li>
                        <li><a href="#!" class="collapsed" data-bs-toggle="collapse"
                               data-bs-target="#menu-item_products"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="21.136" height="17.873" viewBox="0 0 21.136 17.873">
                                                <path id="Path_218" data-name="Path 218"
                                                      d="M558.766,384.526c.177-.092.32-.164.46-.24l6.468-3.491a1.9,1.9,0,0,1,.368-.179.506.506,0,0,1,.632.248.487.487,0,0,1-.127.656,1.743,1.743,0,0,1-.315.191c-2.517,1.359-5.038,2.712-7.549,4.083a.98.98,0,0,1-1.036.012q-3.781-1.986-7.582-3.934a.811.811,0,0,1-.505-.831c.02-1.3,0-2.6.014-3.9a.486.486,0,0,0-.3-.508c-.45-.232-.889-.486-1.326-.742a.539.539,0,0,1-.221-.877c.62-.926,1.244-1.849,1.883-2.762a1.17,1.17,0,0,1,.442-.344c2.561-1.246,5.127-2.482,7.688-3.728a.879.879,0,0,1,.822-.01c2.568,1.2,5.143,2.387,7.709,3.591a1.24,1.24,0,0,1,.478.42c.61.916,1.2,1.844,1.794,2.771.3.463.23.71-.265.989q-3.631,2.046-7.265,4.086c-.454.255-.643.212-.981-.2-.412-.5-.823-1.011-1.292-1.587Zm-7.409-12.033c.133.076.214.126.3.17,2.065,1.073,4.133,2.141,6.191,3.225a.625.625,0,0,0,.674-.018c2.031-1.106,4.069-2.2,6.1-3.3.118-.064.232-.133.367-.21a1.6,1.6,0,0,0-.164-.106c-2.124-.986-4.246-1.977-6.378-2.945a.814.814,0,0,0-.6.038c-2.04.971-4.071,1.96-6.1,2.945C551.626,372.349,551.511,372.412,551.357,372.492Zm-.688,4.945c0,1.092.01,2.129-.007,3.165a.5.5,0,0,0,.321.528c2.093,1.074,4.179,2.162,6.267,3.245.1.054.216.1.344.152v-6.293l-1.263,1.551c-.386.473-.552.507-1.076.212q-2.074-1.166-4.147-2.334C550.982,377.593,550.85,377.53,550.668,377.438Zm10.08,1.529,6.694-3.769-1.4-2.171-7.033,3.792Zm-3.4-2.142-7.037-3.652-1.38,2.033,6.683,3.76Z"
                                                      transform="translate(-547.61 -368.076)"/>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Products</span></span> <span
                                class="sherah__toggle"></span></a></span>
                            <!-- Dropdown Menu -->
                            <div class="collapse sherah__dropdown" id="menu-item_products" data-bs-parent="#sherahMenu">
                                <ul class="menu-bar__one-dropdown">
                                    <li><a href="${pageContext.request.contextPath}/product-list"><span
                                            class="menu-bar__text"><span
                                            class="menu-bar__name">Products</span></span></a></li>
                                    <li><a href="${pageContext.request.contextPath}/product-detail-list"><span
                                            class="menu-bar__name">Product Details</span></a></li>
                                    <c:if test="${account.getRoleId() == 1 || account.getRoleId() == 2}">
                                    <li>
                                        <a href="${pageContext.request.contextPath}/add-product">
                                            <span class="menu-bar__text">
                                                <span class="menu-bar__name">Upload Product</span>
                                            </span>
                                        </a>
                                    </li>
                                    </c:if>
                                </ul>
                            </div>
                        </li>
                        <c:if test="${account.getRoleId() == 3}">
                            <li><a href="account" class="collapsed"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="22.259" height="19.146" viewBox="0 0 22.259 19.146">
                                                <path id="Path_229" data-name="Path 229"
                                                      d="M601.866,379.059c.384-.409.661-.738.973-1.031a6.035,6.035,0,0,1,8.378.092,5.886,5.886,0,0,1,.126,8.307c-2.912,2.961-5.887,5.861-8.839,8.783a.788.788,0,0,1-1.258.011c-2.964-2.933-5.954-5.841-8.872-8.819a5.875,5.875,0,0,1,.169-8.3,6.037,6.037,0,0,1,8.343-.082C601.208,378.318,601.493,378.66,601.866,379.059Zm.008,14.528c.112-.1.187-.168.257-.237q3.966-3.931,7.928-7.866a4.341,4.341,0,0,0,.055-6.23,4.455,4.455,0,0,0-6.287.011c-.38.365-.749.741-1.124,1.112-.676.669-.985.672-1.648.017-.41-.405-.806-.826-1.233-1.213a4.4,4.4,0,0,0-6.158,6.284c2.629,2.636,5.283,5.246,7.927,7.867C601.67,393.412,601.758,393.484,601.874,393.588Z"
                                                      transform="translate(-590.738 -376.383)"/>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Account</span></span></a></span>
                            </li>
                        </c:if>
                        <c:if test="${account.getRoleId() == 1}">
                            <li><a href="manageemployee" class="collapsed"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="22.259" height="19.146" viewBox="0 0 22.259 19.146">
                                                <path id="Path_229" data-name="Path 229"
                                                      d="M601.866,379.059c.384-.409.661-.738.973-1.031a6.035,6.035,0,0,1,8.378.092,5.886,5.886,0,0,1,.126,8.307c-2.912,2.961-5.887,5.861-8.839,8.783a.788.788,0,0,1-1.258.011c-2.964-2.933-5.954-5.841-8.872-8.819a5.875,5.875,0,0,1,.169-8.3,6.037,6.037,0,0,1,8.343-.082C601.208,378.318,601.493,378.66,601.866,379.059Zm.008,14.528c.112-.1.187-.168.257-.237q3.966-3.931,7.928-7.866a4.341,4.341,0,0,0,.055-6.23,4.455,4.455,0,0,0-6.287.011c-.38.365-.749.741-1.124,1.112-.676.669-.985.672-1.648.017-.41-.405-.806-.826-1.233-1.213a4.4,4.4,0,0,0-6.158,6.284c2.629,2.636,5.283,5.246,7.927,7.867C601.67,393.412,601.758,393.484,601.874,393.588Z"
                                                      transform="translate(-590.738 -376.383)"/>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Employee</span></span></a></span>
                            </li>
                        </c:if>
                        <c:if test="${account.getRoleId() == 1}">
                            <li><a href="managesupplier" class="collapsed"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="22.259" height="19.146" viewBox="0 0 22.259 19.146">
                                                <path id="Path_229" data-name="Path 229"
                                                      d="M601.866,379.059c.384-.409.661-.738.973-1.031a6.035,6.035,0,0,1,8.378.092,5.886,5.886,0,0,1,.126,8.307c-2.912,2.961-5.887,5.861-8.839,8.783a.788.788,0,0,1-1.258.011c-2.964-2.933-5.954-5.841-8.872-8.819a5.875,5.875,0,0,1,.169-8.3,6.037,6.037,0,0,1,8.343-.082C601.208,378.318,601.493,378.66,601.866,379.059Zm.008,14.528c.112-.1.187-.168.257-.237q3.966-3.931,7.928-7.866a4.341,4.341,0,0,0,.055-6.23,4.455,4.455,0,0,0-6.287.011c-.38.365-.749.741-1.124,1.112-.676.669-.985.672-1.648.017-.41-.405-.806-.826-1.233-1.213a4.4,4.4,0,0,0-6.158,6.284c2.629,2.636,5.283,5.246,7.927,7.867C601.67,393.412,601.758,393.484,601.874,393.588Z"
                                                      transform="translate(-590.738 -376.383)"/>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Supplier</span></span></a></span>
                            </li>
                        </c:if>
                        <li><a href="viewbininventory" class="collapsed"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="22.259" height="19.146" viewBox="0 0 22.259 19.146">
                                                <path id="Path_229" data-name="Path 229"
                                                      d="M601.866,379.059c.384-.409.661-.738.973-1.031a6.035,6.035,0,0,1,8.378.092,5.886,5.886,0,0,1,.126,8.307c-2.912,2.961-5.887,5.861-8.839,8.783a.788.788,0,0,1-1.258.011c-2.964-2.933-5.954-5.841-8.872-8.819a5.875,5.875,0,0,1,.169-8.3,6.037,6.037,0,0,1,8.343-.082C601.208,378.318,601.493,378.66,601.866,379.059Zm.008,14.528c.112-.1.187-.168.257-.237q3.966-3.931,7.928-7.866a4.341,4.341,0,0,0,.055-6.23,4.455,4.455,0,0,0-6.287.011c-.38.365-.749.741-1.124,1.112-.676.669-.985.672-1.648.017-.41-.405-.806-.826-1.233-1.213a4.4,4.4,0,0,0-6.158,6.284c2.629,2.636,5.283,5.246,7.927,7.867C601.67,393.412,601.758,393.484,601.874,393.588Z"
                                                      transform="translate(-590.738 -376.383)"/>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">View bin inventory</span></span></a></span>
                        </li>
                        <c:if test="${account.getRoleId() == 2}">
                            <li><a href="#!" class="collapsed" data-bs-toggle="collapse" data-bs-target="#menu-item__9"><span
                                    class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="22.029" height="20.972" viewBox="0 0 22.029 20.972">
                                                <g id="Icon" transform="translate(-451.809 -436.251)">
                                                <path id="Path_234" data-name="Path 234"
                                                      d="M467.255,446.744q0,4.038,0,8.077c0,1.587-.776,2.4-2.294,2.4-2.7,0-5.39-.01-8.085.005a1.466,1.466,0,0,1-1.172-.506q-1.723-1.84-3.5-3.629a1.259,1.259,0,0,1-.381-.945c0-.907-.017-1.814-.017-2.722q0-5.4.007-10.8a2.082,2.082,0,0,1,2.28-2.37q5.44,0,10.881,0a2.076,2.076,0,0,1,2.278,2.369Q467.259,442.683,467.255,446.744Zm-10.039,9.007h7.751c.691,0,.864-.179.864-.893q0-8.119,0-16.237c0-.719-.169-.895-.859-.895H454.1c-.678,0-.846.167-.846.857q0,6.29,0,12.58c0,.144.014.288.024.474,1.017,0,2,0,2.988,0,.725,0,.953.234.955.981C457.218,453.641,457.217,454.665,457.217,455.75Zm-2.774-2.636,1.3,1.408v-1.408Z"
                                                      transform="translate(0 0)"/>
                                                <path id="Path_235" data-name="Path 235"
                                                      d="M640.677,446.844c0,2.765.005,5.531,0,8.3a2.052,2.052,0,0,1-1.852,2.175.733.733,0,1,1-.177-1.452.635.635,0,0,0,.6-.721q0-8.3,0-16.592a.632.632,0,0,0-.6-.721.734.734,0,1,1,.174-1.454,2.054,2.054,0,0,1,1.853,2.174C640.682,441.313,640.677,444.079,640.677,446.844Z"
                                                      transform="translate(-170.125 -0.109)"/>
                                                <path id="Path_236" data-name="Path 236"
                                                      d="M678.986,446.8c0,2.78.005,5.56,0,8.339a2.04,2.04,0,0,1-1.845,2.13.725.725,0,0,1-.862-.655.736.736,0,0,1,.689-.8c.464-.088.595-.253.6-.81q.006-2.876,0-5.753,0-5.262,0-10.524c0-.722-.044-.777-.728-.953a.744.744,0,0,1-.558-.791.712.712,0,0,1,.735-.66,2.033,2.033,0,0,1,1.97,2.1c.013,2.021,0,4.043,0,6.065Q678.986,445.64,678.986,446.8Z"
                                                      transform="translate(-205.15 -0.063)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Purchase</span></span><span
                                    class="sherah__toggle"></span></a></span>
                                <!-- Dropdown Menu -->
                                <div class="collapse sherah__dropdown" id="menu-item__9" data-bs-parent="#sherahMenu">
                                    <ul class="menu-bar__one-dropdown">
                                        <li><a href="viewpurchaseorder"><span class="menu-bar__text"><span
                                                class="menu-bar__name">View Purchase Order</span></span></a></li>
                                        <li><a href="addinfomationpo"><span class="menu-bar__text"><span
                                                class="menu-bar__name">Create Purchase Order </span></span></a></li>

                                    </ul>
                                </div>
                            </li>
                        </c:if>
                        <c:if test="${account.getRoleId() == 4}">
                            <li><a href="#!" class="collapsed" data-bs-toggle="collapse"
                                   data-bs-target="#menu-item__orders"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="17.092" height="17.873" viewBox="0 0 17.092 17.873">
                                                <g id="Icon" transform="translate(-409.241 -375.497)">
                                                <path id="Path_219" data-name="Path 219"
                                                      d="M413.466,380.6a15.992,15.992,0,0,1,.123-1.943,4.18,4.18,0,0,1,4.549-3.151,4.054,4.054,0,0,1,3.919,3.741c.009.436,0,.872,0,1.354h2.872c.193,0,.386,0,.579,0,.589.012.879.286.813.811-.4,3.247-.8,6.495-1.227,9.739a2.674,2.674,0,0,1-2.769,2.2q-4.543.022-9.086,0a2.681,2.681,0,0,1-2.771-2.2c-.344-2.558-.649-5.12-.97-7.68-.078-.62-.147-1.242-.234-1.861-.108-.759.125-1.011.967-1.012Zm-2.723,1.3c.062.5.119.978.177,1.452.306,2.481.606,4.963.924,7.443.114.888.642,1.293,1.628,1.294q4.32,0,8.639,0a2.279,2.279,0,0,0,.57-.059,1.428,1.428,0,0,0,1.074-1.446c.213-1.836.452-3.669.679-5.5.13-1.052.257-2.1.387-3.174h-2.742v1.215c.038.015.076.032.115.046.437.159.649.424.563.746a.73.73,0,0,1-.826.524c-.43-.008-.861.008-1.291-.006a.668.668,0,0,1-.711-.588c-.021-.423.28-.612.676-.709v-1.218h-5.655v1.221c.434.1.724.3.683.722a.613.613,0,0,1-.636.565c-.518.026-1.039.024-1.558,0-.349-.016-.627-.224-.614-.526a1.458,1.458,0,0,1,.364-.659c.051-.071.2-.084.292-.118V381.9Zm4.154-1.321h5.727c0-.514.036-1-.007-1.491a2.723,2.723,0,0,0-2.627-2.306,2.77,2.77,0,0,0-2.967,1.982A12.7,12.7,0,0,0,414.9,380.578Z"
                                                      transform="translate(0 0)"/>
                                                <path id="Path_220" data-name="Path 220"
                                                      d="M475.527,506.525c.71-.887,1.409-1.754,2.1-2.627a.66.66,0,0,1,.828-.285.609.609,0,0,1,.258.961c-.841,1.079-1.7,2.145-2.563,3.206a.6.6,0,0,1-.858.123c-.635-.412-1.267-.829-1.89-1.259a.635.635,0,1,1,.71-1.053C474.584,505.888,475.043,506.2,475.527,506.525Z"
                                                      transform="translate(-57.815 -117.848)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Delivery</span></span><span
                                    class="sherah__toggle"></span></a></span>
                                <!-- Dropdown Menu -->
                                <div class="collapse sherah__dropdown" id="menu-item__orders"
                                     data-bs-parent="#sherahMenu">
                                    <ul class="menu-bar__one-dropdown">
                                        <li><a href="viewdeliveryorder"><span class="menu-bar__text"><span
                                                class="menu-bar__name">View Delivery Order</span></span></a></li>
                                    </ul>
                                        <%--                                    <ul class="menu-bar__one-dropdown">--%>
                                        <%--                                        <li><a href="#"><span class="menu-bar__text"><span--%>
                                        <%--                                                class="menu-bar__name">View Delivery</span></span></a></li>--%>
                                        <%--                                    </ul>--%>
                                </div>
                            </li>
                        </c:if>

                        <li><a href="#!" class="collapsed" data-bs-toggle="collapse"
                               data-bs-target="#menu-item_TOOrder"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="21.136" height="17.873" viewBox="0 0 21.136 17.873">
                                                <path id="Path_218" data-name="Path 218"
                                                      d="M558.766,384.526c.177-.092.32-.164.46-.24l6.468-3.491a1.9,1.9,0,0,1,.368-.179.506.506,0,0,1,.632.248.487.487,0,0,1-.127.656,1.743,1.743,0,0,1-.315.191c-2.517,1.359-5.038,2.712-7.549,4.083a.98.98,0,0,1-1.036.012q-3.781-1.986-7.582-3.934a.811.811,0,0,1-.505-.831c.02-1.3,0-2.6.014-3.9a.486.486,0,0,0-.3-.508c-.45-.232-.889-.486-1.326-.742a.539.539,0,0,1-.221-.877c.62-.926,1.244-1.849,1.883-2.762a1.17,1.17,0,0,1,.442-.344c2.561-1.246,5.127-2.482,7.688-3.728a.879.879,0,0,1,.822-.01c2.568,1.2,5.143,2.387,7.709,3.591a1.24,1.24,0,0,1,.478.42c.61.916,1.2,1.844,1.794,2.771.3.463.23.71-.265.989q-3.631,2.046-7.265,4.086c-.454.255-.643.212-.981-.2-.412-.5-.823-1.011-1.292-1.587Zm-7.409-12.033c.133.076.214.126.3.17,2.065,1.073,4.133,2.141,6.191,3.225a.625.625,0,0,0,.674-.018c2.031-1.106,4.069-2.2,6.1-3.3.118-.064.232-.133.367-.21a1.6,1.6,0,0,0-.164-.106c-2.124-.986-4.246-1.977-6.378-2.945a.814.814,0,0,0-.6.038c-2.04.971-4.071,1.96-6.1,2.945C551.626,372.349,551.511,372.412,551.357,372.492Zm-.688,4.945c0,1.092.01,2.129-.007,3.165a.5.5,0,0,0,.321.528c2.093,1.074,4.179,2.162,6.267,3.245.1.054.216.1.344.152v-6.293l-1.263,1.551c-.386.473-.552.507-1.076.212q-2.074-1.166-4.147-2.334C550.982,377.593,550.85,377.53,550.668,377.438Zm10.08,1.529,6.694-3.769-1.4-2.171-7.033,3.792Zm-3.4-2.142-7.037-3.652-1.38,2.033,6.683,3.76Z"
                                                      transform="translate(-547.61 -368.076)"/>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Transfer Order</span></span> <span
                                class="sherah__toggle"></span></a></span>
                            <!-- Dropdown Menu -->
                            <div class="collapse sherah__dropdown" id="menu-item_TOOrder" data-bs-parent="#sherahMenu">
                                <ul class="menu-bar__one-dropdown">
                                    <li><a href="${pageContext.request.contextPath}/TOList"><span
                                            class="menu-bar__text"><span
                                            class="menu-bar__name">Transfer Order List</span></span></a></li>
                                    <c:if test="${account.getRoleId() == 4}">
                                        <li><a href="${pageContext.request.contextPath}/TOCreate"><span
                                                class="menu-bar__text"><span
                                                class="menu-bar__name">New Transfer Order</span></span></a></li>
                                    </c:if>
                                    <c:if test="${account.getRoleId() == 1}">
                                        <li><a href="${pageContext.request.contextPath}/confirmTO"><span
                                                class="menu-bar__text"><span
                                                class="menu-bar__name">Confirm Transfer Order</span></span></a></li>
                                    </c:if>
                                </ul>
                            </div>
                        </li>
                        <li><a href="ViewInventoryDocList" class="collapsed"><span class="menu-bar__text">
                                            <span class="sherah-menu-icon sherah-svg-icon__v1">
                                                <svg class="sherah-svg-icon" xmlns="http://www.w3.org/2000/svg"
                                                     width="19.527" height="19.582" viewBox="0 0 19.527 19.582">
                                                <g id="Icon" transform="translate(-115.401 35.25)">
                                                <path id="Path_1026" data-name="Path 1026"
                                                      d="M133.432-15.668h-13.28c-.137-.024-.274-.048-.412-.071a5.177,5.177,0,0,1-4.285-4.372,5.176,5.176,0,0,1,2.84-5.353,5.455,5.455,0,0,1,1.7-.5V-26.2q0-3.631,0-7.263a1.665,1.665,0,0,1,.776-1.489,4.105,4.105,0,0,1,.717-.295h9.185a5.733,5.733,0,0,1,.452.369c1.18,1.172,2.353,2.351,3.533,3.523a.846.846,0,0,1,.267.645q-.008,3.918,0,7.835c0,1.815,0,3.631,0,5.446a1.68,1.68,0,0,1-1.056,1.627A3.581,3.581,0,0,1,133.432-15.668ZM129.949-34.1h-8.134a.591.591,0,0,0-.669.669q0,3.633,0,7.265v.2a5.282,5.282,0,0,1,2.534,1.006.59.59,0,0,0,.326.107q3.75.009,7.5,0c.064,0,.128,0,.191,0a.579.579,0,0,1,.546.541.579.579,0,0,1-.484.6,1.439,1.439,0,0,1-.229.008h-6.663a5.29,5.29,0,0,1,.841,2.295h.32q2.784,0,5.567,0a.591.591,0,0,1,.6.353.574.574,0,0,1-.583.8q-2.841,0-5.682,0h-.223a5.257,5.257,0,0,1-1.884,3.442h9.254c.485,0,.7-.213.7-.7q0-6.271,0-12.542v-.22H130.6a.585.585,0,0,1-.654-.646c0-.452,0-.9,0-1.357Zm-5.358,13.269a4.023,4.023,0,0,0-4.016-4.013,4.023,4.023,0,0,0-4.021,4.008,4.024,4.024,0,0,0,4.025,4.023A4.024,4.024,0,0,0,124.591-20.834Zm8.268-10.6-1.747-1.748v1.748Z"
                                                      transform="translate(0 0)"/>
                                                <path id="Path_1027" data-name="Path 1027"
                                                      d="M262.772,101.242q2.084,0,4.168,0a.572.572,0,0,1,.572.789.554.554,0,0,1-.539.357c-.376,0-.752,0-1.128,0h-7.151a1.177,1.177,0,0,1-.247-.014.572.572,0,0,1,.138-1.132q1.941,0,3.881,0Z"
                                                      transform="translate(-135.313 -129.532)"/>
                                                <path id="Path_1028" data-name="Path 1028"
                                                      d="M206.635,193.557c.317,0,.609,0,.9,0a.576.576,0,1,1,0,1.147q-.708,0-1.415,0a.58.58,0,0,1-.631-.63q0-1.09,0-2.181a.576.576,0,1,1,1.147-.006C206.636,192.435,206.635,192.983,206.635,193.557Z"
                                                      transform="translate(-85.488 -214.962)"/>
                                                </g>
                                                </svg>
                                            </span>
                                            <span class="menu-bar__name">Inventory</span></span></a></span>
                        </li>


                    </ul>
                </div>
                <!-- End Nav Menu -->
            </div>

        </div>
        <!-- End Admin Menu -->
    </div>
</div>