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
                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-professor icon-wrap"></span> <span class="mini-click-non">Manage users</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="list users" href="/list-user"><span class="mini-sub-pro">List users</span></a></li>
                            <li><a title="add user" href="/add-user"><span class="mini-sub-pro">Add user</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-data-table icon-wrap"></span> <span class="mini-click-non">Data import</span></a>
                        <ul class="submenu-angle" aria-expanded="false">
                            <li><a title="Urikakekin zandaka" href="/import-file/maeukekin"><span class="mini-sub-pro">??????????????????</span></a></li>
                            <li><a title="RP nyuukin deta" href="/import-file/urikakezandakauchiwake"><span class="mini-sub-pro">????????????????????????</span></a></li>
                        </ul>
                    </li>
                    <li>
                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-pages icon-wrap"></span> <span class="mini-click-non">Data export</span></a>
                        <ul class="submenu-angle page-mini-nb-dp" aria-expanded="false">
                            <li><a title="Mae-ukekin" href="/export-file/maeukekin"><span class="mini-sub-pro">??????????????????</span></a></li>
                            <li><a title="Urikake-zandaka-uchiwake" href="/export-file/urikakezandakauchiwake"><span class="mini-sub-pro">????????????????????????</span></a></li>
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
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-data-table icon-wrap"></span> <span class="mini-click-non">Data import</span></a>
                                        <ul class="submenu-angle" aria-expanded="false">
                                            <li><a title="Urikakekin zandaka" href="/import-file/maeukekin"><span class="mini-sub-pro">??????????????????</span></a></li>
                                            <li><a title="RP nyuukin deta" href="/import-file/urikakezandakauchiwake"><span class="mini-sub-pro">????????????????????????</span></a></li>
                                    </li>
                                    <li>
                                        <a class="has-arrow" href="#" aria-expanded="false"><span class="educate-icon educate-pages icon-wrap"></span> <span class="mini-click-non">Data export</span></a>
                                        <ul class="submenu-angle page-mini-nb-dp" aria-expanded="false">
                                            <li><a title="Mae-ukekin" href="/export-file/maeukekin"><span class="mini-sub-pro">??????????????????</span></a></li>
                                            <li><a title="Urikake-zandaka-uchiwake" href="/export-file/urikakezandakauchiwake"><span class="mini-sub-pro">????????????????????????</span></a></li>
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
                                        <li><span class="bread-blod">Add users</span>
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
    <div class="single-pro-review-area mt-t-30 mg-b-15">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="review-content-section">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                                <div class="devit-card-custom">
                                    <f:form method="POST" action="/user/add" modelAttribute="userForm"  class="form-signin" autocomplete="off">
                                        <spring:bind path="id">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <f:input type="hidden" path="id" class="form-control" placeholder="id"
                                                         autocomplete="off" ></f:input>
                                        </spring:bind>
                                        <spring:bind path="username">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <f:input type="text" path="username" class="form-control" placeholder="Username"
                                                         autofocus="true" autocomplete="off"></f:input>
                                                <f:errors path="username"></f:errors>                                            </div>
                                        </spring:bind>
                                        <spring:bind path="password">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <f:input type="password"  path="password" class="form-control" autocomplete="off" placeholder="Password"></f:input>
                                                <f:errors path="password"></f:errors>
                                            </div>
                                        </spring:bind>
                                        <spring:bind path="passwordConfirm">
                                            <div class="form-group ${status.error ? 'has-error' : ''}">
                                                <f:input type="password" path="passwordConfirm" class="form-control"
                                                         autocomplete="off" placeholder="Confirm your password"></f:input>
                                                <f:errors path="passwordConfirm"></f:errors>
                                            </div>
                                        </spring:bind>
                                        <spring:bind path="roles">
                                            <div class="form-group form-select-list ${status.error ? 'has-error' : ''}">
                                                <f:select  path="roles" class="form-control custom-select-value" >
                                                    <f:options items="${rolesList}" itemValue="id" itemLabel="name" />
                                                </f:select>
                                                <f:errors path="roles"></f:errors>
                                            </div>
                                        </spring:bind>
                                        <input type="submit" class="btn btn-primary waves-effect waves-light"></input>
                                    </f:form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<%--    <div class="add-contract-form-area mg-b-20">--%>
<%--        <div class="container-fluid">--%>
<%--            <div class="row">--%>
<%--                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                    <div class="sparkline12-list">--%>
<%--                        <div class="sparkline12-hd mg-b-10">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                    <div class="tittle">--%>
<%--                                        <h2>?????????????????????</h2>--%>
<%--                                        <p class="text-danger">* Required</p>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                    <div class="message">--%>
<%--                                        <c:if test="${success != null && !''.equals(success.trim())}">--%>
<%--                                            <div class="alert alert-success" role="alert">--%>
<%--                                                    ${success}--%>
<%--                                            </div>--%>
<%--                                        </c:if>--%>
<%--                                        <c:if test="${error != null && !''.equals(error.trim())}">--%>
<%--                                            <div class="alert alert-danger" role="alert">--%>
<%--                                                    ${error}--%>
<%--                                            </div>--%>
<%--                                        </c:if>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                        <div class="sparkline12-graph">--%>
<%--                            <div class="row">--%>
<%--                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                    <div class="all-form-element-inner">--%>
<%--                                        <f:form action="/add-contract" method="post" id="contractForm" modelAttribute="contractForm" >--%>
<%--                                            <srping:bind path="sender">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">??????????????????????????????<span class="text-danger">*</span></label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="sender" class="form-control" />--%>
<%--                                                        <f:errors path="sender"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="companyName">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????? <span class="text-danger">*</span><br>???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="companyName" class="form-control" />--%>
<%--                                                        <f:errors path="companyName"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="standardQuantity">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span></label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-1 col-md-1 col-sm-1 col-xs-12">--%>
<%--                                                        <f:input class="touchspin1" type="text" value="" path="standardQuantity" />--%>
<%--                                                        <f:errors path="standardQuantity"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <div class="form-contract-standards mg-b-10">--%>
<%--                                                <div class="standard-form-group">--%>
<%--                                                    <srping:bind path="standardName1">--%>
<%--                                                    <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                        <div class="row">--%>
<%--                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mg-b-10">--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <h4> ?????? 1 </h4>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                <label class="login2 pull-left">?????? <span class="text-danger">*</span><br>?????????????????????OHSAS?????????????????????????????????QE?????????2??????????????????????????????1????????????????????????????????????--%>
<%--                                                                </label>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                <div class="bt-df-checkbox pull-left">--%>
<%--                                                                    <div class="row">--%>
<%--                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                            <div class="i-checks pull-left">--%>
<%--                                                                                <label>--%>
<%--                                                                                    <f:radiobutton value="P" path="standardName1" checked="true" /> <i></i> P--%>
<%--                                                                                </label>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                            <div class="i-checks pull-left">--%>
<%--                                                                                <label>--%>
<%--                                                                                    <f:radiobutton value="Q" path="standardName1" /> <i></i> Q--%>
<%--                                                                                </label>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                            <div class="i-checks pull-left">--%>
<%--                                                                                <label>--%>
<%--                                                                                    <f:radiobutton value="E" path="standardName1" /> <i></i> E--%>
<%--                                                                                </label>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                            <div class="i-checks pull-left">--%>
<%--                                                                                <label>--%>
<%--                                                                                    <f:radiobutton value="I" path="standardName1" /> <i></i> I--%>
<%--                                                                                </label>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                            <div class="i-checks pull-left">--%>
<%--                                                                                <label>--%>
<%--                                                                                    <f:radiobutton value="" path="standardName1"  /> <i></i> Other--%>
<%--                                                                                    <input class="other-radio" type="text"/>--%>
<%--                                                                                </label>--%>
<%--                                                                            </div>--%>
<%--                                                                        </div>--%>
<%--                                                                        <f:errors path="standardName1"></f:errors>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardRegistrationType1">--%>
<%--                                                    <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                        <div class="row">--%>
<%--                                                            <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                <label class="login2 pull-left">??????or?????? <span class="text-danger">*</span>--%>
<%--                                                                </label>--%>
<%--                                                            </div>--%>
<%--                                                            <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                <div class="form-select-list">--%>
<%--                                                                    <f:select class="form-control custom-select-value" path="standardRegistrationType1">--%>
<%--                                                                        <option value="??????">??????</option>--%>
<%--                                                                        <option value="?????? ">??????</option>--%>
<%--                                                                    </f:select>--%>
<%--                                                                </div>--%>
<%--                                                                <f:errors path="standardRegistrationType1"></f:errors>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardPMARKExpireDate1">--%>
<%--                                                    <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                        <div class="row">--%>
<%--                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 date-picker-inner">--%>
<%--                                                                <div class="form-group data-custon-pick data_1">--%>
<%--                                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                        <label class="login2 pull-left">P?????????????????????--%>
<%--                                                                        </label>--%>
<%--                                                                    </div>--%>
<%--                                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                        <div class="input-group date">--%>
<%--                                                                            <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                                                            <f:input type="text" class="form-control" path="standardPMARKExpireDate1" value="" />--%>
<%--                                                                        </div>--%>
<%--                                                                        <f:errors path="standardPMARKExpireDate1"></f:errors>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                </div>--%>
<%--                                                <div class="standard-form-group">--%>
<%--                                                    <srping:bind path="standardName2">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mg-b-10">--%>
<%--                                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                        <h4> ?????? 2 </h4>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">?????? <span class="text-danger">*</span><br>?????????????????????OHSAS?????????????????????????????????QE?????????2??????????????????????????????1????????????????????????????????????--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="bt-df-checkbox pull-left">--%>
<%--                                                                        <div class="row">--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="P" path="standardName2" checked="true" /> <i></i> P--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="Q" path="standardName2" /> <i></i> Q--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="E" path="standardName2" /> <i></i> E--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="I" path="standardName2" /> <i></i> I--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="" path="standardName2"  /> <i></i> Other--%>
<%--                                                                                        <input class="other-radio" type="text"/>--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardName2"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardRegistrationType2">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">??????or?????? <span class="text-danger">*</span>--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="form-select-list">--%>
<%--                                                                        <f:select class="form-control custom-select-value" path="standardRegistrationType2">--%>
<%--                                                                            <option value="??????">??????</option>--%>
<%--                                                                            <option value="?????? ">??????</option>--%>
<%--                                                                        </f:select>--%>
<%--                                                                    </div>--%>
<%--                                                                    <f:errors path="standardRegistrationType2"></f:errors>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardPMARKExpireDate2">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 date-picker-inner">--%>
<%--                                                                    <div class="form-group data-custon-pick data_1">--%>
<%--                                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                            <label class="login2 pull-left">P?????????????????????--%>
<%--                                                                            </label>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                            <div class="input-group date">--%>
<%--                                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                                                                <f:input type="text" class="form-control" path="standardPMARKExpireDate2" value="" />--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardPMARKExpireDate2"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                </div>--%>
<%--                                                <div class="standard-form-group">--%>
<%--                                                    <srping:bind path="standardName3">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mg-b-10">--%>
<%--                                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                        <h4> ?????? 3 </h4>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">?????? <span class="text-danger">*</span><br>?????????????????????OHSAS?????????????????????????????????QE?????????2??????????????????????????????1????????????????????????????????????--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="bt-df-checkbox pull-left">--%>
<%--                                                                        <div class="row">--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="P" path="standardName3" checked="true" /> <i></i> P--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="Q" path="standardName3" /> <i></i> Q--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="E" path="standardName3" /> <i></i> E--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="I" path="standardName3" /> <i></i> I--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="" path="standardName3"  /> <i></i> Other--%>
<%--                                                                                        <input class="other-radio" type="text"/>--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardName3"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardRegistrationType3">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">??????or?????? <span class="text-danger">*</span>--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="form-select-list">--%>
<%--                                                                        <f:select class="form-control custom-select-value" path="standardRegistrationType3">--%>
<%--                                                                            <option value="??????">??????</option>--%>
<%--                                                                            <option value="?????? ">??????</option>--%>
<%--                                                                        </f:select>--%>
<%--                                                                    </div>--%>
<%--                                                                    <f:errors path="standardRegistrationType3"></f:errors>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardPMARKExpireDate3">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 date-picker-inner">--%>
<%--                                                                    <div class="form-group data-custon-pick data_1">--%>
<%--                                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                            <label class="login2 pull-left">P?????????????????????--%>
<%--                                                                            </label>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                            <div class="input-group date">--%>
<%--                                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                                                                <f:input type="text" class="form-control" path="standardPMARKExpireDate3" value="" />--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardPMARKExpireDate3"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                </div>--%>
<%--                                                <div class="standard-form-group">--%>
<%--                                                    <srping:bind path="standardName4">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mg-b-10">--%>
<%--                                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                        <h4> ?????? 4 </h4>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">?????? <span class="text-danger">*</span><br>?????????????????????OHSAS?????????????????????????????????QE?????????2??????????????????????????????1????????????????????????????????????--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="bt-df-checkbox pull-left">--%>
<%--                                                                        <div class="row">--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="P" path="standardName4" checked="true" /> <i></i> P--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="Q" path="standardName4" /> <i></i> Q--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="E" path="standardName4" /> <i></i> E--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="I" path="standardName4" /> <i></i> I--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="" path="standardName4"  /> <i></i> Other--%>
<%--                                                                                        <input class="other-radio" type="text"/>--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardName4"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardRegistrationType4">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">??????or?????? <span class="text-danger">*</span>--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="form-select-list">--%>
<%--                                                                        <f:select class="form-control custom-select-value" path="standardRegistrationType4">--%>
<%--                                                                            <option value="??????">??????</option>--%>
<%--                                                                            <option value="?????? ">??????</option>--%>
<%--                                                                        </f:select>--%>
<%--                                                                    </div>--%>
<%--                                                                    <f:errors path="standardRegistrationType4"></f:errors>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardPMARKExpireDate4">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 date-picker-inner">--%>
<%--                                                                    <div class="form-group data-custon-pick data_1">--%>
<%--                                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                            <label class="login2 pull-left">P?????????????????????--%>
<%--                                                                            </label>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                            <div class="input-group date">--%>
<%--                                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                                                                <f:input type="text" class="form-control" path="standardPMARKExpireDate4" value="" />--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardPMARKExpireDate4"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                </div>--%>
<%--                                                <div class="standard-form-group">--%>
<%--                                                    <srping:bind path="standardName5">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 mg-b-10">--%>
<%--                                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                        <h4> ?????? 5 </h4>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">?????? <span class="text-danger">*</span><br>?????????????????????OHSAS?????????????????????????????????QE?????????2??????????????????????????????1????????????????????????????????????--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="bt-df-checkbox pull-left">--%>
<%--                                                                        <div class="row">--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="P" path="standardName5" checked="true" /> <i></i> P--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="Q" path="standardName5" /> <i></i> Q--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="E" path="standardName5" /> <i></i> E--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="I" path="standardName5" /> <i></i> I--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                                <div class="i-checks pull-left">--%>
<%--                                                                                    <label>--%>
<%--                                                                                        <f:radiobutton value="" path="standardName5"  /> <i></i> Other--%>
<%--                                                                                        <input class="other-radio" type="text"/>--%>
<%--                                                                                    </label>--%>
<%--                                                                                </div>--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardName5"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardRegistrationType5">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                    <label class="login2 pull-left">??????or?????? <span class="text-danger">*</span>--%>
<%--                                                                    </label>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                    <div class="form-select-list">--%>
<%--                                                                        <f:select class="form-control custom-select-value" path="standardRegistrationType5">--%>
<%--                                                                            <option value="??????">??????</option>--%>
<%--                                                                            <option value="?????? ">??????</option>--%>
<%--                                                                        </f:select>--%>
<%--                                                                    </div>--%>
<%--                                                                    <f:errors path="standardRegistrationType5"></f:errors>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                    <srping:bind path="standardPMARKExpireDate5">--%>
<%--                                                        <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12 date-picker-inner">--%>
<%--                                                                    <div class="form-group data-custon-pick data_1">--%>
<%--                                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                                            <label class="login2 pull-left">P?????????????????????--%>
<%--                                                                            </label>--%>
<%--                                                                        </div>--%>
<%--                                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                                            <div class="input-group date">--%>
<%--                                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                                                                <f:input type="text" class="form-control" path="standardPMARKExpireDate5" value="" />--%>
<%--                                                                            </div>--%>
<%--                                                                            <f:errors path="standardPMARKExpireDate5"></f:errors>--%>
<%--                                                                        </div>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </srping:bind>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            <srping:bind path="price">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">??????????????????<span class="text-danger">*</span><br>???1 ???????????????????????????????????????2 ??????????????????????????????????????????</label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="price" class="form-control" />--%>
<%--                                                        <f:errors path="price"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="videocall">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <label><f:checkbox class="i-checks" path="videocall" /> ????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                        <f:errors path="videocall"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="expressSupport">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">??????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <label><f:checkbox class="i-checks" path="expressSupport" /> ????????????????????? </label>--%>
<%--                                                        <f:errors path="expressSupport"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="contractStartDate">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="form-group data-custon-pick" id="data_4">--%>
<%--                                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                            <label class="login2 pull-left">????????? <span class="text-danger">*</span>--%>
<%--                                                            </label>--%>
<%--                                                        </div>--%>
<%--                                                        <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                            <div class="input-group date">--%>
<%--                                                                <span class="input-group-addon"><i class="fa fa-calendar"></i></span>--%>
<%--                                                                <f:input type="text" class="form-control" path="contractStartDate" value="" />--%>
<%--                                                                <f:errors path="contractStartDate"></f:errors>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="prefectures">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="prefectures">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${prefectures}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="prefectures"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="customerDepartmentName">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????????????????</label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="customerDepartmentName" class="form-control" />--%>
<%--                                                        <f:errors path="customerDepartmentName"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="personInCharge">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????????????????????<span class="text-danger">*</span><br/>?????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="personInCharge" class="form-control" />--%>
<%--                                                        <f:errors path="personInCharge"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="phoneNumber">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span><br/> ????????????-???????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="phoneNumber" class="form-control" />--%>
<%--                                                        <f:errors path="phoneNumber"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="mobilePhoneNumber">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <br/>????????????-???????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="mobilePhoneNumber" class="form-control" />--%>
<%--                                                        <f:errors path="mobilePhoneNumber"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="faxNumber">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">FAX??????<br/>????????????-???????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="faxNumber" class="form-control" />--%>
<%--                                                        <f:errors path="faxNumber"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="mailAddress">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="mailAddress" class="form-control" />--%>
<%--                                                        <f:errors path="mailAddress"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="nearestStation">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="nearestStation" class="form-control" />--%>
<%--                                                        <f:errors path="nearestStation"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="postalCode">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span><br/>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="postalCode" class="form-control" />--%>
<%--                                                        <f:errors path="postalCode"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="address">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????? <span class="text-danger">*</span><br>????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="address" class="form-control" />--%>
<%--                                                        <f:errors path="address"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="contractWindow">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????? <span class="text-danger">*</span><br/>?????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="contractWindow" class="form-control" />--%>
<%--                                                        <f:errors path="contractWindow"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="invoiceAddress">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????? <span class="text-danger">*</span></label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="bt-df-checkbox pull-left">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                    <div class="i-checks pull-left">--%>
<%--                                                                        <label>--%>
<%--                                                                            <f:radiobutton value="????????? ??????" path="invoiceAddress" checked="true" /> ????????? ??????--%>
<%--                                                                        </label>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                    <div class="i-checks pull-left">--%>
<%--                                                                        <label>--%>
<%--                                                                            <f:radiobutton value="????????????????????????" path="invoiceAddress" /> ????????????????????????--%>
<%--                                                                        </label>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <f:errors path="invoiceAddress"></f:errors>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="saleStaff">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span><br/>???1????????????????????????????????????????????????????????????????????????????????????????????????2????????????????????????????????????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="saleStaff" class="form-control" />--%>
<%--                                                        <f:errors path="saleStaff"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="unitPriceIncreaseStaff">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????? <span class="text-danger">*</span><br/>--%>
<%--                                                            ???????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="bt-df-checkbox pull-left">--%>
<%--                                                            <div class="row">--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                    <div class="i-checks pull-left">--%>
<%--                                                                        <label>--%>
<%--                                                                            <f:radiobutton value="???" path="unitPriceIncreaseStaff" checked="true" /> ???--%>
<%--                                                                        </label>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">--%>
<%--                                                                    <div class="i-checks pull-left">--%>
<%--                                                                        <label>--%>
<%--                                                                            <f:radiobutton value="" path="unitPriceIncreaseStaff" /> Other--%>
<%--                                                                            <input class="other-radio" type="text"/>--%>
<%--                                                                        </label>--%>
<%--                                                                    </div>--%>
<%--                                                                </div>--%>
<%--                                                                <f:errors path="unitPriceIncreaseStaff"></f:errors>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="exhibitionName">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="exhibitionName">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${exhibition_name}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="exhibitionName"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="musashinoProject">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="musashinoProject">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${musashino_project}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="musashinoProject"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="bussinessOver5Years">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????5???????????????????????????????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="bussinessOver5Years">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${bussiness_over_5_years}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="bussinessOver5Years"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="staffQuantity">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="staffQuantity">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${staff_quantity}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="staffQuantity"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="isNEXT">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">NEXT?????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="isNEXT">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${is_next}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="isNEXT"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="personInChargeGood">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????????????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="personInChargeGood">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${person_incharge_good}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="personInChargeGood"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="ordersReceivedType">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? or ???????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="ordersReceivedType">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${orders_received_type}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="ordersReceivedType"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="exchangeContractNote">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="exchangeContractNote" class="form-control" />--%>
<%--                                                        <f:errors path="exchangeContractNote"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="remarks">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">?????? <br/>?????????????????????????????????????????????????????????PC????????????????????????or??????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="remarks" class="form-control" />--%>
<%--                                                        <f:errors path="remarks"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="signContractReason">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">??????????????????????????????ISO???????????????????????????????????????????????????????????????????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="signContractReason" class="form-control" />--%>
<%--                                                        <f:errors path="signContractReason"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="isWithPlusOne">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="isWithPlusOne">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${with_or_without_plusone}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="isWithPlusOne"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="isGroupChatwork">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????????????????????????????????????????? <span class="text-danger">*</span> <br/>??????????????????G??????????????????????????????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="isGroupChatwork">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${is_group_chatwork}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="isGroupChatwork"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="headquartersAddress">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="headquartersAddress" class="form-control" />--%>
<%--                                                        <f:errors path="headquartersAddress"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="paymentTerm">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">???????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <div class="form-select-list">--%>
<%--                                                            <f:select class="form-control custom-select-value" path="paymentTerm">--%>
<%--                                                                <option></option>--%>
<%--                                                                <c:forEach var="item" items="${payment_term}">--%>
<%--                                                                    <option value="${item}">${item}</option>--%>
<%--                                                                </c:forEach>--%>
<%--                                                            </f:select>--%>
<%--                                                        </div>--%>
<%--                                                        <f:errors path="paymentTerm"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="representativeName1">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????? <span class="text-danger">*</span>--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="representativeName1" class="form-control" />--%>
<%--                                                        <f:errors path="representativeName1"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="representativeName2">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????2?????????<br/>2??????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="representativeName2" class="form-control" />--%>
<%--                                                        <f:errors path="representativeName2"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>
<%--                                            <srping:bind path="representativeName3">--%>
<%--                                            <div class="form-group-inner ${status.error ? 'has-error' : ''}">--%>
<%--                                                <div class="row">--%>
<%--                                                    <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">--%>
<%--                                                        <label class="login2 pull-left">????????????3?????????<br/>3??????????????????????????????--%>
<%--                                                        </label>--%>
<%--                                                    </div>--%>
<%--                                                    <div class="col-lg-9 col-md-9 col-sm-9 col-xs-12">--%>
<%--                                                        <f:input type="text" path="representativeName3" class="form-control" />--%>
<%--                                                        <f:errors path="representativeName3"></f:errors>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>
<%--                                            </srping:bind>--%>

<%--                                            <div class="submit-area">--%>
<%--                                                <div class="login-btn-inner">--%>
<%--                                                    <div class="row">--%>
<%--                                                        <div class="col-lg-3"></div>--%>
<%--                                                        <div class="col-lg-9">--%>
<%--                                                            <div class="login-horizental cancel-wp pull-left form-bc-ele">--%>
<%--                                                                <button class="btn btn-sm btn-primary login-submit-cs" id="contract-form-submit">Save Change</button>--%>
<%--                                                                <button class="btn btn-white cancel"><a href="/add-contract">Cancel</a></button>--%>
<%--                                                            </div>--%>
<%--                                                        </div>--%>
<%--                                                    </div>--%>
<%--                                                </div>--%>
<%--                                            </div>--%>

<%--                                        </f:form>--%>
<%--                                    </div>--%>
<%--                                </div>--%>
<%--                            </div>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
    <div class="footer-copyright-area">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                    <div class="footer-copy-right">
                        <p>Copyright ?? 2021. All rights reserved.</p>
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