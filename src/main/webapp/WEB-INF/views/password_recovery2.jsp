<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<html>
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

    <title>Login Page</title>


</head>
<body onload='document.loginForm.username.focus();'>

<%@ include file="/resources/template/menu-top.jsp" %>

<div class="col-md-4 col-md-offset-4">
    <c:if test="${not empty error}">
        <div class="alert alert-danger">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
    </c:if>
    <c:if test="${not empty msg}">
        <div class="alert alert-info">
            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                ${msg}
        </div>
    </c:if>
</div>
<br/>
<br/>
<div class="col-md-4 col-md-offset-4 well">
    <form name="recoveryForm" role="form" action="<c:url value='j_spring_security_check' />" method="POST">
        <div class="row">
            <h3 class="text-center">Восстановление пароля</h3>
        </div>
        <label for="password" class="input-label col-md-1">Пароль:</label>
        <div class="col-lg-3">
            <div class="in-group">
                <form:input type="password" name='password' path="password"
                            class="form-control" id="password"/>
                </br><form:errors each="error : ${fields.errors('password')}"
                                  cssClass="error"
                                  cssStyle="line-height: 1; color: blue"/>
            </div>
            <div class="err">
            </div>
        </div>
        <label for="password" class="input-label col-md-1">Повторить пароль:</label>
        <div class="col-lg-3">
            <div class="in-group">
                <form:input type="password" name='matchingPassword'
                            path="matchingPassword" class="form-control"
                            id="matchingPassword"/>
                <label id="divCheckPasswordMatch"></label>
            </div>
            <div class="err">
            </div>
        </div>
        <button name="submit" type="submit" value="submit" class="btn btn-success">Сохранить пароль</button>
    </form>
</div>

<!-- Footer -->
<%@ include file="/resources/template/footer.jsp" %>


</body>
</html>
