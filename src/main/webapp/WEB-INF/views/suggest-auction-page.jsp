<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
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
        <%--SUGGEST FORM START--%>
        <form:form id="form" name="formSuggestAuction" role="form"
                   modelAttribute="suggestAuctionDto"
                   method="POST" enctype="multipart/form-data">
            <div class="tab-content">
                <div class="tab-pane active" role="tabpanel">
                    <h2 class="text-center">Продать авто</h2>
                    <div class="row content-row">
                        <div class="col-md-6" style="padding-right:20px;">


                            <div class="row">
                                <div class="form-group">
                                    <label for="brand" class="input-label col-md-3">Ваше
                                        имя:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="name" path="name"
                                                        id="name"
                                                        class="form-control" placeholder="Имя"
                                                        value="${suggestAuctionDto.name}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="brand" class="input-label col-md-3">Телефон:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="phone" path="phone"
                                                        id="name"
                                                        class="form-control" placeholder="Телефон"
                                                        value="${suggestAuctionDto.phone}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="brand" class="input-label col-md-3">Ваш
                                        e-mail:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="email" path="email"
                                                        id="email"
                                                        class="form-control" placeholder="email"
                                                        value="${suggestAuctionDto.email}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="brand" class="input-label col-md-3">Марка
                                        авто:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="brand" path="brand"
                                                        id="brand"
                                                        class="form-control" placeholder="Марка"
                                                        value="${suggestAuctionDto.brand}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="model" class="input-label col-md-3">Модель:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="suggestAuctionDto.model"
                                                        path="model" id="model" class="form-control"
                                                        placeholder="Модель"
                                                        value="${suggestAuctionDto.model}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="model" class="input-label col-md-3">Год
                                        выпуска:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="year"
                                                        path="year" id="year" class="form-control"
                                                        placeholder="Год выпуска"
                                                        value="${suggestAuctionDto.year}"/>
                                                <%--<form:errors path="auction.model" cssClass="error" />--%>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <div class="row content-row">
                                                <input id="input-1" name="input1" type="file"
                                                       multiple style="color: black; size: 10px"
                                                       accept="image/x-png, image/jpeg"/>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <c:if test="${notAll}">
                                            <p style="color: red">Обязательно заполните все поля формы и прекрепите фото автомобиля!</p>
                                        </c:if>
                                        <div class="g-recaptcha" data-sitekey="6LeBTm8UAAAAAOTAyuvd6Q8nQ2Q0zbqERrCNlNKk"></div>
                                        <ul class="list-inline pull-right">
                                            <li>
                                                <button name="submit" type="submit" value="submit"
                                                        class="btn btn-lg btn-success">Разместить аукцион
                                                </button>
                                            </li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="clearfix"></div>
            </div>
        </form:form>
        <%--SUGGEST FORM END--%>
        <%--<p class="lead">Только подтвержденные аккаунты <b>с внесенным депозитом не менее 1000 рублей</b> могут принимать участие в торгах</p>--%>
        <p><a class="btn-success" href="/">Перейти на стартовую страницу</a></p>
        </section>
    </div>
    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
