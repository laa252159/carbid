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
                        <%--<h3 style="font-size: 43px;">Все перекупы в одном месте!</h3>--%>
                        <%--<h4 style="font-size: 33px;"><sec:authentication property="name" />, теперь и Вы с нами!</h4>--%>
                            <%--&lt;%&ndash;<p class="lead">Покупай машину с выгодой</p>&ndash;%&gt;--%>
                        <%--<div class="col-md-offset-3 col-md-2">--%>
                            <%--<a class="btn btn-lg btn-success btn-block" href="/myprofile">Мой профиль</a>--%>
                        <%--</div>--%>
                        <sec:authorize ifAnyGranted="ROLE_ADMIN">
                            <%--<sec:authorize ifAnyGranted="ROLE_SELLER">--%>
                            <div class="col-md-2">
                                <a class="btn btn-lg btn-info btn-block" href="/myprofile-auctions">Мои лоты</a>
                            </div>
                            <div class="col-md-2">
                                <a class="btn btn-lg btn-primary btn-block" href="/auctions?categoryId=all">Просмотреть лоты</a>
                            </div>
                        </sec:authorize>
                            <%--<sec:authorize ifNotGranted="ROLE_SELLER">--%>
                            <%--<div class="col-md-2">--%>
                            <%--<a class="btn btn-lg btn-info btn-block" href="/upgrade"  data-toggle="tooltip" data-placement="top" title="Become an Auctioneer and sell everything!">Auctioneer</a>--%>
                            <%--</div>--%>
                            <%--</sec:authorize>--%>
                    </div>
                </sec:authorize>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <div class="col-lg-12 text-center intro-div">
                        <h1 style="font-size: 63px;">Приветсвую тебя, о повелитель барыг!</h1>
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-success btn-block" href="/admin-users">Пользователи</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-danger btn-block" href="/myprofile">Мой профиль</a>
                        </div>
                    </div>
                    <div class="col-lg-12 text-center intro-div">
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-info btn-block" href="/admin">Доска</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-primary btn-block" href="/auctions?categoryId=all">Аукционы</a>
                        </div>
                    </div>
                </sec:authorize>
            </sec:authorize>
            <%--<sec:authorize ifAnyGranted="ROLE_ANONYMOUS">--%>
                <%--<div class="col-lg-12 text-center intro-div">--%>
                    <%--<h1 style="font-size: 23px; font-family: 'Calibri Light'">Хотите знать больше или принять участие, - заходите!</h1>--%>
                        <%--&lt;%&ndash;<p class="lead" style="font-family: 'Helvetica Neue'">Покупай машину с выгодой</p>&ndash;%&gt;--%>
                    <%--<div class="col-md-offset-4 col-md-2">--%>
                        <%--<a class="btn_main btn-lg btn-success btn-block" href="/login">Войти</a>--%>
                    <%--</div>--%>
                    <%--<div class="col-md-2">--%>
                        <%--<a class="btn_main btn-lg btn-primary btn-block" href="/registration">Зарегистрироваться</a>--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</sec:authorize>--%>


             <div class="col-sm-12 text-center">
                 <div class="container">
                     <%--<h1 class="page-header"><strong>${filter.category.name}</strong></h1>--%>
                     <div class="row">
                         <div class="col-md-9 col-xs-12" >

                             <%@ include file="auction-list.jsp" %>

                             <%--<div class="center-block">--%>
                                 <%--<nav aria-label="Page navigation">--%>
                                     <%--<ul class="pagination pagination-lg">--%>
                                         <%--<c:if test="${filter.pageNum > 1 }">--%>
                                             <%--<li class="page-item">--%>
                                                 <%--<a class="page-link" href="/auctions?page=1" aria-label="First">--%>
                                                     <%--<span aria-hidden="true">&lt;&lt;</span>--%>
                                                     <%--<span class="sr-only">First</span>--%>
                                                 <%--</a>--%>
                                             <%--</li>--%>
                                             <%--<li class="page-item">--%>
                                                 <%--<a class="page-link" href="/auctions?page=${filter.pageNum - 1}" aria-label="Previous">--%>
                                                     <%--<span aria-hidden="true">&lt;</span>--%>
                                                     <%--<span class="sr-only">Предыдущий</span>--%>
                                                 <%--</a>--%>
                                             <%--</li>--%>
                                         <%--</c:if>--%>
                                         <%--<c:forEach items="${filter.pages}" var="page">--%>
                                             <%--<c:if test="${page == filter.pageNum}">--%>
                                                 <%--<li class="page-item active"><a class="page-link" href="/auctions?page=${page}">${page}</a></li>--%>
                                             <%--</c:if>--%>
                                             <%--<c:if test="${page != filter.pageNum}">--%>
                                                 <%--<li class="page-item"><a class="page-link" href="/auctions?page=${page}">${page}</a></li>--%>
                                             <%--</c:if>--%>
                                         <%--</c:forEach>--%>
                                         <%--<c:if test="${filter.pageNum < filter.numberofPages}">--%>
                                             <%--<li class="page-item">--%>
                                                 <%--<a class="page-link" href="/auctions?page=${filter.pageNum + 1}" aria-label="Next">--%>
                                                     <%--<span aria-hidden="true">&gt;</span>--%>
                                                     <%--<span class="sr-only">Следующий</span>--%>
                                                 <%--</a>--%>
                                             <%--</li>--%>
                                             <%--<li class="page-item">--%>
                                                 <%--<a class="page-link" href="/auctions?page=${filter.numberofPages}" aria-label="Last">--%>
                                                     <%--<span aria-hidden="true">&gt;&gt;</span>--%>
                                                     <%--<span class="sr-only">Last</span>--%>
                                                 <%--</a>--%>
                                             <%--</li>--%>
                                         <%--</c:if>--%>
                                     <%--</ul>--%>
                                 <%--</nav>--%>
                             <%--</div>--%>
                         </div>
                     </div>
                 </div>
             </div>



         </div>

        <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
            <div class="col-lg-12 text-center intro-div">
                <h1 style="font-size: 23px; font-family: 'Calibri Light'">Хотите знать больше или принять участие, - заходите!</h1>
                    <%--<p class="lead" style="font-family: 'Helvetica Neue'">Покупай машину с выгодой</p>--%>
                <div class="col-md-offset-4 col-md-2">
                    <a class="btn_main btn-lg btn-success btn-block" href="/login">Войти</a>
                </div>
                <div class="col-md-2">
                    <a class="btn_main btn-lg btn-primary btn-block" href="/registration">Зарегистрироваться</a>
                </div>
            </div>
        </sec:authorize>

     </div>

    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
