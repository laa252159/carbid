<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <title>Auctioner</title>

</head>

<body>

   	 <%@ include file="/resources/template/menu-top.jsp" %>


    <div class="container">

        <div class="row">
            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                <sec:authorize ifNotGranted="ROLE_ADMIN">
                    <div class="col-lg-12 text-center intro-div">
                        <h1 style="font-size: 63px;">Welcome to Auctioner <sec:authentication property="name" />!</h1>
                        <p class="lead">Buy and Sell Anything</p>
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-success btn-block" href="/Auctioner/myprofile">My Account</a>
                        </div>
                        <sec:authorize ifAnyGranted="ROLE_SELLER">
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-info btn-block" href="/Auctioner/myprofile-auctions">My Auctions</a>
                        </div>
                        </sec:authorize>
                        <sec:authorize ifNotGranted="ROLE_SELLER">
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-info btn-block" href="/Auctioner/upgrade"  data-toggle="tooltip" data-placement="top" title="Become an Auctioneer and sell everything!">Auctioneer</a>
                        </div>
                        </sec:authorize>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-primary btn-block" href="/Auctioner/auctions?categoryId=all">Search</a>
                        </div>
                    </div>
                </sec:authorize>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <div class="col-lg-12 text-center intro-div">
                        <h1 style="font-size: 63px;">Welcome Admin!</h1>
                        <div class="col-md-offset-3 col-md-2">
                            <a class="btn btn-lg btn-success btn-block" href="/Auctioner/admin-users">Users</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-info btn-block" href="/Auctioner/admin">Dashboard</a>
                        </div>
                        <div class="col-md-2">
                            <a class="btn btn-lg btn-primary btn-block" href="/Auctioner/admin-auctions">Auctions</a>
                        </div>
                    </div>
                </sec:authorize>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
                <div class="col-lg-12 text-center intro-div">
                    <h1 style="font-size: 63px;">Welcome to Auctioner!</h1>
                    <p class="lead">Buy and Sell Anything</p>
                    <div class="col-md-offset-4 col-md-2">
                        <a class="btn btn-lg btn-success btn-block" href="/Auctioner/login">Login</a>
                    </div>
                    <div class="col-md-2">
                        <a class="btn btn-lg btn-primary btn-block" href="/Auctioner/registration">Join us!</a>
                    </div>
                </div>
            </sec:authorize>
        </div>


    </div>

    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
