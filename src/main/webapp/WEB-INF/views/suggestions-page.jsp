<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>

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

    <title>cars64</title>
    <%--<script src='https://www.google.com/recaptcha/api.js'></script>--%>
</head>

<body>

<link href=
      <c:url value="/resources/css/bootstrap-select.min.css"/> rel="stylesheet" type="text/css">
<link href=
      <c:url value="/resources/css/bootstrap-datetimepicker.min.css"/> rel="stylesheet" type="text/css">
<link href=
      <c:url value="/resources/css/fileinput.min.css"/> rel="stylesheet" type="text/css">
<link href=
      <c:url value="/resources/css/form.css"/> rel="stylesheet" type="text/css">

<%@ include file="/resources/template/menu-top.jsp" %>

<div class="container">
    <div class="text-center">
        <%--SUGGESTIONS START--%>
        <div class="tab-content">
            <div class="tab-pane active" role="tabpanel">
                <div class="row">
                    <table>
                        <h5>Заявки на продажу</h5>
                        <tr>
                            <td><b>Имя</b></td>
                            <td><b>Марка/Модель</b></td>
                            <td><b>Год</b></td>
                            <td><b>телефон</b></td>
                        </tr>
                        <c:forEach items="${suggestions}" var="suggestion">
                            <tr>
                                <td>${suggestion.name}</td>
                                <td>${suggestion.brandAndModel}</td>
                                <td>${suggestion.releaseDate}</td>
                                <td>${suggestion.phoneNumber}</td>
                                <td><fmt:formatDate value="${suggestion.suggestionDate}" pattern="dd-MM-yyyy HH:mm:ss z" timeZone="UTC+4"/></td>
                            </tr>
                        </c:forEach>
                    </table>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <%--SUGGESTIONS END--%>
        </section>
    </div>
    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
