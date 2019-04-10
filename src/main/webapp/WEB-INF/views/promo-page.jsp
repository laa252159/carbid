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
        <%--PROMO FORM START--%>
        <form:form id="form" name="formPromo" role="form"
                   modelAttribute="promoDto"
                   method="POST" enctype="multipart/form-data">
            <div class="tab-content">
                <div class="tab-pane active" role="tabpanel">
                    <h2 class="text-center">Разослать всем подтвержденным пользователям</h2>
                    <div class="row content-row">
                        <div class="col-md-6" style="padding-right:20px;">


                            <div class="row">
                                <div class="form-group">
                                    <label for="subject" class="input-label col-md-3">Тема:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:input type="text" name="promoDto.subject" path="subject"
                                                        id="subject"
                                                        class="form-control" placeholder=""
                                                        value="${promoDto.subject}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="form-group">
                                    <label for="suggestion" class="input-label col-md-3">Текст:</label>
                                    <div class="col-lg-8">
                                        <div class="in-group">
                                            <form:textarea type="textarea" name="promoDto.suggestion" path="suggestion"
                                                        id="suggestion"
                                                        class="form-control" placeholder="" rows="10"
                                                        value="${promoDto.suggestion}"/>
                                        </div>
                                        <div class="err">
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <%--<c:if test="${notAll}">--%>
                                            <%--<p style="color: red">Обязательно заполните все поля формы</p>--%>
                                        <%--</c:if>--%>
                                        <%--<div class="g-recaptcha" data-sitekey="6LeBTm8UAAAAAOTAyuvd6Q8nQ2Q0zbqERrCNlNKk"></div>--%>
                                        <ul class="list-inline center-pill">
                                            <li>
                                                <button name="submit" type="submit" value="submit"
                                                        class="btn_main btn-success btn-block promobtn btn-lg ">Разослать
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
        <%--PROMO FORM END--%>
        <%--<p><a class="btn_main btn-lg btn-success btn-block suggestbuttoncolor list-inline center-pill" href="/">Перейти на стартовую страницу</a></p>--%>
        </section>
    </div>
    <%@ include file="/resources/template/footer.jsp" %>

</body>

</html>
