<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<link href=<c:url value="/resources/css/bootstrap.min.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/bootstrap-lumen.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/iconmoon.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/jquery.mCustomScrollbar.min.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/topnav.css" /> rel="stylesheet" type="text/css">
<link href=<c:url value="/resources/css/style.css" /> rel="stylesheet" type="text/css">


<%--Top Navbar --%>
<div class="container-fluid container-full">
  <nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="navbar-header">
    	<button class="navbar-toggle" type="button" data-toggle="collapse" data-target=".js-navbar-collapse">
			<span class="sr-only">Toggle navigation</span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
			<span class="icon-bar"></span>
		</button>
		<a class="navbar-brand" href="home"><span class="icon-travel-car"></span></a>
	</div>

	<div class="collapse navbar-collapse js-navbar-collapse">
		<ul class="nav navbar-nav">

            <%-- Categories --%>
            <%@ include file="/resources/template/categories.jsp" %>

		</ul>
        <form id="signin" class="nav navbar-nav navbar-form navbar-right" role="form">
            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                <li>
                    <sec:authorize ifAnyGranted="ROLE_ADMIN">
                        <a href="/admin-inbox" class="btn btn-default btn-sm btn-link">
                    </sec:authorize>
                    <sec:authorize ifNotGranted="ROLE_ADMIN">
                        <a href="/myprofile-inbox" class="btn btn-default btn-sm btn-link">
                    </sec:authorize>
                        <%--<div class="notification-icon">--%>
                            <%--<span class="glyphicon glyphicon-envelope"></span>--%>
                            <%--<span id="msg-badge" class="badge" style="display: none"></span>--%>
                        <%--</div>--%>
                    </a>
                </li>
                <sec:authorize ifAnyGranted="ROLE_ADMIN">
                    <li><a href="/admin" style="color:orange">Админка</a></li>
                    <li><a href="/j_spring_security_logout">Выйти</a></li>
                </sec:authorize>
                 <%--<sec:authorize ifAnyGranted="ROLE_BIDDER">--%>
                    <%--<li><a href="upgrade" style="color:orange">Become An Auctioner</a></li>--%>
                <%--</sec:authorize>--%>
                <sec:authorize ifNotGranted="ROLE_ADMIN">
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href=
                        "#" id="account">Мой профиль (<sec:authentication property="name" />) <span class=
                        "caret"></span></a>
                        <ul class="dropdown-menu">
                            <li><a href="/myprofile">Настройки аккаунта</a></li>
                            <sec:authorize ifAnyGranted="ROLE_SELLER">
                                <li><a href="myauctions">Мои аукционы</a></li>
                            </sec:authorize>
                            <li class="divider"></li>
                            <li><a href="/j_spring_security_logout">Выйти</a></li>
                        </ul>
                    </li>
                </sec:authorize>
            </sec:authorize>
            <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
                <a class="btn btn-primary" href="login">Вход</a>
                or
                <a class="btn btn-warning" href="registration">Регистрация</a>
            </sec:authorize>
        </form>
	</div><!-- /.nav-collapse -->
  </nav>
</div>
