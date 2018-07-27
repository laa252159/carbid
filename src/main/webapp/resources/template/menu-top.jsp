<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href=<c:url value="/resources/css/bootstrap-custom.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/iconmoon.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/jquery.mCustomScrollbar.min.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/hover.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/style.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/topnav.css" /> rel="stylesheet" type="text/css">


<%--Top Navbar --%>
<nav class="navbar navbar-default navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
    	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="/"><span class="icon-travel-car"></span> Perekup64</a>
	</div>

	<div class="collapse navbar-collapse js-navbar-collapse">

        <%--<div class="col-md-offset-3 col-md-4">--%>
            <%--<form class="navbar-center" role="search" action="/auctions">--%>
                <%--<div class="form-group" style="margin-bottom: 0px;">--%>
                    <%--<div class="input-group">--%>
                        <%--<input type="text" name="searchString" class="form-control" placeholder="Поиск">--%>
                        <%--<span class="input-group-btn">--%>
                            <%--<button class="btn btn-default" type="submit"><span class="glyphicon glyphicon-search"></span></button>--%>
                        <%--</span>--%>
                        <%--<input type="hidden" name="categoryId" value="all">--%>
                        <%--<input type="hidden" name="page" value="1">--%>
                    <%--</div>--%>
                <%--</div>--%>
            <%--</form>--%>
        <%--</div>--%>

        <div class="nav navbar-nav navbar-right z-class">
            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                <li>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a class="bottom-color" href="/admin-inbox" class="btn btn-default btn-sm btn-link" style="padding-bottom:10px">
                    </sec:authorize>
                    <sec:authorize ifNotGranted="ROLE_ADMIN">
                        <a class="bottom-color" href="/myprofile-inbox" class="btn btn-default btn-sm btn-link" style="padding-bottom:10px;">
                    </sec:authorize>
                        <%--<div class="notification-icon">--%>
                            <%--<span class="glyphicon glyphicon-envelope"></span>--%>
                            <%--<span id="msg-badge" class="badge" style="display: none"></span>--%>
                        <%--</div>--%>
                    </a>
                </li>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <li><a class="bottom-color" href="/admin" style="color:orange">Админка</a></li>
                    <li><a class="bottom-color" href="/j_spring_security_logout">Выйти</a></li>
                </sec:authorize>
                <%--продавцов назначаем ручками через БД в перспективе--%>
                <%--<sec:authorize ifAnyGranted="ROLE_BIDDER">--%>
                <%--<sec:authorize ifNotGranted="ROLE_SELLER">--%>
                    <%--<li><a class="bottom-color" href="upgrade" style="color:orange">Become An Auctioner</a></li>--%>
                <%--</sec:authorize>--%>
                <%--</sec:authorize>--%>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <%--<sec:authorize ifAnyGranted="ROLE_SELLER">--%>
                   <li><a class="bottom-color" href="/new-auction">Создать лот</a></li>
               </sec:authorize>
                <sec:authorize ifNotGranted="ROLE_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle bottom-color" data-toggle="dropdown" href="#"
                            id="account"><span class="glyphicon glyphicon-user"></span><i class="glyphicon glyphicon-none"></i>
                            <sec:authentication property="name" /><span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="/myprofile">Настройки аккаунта</a></li>
                            <sec:authorize ifAnyGranted="ROLE_ADMIN">
                            <%--<sec:authorize ifAnyGranted="ROLE_SELLER">--%>
                                <li><a href="/myprofile-auctions">Мои лоты</a></li>
                            </sec:authorize>
                            <li class="divider"></li>
                            <li style="color: red;"><a href="/j_spring_security_logout"><span class="glyphicon glyphicon-off"></span><i class="glyphicon glyphicon-none"></i>Выйти</a></li>
                        </ul>
                    </li>
                </sec:authorize>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
                <li><a class="bottom-color" href="/login">Вход</a></li>
                <li><a class="bottom-color" href="/registration">Регистрация</a></li>
            </sec:authorize>
        </div>
	</div><!-- /.nav-collapse -->
  </div>
</nav>
<div class="nav-wrapper">
    <nav id="nav" class="navbar navbar-default navbar-lower" role="navigation">
      <div class="container-fluid">
        <%--<div class="collapse navbar-collapse collapse-buttons">--%>
            <%--<ul class="nav navbar-nav">--%>
                <%--<li><a class="bottom-color" href="/auctions?categoryId=all">Просмотреть все лоты</a></li>--%>

                <%--&lt;%&ndash; Categories &ndash;%&gt;--%>
                <%--&lt;%&ndash;<%@ include file="/resources/template/categories.jsp" %>&ndash;%&gt;--%>

    		<%--</ul>--%>
        <%--</div>--%>
      </div>
    </nav>
</div>
