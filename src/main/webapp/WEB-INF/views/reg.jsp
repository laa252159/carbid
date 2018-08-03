<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

</head>

<body>

     <link href=<c:url value="/resources/css/bootstrap-select.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/bootstrap-datetimepicker.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/fileinput.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/form.css" /> rel="stylesheet" type="text/css">

      <%@ include file="/resources/template/menu-top.jsp" %>

     <div class="container">
        <div class="row">
            <div class="row">
    			<c:if test="${not empty error}">
    				<div class="alert alert-danger">${error}</div>
    			</c:if>
    			<c:if test="${not empty msg}">
    				<div class="alert alert-info">${msg}</div>
    			</c:if>
    		</div>
        	<section>
                <div class="wizard">
                 <div class="wizard-inner">
                     <div class="connecting-line"></div>
                     <ul class="nav nav-tabs" role="tablist">

                         <li role="presentation" class="active">
                             <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Данные пользователя">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-pencil"></i>
                                 </span>
                             </a>
                         </li>

                         <li role="presentation" class="disabled">
                             <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Локация">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-globe"></i>
                                 </span>
                             </a>
                         </li>
                         <li role="presentation" class="disabled">
                             <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Фото">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-picture"></i>
                                 </span>
                             </a>
                         </li>

                         <li role="presentation" class="disabled">
                             <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Завершение">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-ok"></i>
                                 </span>
                             </a>
                         </li>
                     </ul>
                 </div>

                 <form:form id="form" name="regForm" role="form" modelAttribute="user" method="POST" enctype="multipart/form-data">
                     <div class="tab-content">
                         <div class="tab-pane active" role="tabpanel" id="step1">
                            <h2 class="text-center">Данные пользователя</h2>
                            <h3 class="text-center">пожалуйста заполните все поля</h3>
                            <div class="row content-row">
                                <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="username" class="input-label col-md-3">Логин:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="text" name='username' path="username" class="form-control" id="username" />
                                                    <form:errors path="username" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row top-buffer">
                                        <div class="form-group">
                                            <label for="email" class="input-label col-md-3">Email:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="text" name='email' path="email" class="form-control" id="email" />
                                                    <form:errors path="email" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row top-buffer">
                                        <div class="form-group">
                                            <label for="pwd" class="input-label col-md-3">Пароль:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="password" name='password' path="password" class="form-control" id="pwd" />
                          						    <form:errors path="password" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="firstName" class="input-label col-md-3">Имя:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="text" id="firstName" name='firstName' path="firstName" class="form-control" />
    					                            <form:errors path="firstName" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row top-buffer">
                                        <div class="form-group">
                                            <label for="lastName" class="input-label col-md-3">Фамилия:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="text" name='lastName' path="lastName" class="form-control" id="lastName" />
       						                        <form:errors path="lastName" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row top-buffer">
                                        <div class="form-group">
                                            <label for="phone" class="input-label col-md-3">Телефон:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="text" name='phone' path="phone" class="form-control" id="phone" />
                       						        <form:errors path="phone" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                 </div>
                             </div>
                             <div class="row top-buffer">
                                 <ul class="list-inline pull-right">
                                     <li><button type="button" class="btn btn-lg btn-primary next-step">Продолжить</button></li>
                                 </ul>
                             </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="step2">
                             <h2 class="text-center">Локация</h2>
                             <div class="row content-row">
                                 <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="city" class="input-label col-md-3">Город:</label>
                                             <div class="col-lg-8">
                                                 <div class="in_group">
                                                     <form:input type="text" name='city' path="city" class="form-control" id="city" />
                            						 <form:errors path="city" cssClass="error" />
                                                 </div>
                                                 <div class="err">
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="col-md-6">
                                 </div>
                              </div>
                              <div class="row top-buffer">
                                  <ul class="list-inline pull-right">
                                      <li><button type="button" class="btn btn-lg btn-default prev-step">Назад</button></li>
                                      <li><button type="button" class="btn btn-lg btn-primary next-step">Продолжить</button></li>
                                  </ul>
                              </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="step3">
                             <h2 class="text-center">Загрузить фото</h2>
                             <div class="row content-row">
                                 <input id="input-1" name="input1" type="file" class="file-loading" accept="image/x-png, image/jpeg"/>
                                 <p>Вы можете пропустить этот шаг или загрузить фото позднее.</p>
                              </div>
                              <div class="row top-buffer">
                                  <ul class="list-inline pull-right">
                                      <li><button type="button" class="btn btn-lg btn-default prev-step">Назад</button></li>
                                      <li><button type="button" class="btn btn-lg btn-primary next-step">Продолжить</button></li>
                                  </ul>
                              </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="complete">
                             <h2 class="text-center">Регистрация пользователя окончена</h2>
                             <div class="row content-row">
                                 <div class="text-center">
                                     <jsp:include page="contract.jsp"/>
                                     <p class="lead">Мы проверим Вашу информацию и в течение суток Ваш аккаунт сможет принимать участие в торгах</p>
                                     <p class="lead">Только подтвержденные аккаунты могут принимать участие в торгах</p>
                                 </div>
                             </div>
                             <div class="row top-buffer">
                                 <ul class="list-inline pull-right">
                                     <li><button type="button" class="btn btn-lg btn-default prev-step">Назад</button></li>
                                     <li><button name="submit" type="submit" value="submit" class="btn btn-lg btn-success">Принимаю условия</button></li>
                                 </ul>
                             </div>
                         </div>
                         <div class="clearfix"></div>
                     </div>
                 </form:form>
                </div>
            </section>
        </div>
    </div>

    <%@ include file="/resources/template/footer.jsp" %>

    <script src=<c:url value="/resources/js/form.js" />></script>
    <script src=<c:url value="/resources/js/bootstrap-select.min.js" />></script>
    <script src=<c:url value="/resources/js/moment.min.js" />></script>
    <script src=<c:url value="/resources/js/bootstrap-datetimepicker.min.js" />></script>
    <script src=<c:url value="/resources/js/countries.js" />></script>
    <script src=<c:url value="/resources/js/fileinput.min.js" />></script>
    <script src=<c:url value="/resources/js/jquery.validate.min.js" />></script>

    <script>

    /* Validator */
    $().ready(function() {
        var validator = $('#form').validate({
            onfocusout: function(element) {
                $(element).valid();
            },
            rules: {
    			firstName: {
    				required: true
    			},
    			lastName: {
    				required:true
    			},
    			username: {
    				required:true
    			},
    			email: {
    				required:true
    			},
    			password: {
    				required:true
    			},
    			phone: {
    				required:true
    			},
    			city: {
    				required:true
    			},
    			address: {
    				required:true
    			},
    			postalCode: {
    				required:true
    			},
    			afm: {
    				required:true
    			}
    		},
    		highlight: function(element, errorClass) {
    			$(element).closest('.form-group').addClass('has-error');
    		},
            unhighlight: function(element, errorClass) {
    			$(element).closest('.form-group').removeClass('has-error');
    		},
            errorPlacement: function(error, element) {
                error.appendTo(element.parent().next("div.err"));
            }
    	});
    });

    // $(function () {
    //     $('#datetimepicker1').datetimepicker();
    //     populateCountries("country");
    // });

    /* File Upload */
    $(document).on('ready', function() {
        $("#input-1").fileinput({
            showUpload: false,
            maxFileCount: 1,
            mainClass: "input-group-lg",
            browseClass: "btn btn-success",
            browseLabel: "Pick Images",
            browseIcon: "<i class=\"glyphicon glyphicon-picture\"></i> ",
            removeClass: "btn btn-danger",
            removeLabel: "Delete",
            removeIcon: "<i class=\"glyphicon glyphicon-trash\"></i> "
            // allowedFileTypes: "image",
        });
    });

    </script>

</body>

</html>
