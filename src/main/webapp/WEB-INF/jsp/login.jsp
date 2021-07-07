<%@ include file="import.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>販売管理システム</title>

    <link rel="stylesheet" type="text/css" href="/resources/static/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/static/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/static/css/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/static/css/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/static/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="/resources/static/css/editor/select2.css">

    <link rel="stylesheet" type="text/css" href="/resources/css/util.css">
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css">


</head>
<body>

    <div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
            <f:form class="login100-form validate-form p-l-55 p-r-55 p-t-178" id="login-form" method="POST" action="login">
					<span class="login100-form-title">
                        Sign In
					</span>
                <div class="form-group ${error != null ? 'has-error' : ''}" >
<%--                    <span> ${message}</span>--%>
                    <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                        <input class="input100" type="text" name="username" placeholder="Username">
                        <span class="focus-input100"></span>
                    </div>
                    <div class="wrap-input100 validate-input" data-validate = "Please enter password">
                        <input class="input100" type="password" name="password" placeholder="Password">
                        <span class="focus-input100"></span>
                    </div>
                    <span> ${error}</span>
                </div>
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>


                <div class="container-login100-form-btn">
                    <button class="login100-form-btn" type="submit">
                        Log in
                    </button>
                </div>
            </f:form>
        </div>
    </div>
    </div>
    <!--===============================================================================================-->
    <script src="/resources/static/js/vendor/jquery-1.12.4.min.js"></script>
    <!--===============================================================================================-->
    <script src="/resources/static/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="/resources/static/js/popper.js"></script>
    <script src="/resources/static/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="/resources/static/js/editable/select2.js"></script>
    <!--===============================================================================================-->
    <script src="/resources/js/login.js"></script>

</body>

</html>
