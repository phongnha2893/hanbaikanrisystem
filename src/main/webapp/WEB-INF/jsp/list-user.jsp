<%@ include file="import.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="x-ua-compatible" content="ie=edge">
    <title>Dashboard</title>
    <meta name="description" content="">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- favicon
		============================================ -->
    <link rel="shortcut icon" type="image/x-icon" href="img/favicon.ico">
    <!-- Google Fonts
		============================================ -->
    <link href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,700,900" rel="stylesheet">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/bootstrap.min.css">
    <!-- Bootstrap CSS
		============================================ -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <!-- owl.carousel CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/owl.carousel.css">
    <link rel="stylesheet" href="/resources/static/css/owl.theme.css">
    <link rel="stylesheet" href="/resources/static/css/owl.transitions.css">
    <!-- animate CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/animate.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/normalize.css">
    <!-- meanmenu icon CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/meanmenu.min.css">
    <!-- main CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/main.css">
    <!-- educate icon CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/educate-custon-icon.css">
    <!-- morrisjs CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/morrisjs/morris.css">
    <!-- mCustomScrollbar CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/scrollbar/jquery.mCustomScrollbar.min.css">
    <!-- metisMenu CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/metisMenu/metisMenu.min.css">
    <link rel="stylesheet" href="/resources/static/css/metisMenu/metisMenu-vertical.css">
    <!-- calendar CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/calendar/fullcalendar.min.css">
    <link rel="stylesheet" href="/resources/static/css/calendar/fullcalendar.print.min.css">
    <!-- x-editor CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/editor/select2.css">
    <link rel="stylesheet" href="/resources/static/css/editor/datetimepicker.css">
    <link rel="stylesheet" href="/resources/static/css/editor/bootstrap-editable.css">
    <link rel="stylesheet" href="/resources/static/css/editor/x-editor-style.css">
    <!-- normalize CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/data-table/bootstrap-table.css">
    <link rel="stylesheet" href="/resources/static/css/data-table/bootstrap-editable.css">
    <!-- style CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/css/style.css">
    <!-- responsive CSS
		============================================ -->
    <link rel="stylesheet" href="/resources/static/css/responsive.css">
    <!-- modernizr JS
		============================================ -->
    <script src="js/vendor/modernizr-2.8.3.min.js"></script>
</head>

<body>
<!-- Start Left menu area -->
<div class="left-sidebar-pro">
    <nav id="sidebar" class="">
        <div class="sidebar-header">
            <a href="index.html"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
            <strong><a href="index.html"><img src="img/logo/logosn.png" alt="" /></a></strong>
        </div>
        <div class="left-custom-menu-adp-wrap comment-scrollbar">
            <nav class="sidebar-nav left-sidebar-menu-pro">
                <ul class="metismenu" id="menu1">
                    <li class="active">
                        <a class="has-arrow" href="all-professors.html" aria-expanded="false"><span class="educate-icon educate-professor icon-wrap"></span> <span class="mini-click-non">Manage users</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="list users" href="/list-user"><span class="mini-sub-pro">List users</span></a></li>
                            <li><a title="add user" href="/add-user"><span class="mini-sub-pro">Add user</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-data-table icon-wrap"></span> <span class="mini-click-non">Data import</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="Urikakekin zandaka" href="/import-file/maeukekin"><span class="mini-sub-pro">前受金リスト</span></a></li>
                            <li><a title="RP nyuukin deta" href="/import-file/urikakezandakauchiwake"><span class="mini-sub-pro">売掛金残高内訳表</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-pages icon-wrap"></span> <span class="mini-click-non">Data export</span></a>
                        <ul class="submenu-angle page-mini-nb-dp" aria-expanded="false">
                            <li><a title="Mae-ukekin" href="/export-file/maeukekin"><span class="mini-sub-pro">前受金リスト</span></a></li>
                            <li><a title="Urikake-zandaka-uchiwake" href="/export-file/urikakezandakauchiwake"><span class="mini-sub-pro">売掛金残高内訳表</span></a></li>
                        </ul>
                    </li>
                </ul>
            </nav>
        </div>
    </nav>
</div>
<!-- End Left menu area -->
<!-- Start Welcome area -->
<div class="all-content-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="logo-pro">
                    <a href="index.html"><img class="main-logo" src="img/logo/logo.png" alt="" /></a>
                </div>
            </div>
        </div>
    </div>
    <div class="header-advance-area">
        <div class="header-top-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="header-top-wraper">
                            <div class="row">
                                <div class="col-lg-1 col-md-0 col-sm-1 col-xs-12">
                                    <div class="menu-switcher-pro">
                                        <button type="button" id="sidebarCollapse" class="btn bar-button-pro header-drl-controller-btn btn-info navbar-btn">
                                            <i class="educate-icon educate-nav"></i>
                                        </button>
                                    </div>
                                </div>
                                <div class="col-lg-6 col-md-7 col-sm-6 col-xs-12">
                                    <div class="header-top-menu tabl-d-n">
                                        <ul class="nav navbar-nav mai-top-nav">
                                            <li class="nav-item"><a href="#" class="nav-link">Home</a>
                                            </li>
                                            <li class="nav-item"><a href="#" class="nav-link">About</a>
                                            </li>
                                            <li class="nav-item"><a href="#" class="nav-link">Services</a>
                                            </li>
                                            <li class="nav-item dropdown res-dis-nn">
                                                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">Project <span class="angle-down-topmenu"><i class="fa fa-angle-down"></i></span></a>
                                                <div role="menu" class="dropdown-menu animated zoomIn">
                                                    <a href="#" class="dropdown-item">Documentation</a>
                                                    <a href="#" class="dropdown-item">Expert Backend</a>
                                                    <a href="#" class="dropdown-item">Expert FrontEnd</a>
                                                    <a href="#" class="dropdown-item">Contact Support</a>
                                                </div>
                                            </li>
                                            <li class="nav-item"><a href="#" class="nav-link">Support</a>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                                <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
                                    <div class="header-right-info">
                                        <ul class="nav navbar-nav mai-top-nav header-right-menu">
                                            <li class="nav-item">
                                                <a href="#" data-toggle="dropdown" role="button" aria-expanded="false" class="nav-link dropdown-toggle">
                                                    <img src="img/product/pro4.jpg" alt="" />
                                                    <span class="admin-name">${pageContext.request.userPrincipal.name}</span>
                                                    <i class="fa fa-angle-down edu-icon edu-down-arrow"></i>
                                                </a>
                                                <ul role="menu" class="dropdown-header-top author-log dropdown-menu animated zoomIn">
                                                    <li><a href="#"><span class="edu-icon edu-home-admin author-log-ic"></span>My Account</a>
                                                    </li>
                                                    <c:if test="${pageContext.request.userPrincipal.name != null}">
                                                        <form id="logoutForm" method="POST" action="${contextPath}/logout">
                                                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                                                        </form>
                                                    </c:if>
                                                    <li><a onclick="document.forms['logoutForm'].submit()"><span class="edu-icon edu-locked author-log-ic"></span>Log Out</a>
                                                    </li>
                                                </ul>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Mobile Menu start -->
        <div class="mobile-menu-area">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="mobile-menu">
                            <nav id="dropdown">
                                <ul class="mobile-menu-nav">
                                    <li><a data-toggle="collapse" data-target="#Tablesmob" href="#">Contract <span class="admin-project-icon edu-icon edu-down-arrow"></span></a>
                                        <ul id="Tablesmob" class="collapse dropdown-header-top">

                                            <li><a href="/list-user">List users</a>
                                            </li>
                                            <c:if test="${currentRoles.contains('ADMIN')}">
                                                <li><a href="/add-user">Add user</a></li>
                                            </c:if>
                                        </ul>
                                    </li>
                                </ul>
                            </nav>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Mobile Menu end -->
        <div class="breadcome-area">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                        <div class="breadcome-list single-page-breadcome">
                            <div class="row">
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                </div>
                                <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12">
                                    <ul class="breadcome-menu">
                                        <li><a href="#">Home</a> <span class="bread-slash">/</span>
                                        </li>
                                        <li><span class="bread-blod">List users</span>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Static Table Start -->
    <div class="product-status mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="product-status-wrap">
                        <h4>Users List</h4>
                        <c:if test="${currentRoles.contains('ADMIN')}">
                            <div class="add-product">
                                <a href="/add-user">Add user</a>
                            </div>
                        </c:if>
                        <div class="user-pagination">
                            <div class="container-fluid">
                                <div class="row">
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="total-count">
                                            <h5>All <fmt:formatNumber value="${totalItems != null ? totalItems : 0}" maxFractionDigits="3"/> users. </h5>
                                        </div>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-6">
                                        <div class="custom-pagination floatright">
                                            <page:pagination url="/list-user?page=##"
                                                             currentPage="${currentPage}" totalPages="${totalPages}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="asset-inner">
                            <table>
                                <tr>
                                    <th>Username</th>
                                    <th>Status</th>
                                    <th>Roles</th>
                                    <c:if test="${currentRoles.contains('ADMIN')}">
                                        <th>Setting</th>
                                    </c:if>
                                </tr>
                                <c:forEach var="item" items="${listUser}" varStatus="loop">
                                    <tr>
                                        <td> <c:out value="${item.username}" > </c:out></td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${currentRoles.contains('ADMIN')}">
                                                    <c:choose>
                                                        <c:when test="${(item.active == true )}">
                                                            <a href="${"/user/change-status/".concat(item.id).concat("?page=").concat(currentPage)}" >
                                                                <button class="pd-setting">Active</button>
                                                            </a>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a href="${"/user/change-status/".concat(item.id).concat("?page=").concat(currentPage)}" >
                                                                <button class="ds-setting">Disabled</button>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:choose>
                                                        <c:when test="${(item.active == true )}">
                                                            <button class="pd-setting">Active</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <button class="ds-setting">Disabled</button>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${item.roles != null}">
                                                <c:forEach items="${item.roles}" var="role">
                                                    ${role.name}<br>
                                                </c:forEach>
                                            </c:if>
                                        </td>
                                        <c:if test="${currentRoles.contains('ADMIN')}">
                                            <td>
                                                <a class="edit-button" href="${"/user/edit/".concat(item.id).concat("?page=").concat(currentPage)}" >
                                                    <button data-toggle="tooltip" title="Edit" class="pd-setting-ed"><i class="fas fa-edit" aria-hidden="true"></i></button>
                                                </a>
                                                <a class="delete-button" href="${"/user/delete/".concat(item.id).concat("?page=").concat(currentPage)}" >
                                                    <button data-toggle="tooltip" title="Trash" class="pd-setting-ed"><i class="fas fa-trash" aria-hidden="true"></i></button>
                                                </a>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Static Table End -->
    <div class="footer-copyright-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright © 2021. All rights reserved.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- jquery
    ============================================ -->
<script src="/resources/static/js/vendor/jquery-1.12.4.min.js"></script>
<!-- bootstrap JS
    ============================================ -->
<script src="/resources/static/js/bootstrap.min.js"></script>
<!-- wow JS
    ============================================ -->
<script src="/resources/static/js/wow.min.js"></script>
<!-- price-slider JS
    ============================================ -->
<script src="/resources/static/js/jquery-price-slider.js"></script>
<!-- meanmenu JS
    ============================================ -->
<script src="/resources/static/js/jquery.meanmenu.js"></script>
<!-- owl.carousel JS
    ============================================ -->
<script src="/resources/static/js/owl.carousel.min.js"></script>
<!-- sticky JS
    ============================================ -->
<script src="/resources/static/js/jquery.sticky.js"></script>
<!-- scrollUp JS
    ============================================ -->
<script src="/resources/static/js/jquery.scrollUp.min.js"></script>
<!-- mCustomScrollbar JS
    ============================================ -->
<script src="/resources/static/js/scrollbar/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="/resources/static/js/scrollbar/mCustomScrollbar-active.js"></script>
<!-- metisMenu JS
    ============================================ -->
<script src="/resources/static/js/metisMenu/metisMenu.min.js"></script>
<script src="/resources/static/js/metisMenu/metisMenu-active.js"></script>
<!-- data table JS
    ============================================ -->
<script src="/resources/static/js/data-table/bootstrap-table.js"></script>
<script src="/resources/static/js/data-table/tableExport.js"></script>
<script src="/resources/static/js/data-table/data-table-active.js"></script>
<script src="/resources/static/js/data-table/bootstrap-table-editable.js"></script>
<script src="/resources/static/js/data-table/bootstrap-editable.js"></script>
<script src="/resources/static/js/data-table/bootstrap-table-resizable.js"></script>
<script src="/resources/static/js/data-table/colResizable-1.5.source.js"></script>
<script src="/resources/static/js/data-table/bootstrap-table-export.js"></script>
<!--  editable JS
    ============================================ -->
<script src="/resources/static/js/editable/jquery.mockjax.js"></script>
<script src="/resources/static/js/editable/mock-active.js"></script>
<script src="/resources/static/js/editable/select2.js"></script>
<script src="/resources/static/js/editable/moment.min.js"></script>
<script src="/resources/static/js/editable/bootstrap-datetimepicker.js"></script>
<script src="/resources/static/js/editable/bootstrap-editable.js"></script>
<script src="/resources/static/js/editable/xediable-active.js"></script>
<!-- Chart JS
    ============================================ -->
<script src="/resources/static/js/chart/jquery.peity.min.js"></script>
<script src="/resources/static/js/peity/peity-active.js"></script>
<!-- tab JS
    ============================================ -->
<script src="/resources/static/js/tab.js"></script>
<!-- plugins JS
    ============================================ -->
<script src="/resources/static/js/plugins.js"></script>
<!-- main JS
    ============================================ -->
<script src="/resources/static/js/main.js"></script>
<!-- tawk chat JS
    ============================================ -->
<script src="/resources/static/js/tawk-chat.js"></script>

<script src="/resources/js/index.js"></script>

</body>

</html>