<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Perekup64</title>
    <script src='https://www.google.com/recaptcha/api.js'></script>
</head>

<body>

<link href=<c:url value="/resources/css/bootstrap-select.min.css"/> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/bootstrap-datetimepicker.min.css"/> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/fileinput.min.css"/> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/form.css"/> rel="stylesheet" type="text/css">

<%@ include file="/resources/template/menu-top.jsp" %>

<div class="container">
    <div class="row">
        <div class="row">
            <c:if test="${not empty error}">
                <div class="alert alert-danger">${error}</div>
            </c:if>
            <c:if test="${not empty msg}">
                <div class="alert alert-info">${msg}</div>
            </c:if>
        </div>
        <section>
            <div class="wizard">
                <form:form id="regForm" name="regForm" role="form" modelAttribute="user" method="POST" enctype="multipart/form-data">
                    <div class="row">
                        <h3 class="text-center">Восстановление пароля</h3>
                    </div>
                    <div class="row top-buffer">
                        <div class="form-group">
                            <label for="email" class="input-label col-md-1">Введите Ваш Email:</label>
                            <div class="col-lg-3">
                                <div class="in-group">
                                    <form:input type="text" name='email' path="email" class="form-control" id="email"/>
                                    </br>
                                    <form:errors path="email" cssClass="error" cssStyle="line-height: 1; color: blue"/>
                                </div>
                                <div class="err">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row top-buffer">
                        <div class="form-group">
                            <label class="input-label col-md-1"></label>
                            <div class="col-lg-3">
                                <div class="in_group">
                                    <button name="submit" type="submit" value="submit" class="btn btn-lg btn-success">
                                        Восстановить пароль
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form:form>
            </div>
        </section>
    </div>
</div>

<%@ include file="/resources/template/footer.jsp" %>

<script src=<c:url value="/resources/js/form.js"/>></script>
<script src=<c:url value="/resources/js/form-validation.js"/>></script>
<script src=<c:url value="/resources/js/bootstrap-select.min.js"/>></script>
<script src=<c:url value="/resources/js/moment.min.js"/>></script>
<script src=<c:url value="/resources/js/bootstrap-datetimepicker.min.js"/>></script>
<script src=<c:url value="/resources/js/countries.js"/>></script>
<script src=<c:url value="/resources/js/jquery.validate.min.js"/>></script>
</body>

</html>