<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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

    <title>Perekup64</title>

</head>

<body>

   	 <%@ include file="/resources/template/menu-top.jsp" %>


    <div class="container">

        <div class="row">
            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                <sec:authorize ifNotGranted="ROLE_ADMIN">
                    <div class="col-lg-12 text-center intro-div">
                        <h1 style="font-size: 63px;">Все перекупы в одном месте!</h1>
                        <h2 style="font-size: 63px;"><sec:authentication property="name" />, теперь и Вы с нами!</h2>
                        <p class="lead">Покупай машину с выгодой</p>
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-success btn-block" href="/Auctioner/myprofile">Мой профиль</a>
                        </div>
                        <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <%--<sec:authorize ifAnyGranted="ROLE_SELLER">--%>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-info btn-block" href="/Auctioner/myprofile-auctions">Мои лоты</a>
                        </div>
                        </sec:authorize>
                        <%--<sec:authorize ifNotGranted="ROLE_SELLER">--%>
                        <%--<div class="col-md-2">--%>
                            <%--<a class="btn btn-lg btn-info btn-block" href="/Auctioner/upgrade"  data-toggle="tooltip" data-placement="top" title="Become an Auctioneer and sell everything!">Auctioneer</a>--%>
                        <%--</div>--%>
                        <%--</sec:authorize>--%>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-primary btn-block" href="/Auctioner/auctions?categoryId=all">Просмотреть лоты</a>
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <div class="col-lg-12 text-center intro-div">
                        <h1 style="font-size: 63px;">Приветсвую тебя, о повелитель барыг!</h1>
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-success btn-block" href="/Auctioner/admin-users">Пользователи</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-danger btn-block" href="/Auctioner/myprofile">Мой профиль</a>
                        </div>
                    </div>
                    <div class="col-lg-12 text-center intro-div">
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-info btn-block" href="/Auctioner/admin">Доска</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-primary btn-block" href="/Auctioner/auctions?categoryId=all">Аукционы</a>
                        </div>
                    </div>
                </sec:authorize>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
                <div class="col-lg-12 text-center intro-div">
                    <h1 style="font-size: 63px;">Добро пожаловать на аукцион проверенных автомобилей!</h1>
                    <p class="lead">Покупай машину с выгодой</p>
                    <div class="col-md-offset-4 col-md-2">
                        <a class="btn_main btn-lg btn-success btn-block" href="/Auctioner/login">Войти</a>
                    </div>
                    <div class="col-md-2">
                        <a class="btn_main btn-lg btn-primary btn-block" href="/Auctioner/registration">Зарегистрироваться</a>
                    </div>
                </div>
            </sec:authorize>
        </div>


    </div>

    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
