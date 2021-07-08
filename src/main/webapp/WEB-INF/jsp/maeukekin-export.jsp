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

    <link rel="stylesheet" href="/resources/static/css/form/all-type-forms.css">

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
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-professor icon-wrap"></span> <span class="mini-click-non">Manage users</span></a>
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
                    <li class="active">
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
                                            <li><a href="/add-user">Add user</a>
                                            </li>
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
                                        <li><span class="bread-blod">前受金リスト</span>
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
    <div class="basic-form-area mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                </div>
                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                    <div class="message">
                        <c:if test="${success != null && !''.equals(success.trim())}">
                            <div class="alert alert-success" role="alert">
                                    ${success}
                            </div>
                        </c:if>
                        <c:if test="${error != null && !''.equals(error.trim())}">
                            <div class="alert alert-danger" role="alert">
                                    ${error}
                            </div>
                        </c:if>
                    </div>
                </div>
            </div>
            <f:form method="post"
                    action="/export/maeukekin/links" >
                <div class="form-group-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label class="login2 pull-right pull-right-pro">Month select</label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <div class="form-select-list">
                                <select class="form-control custom-select-value" name="month">
                                    <c:forEach var="item" items="${listMonths}" varStatus="loop">
                                        <option value="${item}"> <c:out value="${item}"></c:out> </option>
                                    </c:forEach>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group-inner">
                    <div class="row">
                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                            <label class="login2 pull-right pull-right-pro">Select export file type</label>
                        </div>
                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">
                            <div class="form-select-list">
                                <select class="form-control custom-select-value" name="type">
                                    <option value="excel" selected > Excel </option>
                                    <option value="pdf" disabled > Pdf </option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="form-group-inner">
                    <div class="login-btn-inner">
                        <div class="row">
                            <div class="col-lg-3"></div>
                            <div class="col-lg-9">
                                <div class="login-horizental cancel-wp pull-left form-bc-ele">
                                    <button class="btn btn-sm btn-primary login-submit-cs" type="submit">Save Change</button>
                                    <button class="btn btn-white" id="maeukekin-export-cancel">Cancel</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </f:form>
        </div>
    </div>

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
<!-- touchspin JS
		============================================ -->
<script src="/resources/static/js/touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script src="/resources/static/js/touchspin/touchspin-active.js"></script>
<!-- colorpicker JS
    ============================================ -->
<script src="/resources/static/js/colorpicker/jquery.spectrum.min.js"></script>
<script src="/resources/static/js/colorpicker/color-picker-active.js"></script>
<!-- detapicker JS
    ============================================ -->
<script src="/resources/static/js/datapicker/bootstrap-datepicker.js"></script>
<script src="/resources/static/js/datapicker/datepicker-active.js"></script>

<%--&lt;%&ndash;date-picker JS&ndash;%&gt;--%>
<%--<script src="/resources/static/js/datepicker/jquery-ui.min.js"></script>--%>
<%--<script src="/resources/static/js/datepicker/datepicker-active.js"></script>--%>

<!-- input-mask JS
    ============================================ -->
<script src="/resources/static/js/input-mask/jasny-bootstrap.min.js"></script>
<!-- chosen JS
    ============================================ -->
<script src="/resources/static/js/chosen/chosen.jquery.js"></script>
<script src="/resources/static/js/chosen/chosen-active.js"></script>
<!-- select2 JS
    ============================================ -->
<script src="/resources/static/js/select2/select2.full.min.js"></script>
<script src="/resources/static/js/select2/select2-active.js"></script>
<!-- ionRangeSlider JS
    ============================================ -->
<script src="/resources/static/js/ionRangeSlider/ion.rangeSlider.min.js"></script>
<script src="/resources/static/js/ionRangeSlider/ion.rangeSlider.active.js"></script>
<!-- rangle-slider JS
    ============================================ -->
<%--<script src="/resources/static/js/rangle-slider/jquery-ui-1.10.4.custom.min.js"></script>--%>
<script src="/resources/static/js/rangle-slider/jquery-ui-touch-punch.min.js"></script>
<script src="/resources/static/js/rangle-slider/rangle-active.js"></script>
<!-- knob JS
    ============================================ -->
<script src="/resources/static/js/knob/jquery.knob.js"></script>
<script src="/resources/static/js/knob/knob-active.js"></script>
<!-- tab JS
    ============================================ -->
<script src="/resources/static/js/tab.js"></script>
<!-- icheck JS
    ============================================ -->
<%--<script src="/resources/static/js/icheck/icheck.min.js"></script>--%>
<%--<script src="/resources/static/js/icheck/icheck-active.js"></script>--%>
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