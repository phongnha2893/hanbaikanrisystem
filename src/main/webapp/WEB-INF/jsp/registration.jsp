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
    <title>Keiyaku</title>
    <link href="<c:url value="/resources/static/css/bootstrap.min.css" />" type="text/css" rel="stylesheet">
    <link href="<c:url value="/resources/css/login.css" />" type="text/css" rel="stylesheet">

</head>
<body>
<div class="container" >
    <f:form method="POST" modelAttribute="userForm"  class="form-signin" autocomplete="off">
        <h2 class="form-signin-heading text-center">Create your account</h2>
        <spring:bind path="username">
            <div class="form-group ${status.error ? 'has-error' : ''}">
                <f:input type="text" path="username" class="form-control" placeholder="Username"
                            autofocus="true" autocomplete="off"></f:input>
                <f:errors path="username"></f:errors>
            </div>
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

        <button class="btn btn-lg btn-primary btn-block font-weight-bold" type="submit">Submit</button>
        <h5 class="text-center mt-3">Have an account? <a href="/login">Login</a></h5>
    </f:form>
</div>
<script src="<c:url value="/resources/static/js/vendor/jquery-1.12.4.min.js" />"
        type="text/javascript"></script>
<script src="<c:url value="/resources/static/js/bootstrap.min.js" />"
        type="text/javascript"></script>
<script src="<c:url value="/resources/js/index.js" />" type="text/javascript"></script>
</body>

</html>
