<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
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

</head>

<body>

   	 <%@ include file="/resources/template/menu-top.jsp" %>


    <div class="container">

        <div class="row">
            <div class="col-lg-12 text-center">
                <h4 class="text-center">Простите у Вас нет прав на такие действия.</h4>
                <div class="row text-center">
                    <a href="/" class="btn btn-primary">Вернуться на главную</a>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
