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
                <c:if test="${not empty msg}">
    				<div class="alert alert-info">${msg}</div>
    			</c:if>
    			<c:if test="${not empty error}">
    				<div class="alert alert-danger">${error}</div>
    			</c:if>
    		</div>
        	<section>
                <div class="wizard">
                 <div class="wizard-inner">
                     <div class="connecting-line"></div>
                     <ul class="nav nav-tabs" role="tablist">

                         <li role="presentation" class="active">
                             <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Данные аукциона">
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

                 <form:form id="form" name="auctionForm" role="form" modelAttribute="formAuction" method="POST" enctype="multipart/form-data">
                     <div class="tab-content">
                         <div class="tab-pane active" role="tabpanel" id="step1">
                            <h2 class="text-center">Данные аукциона</h2>
                            <div class="row content-row">
                                <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                                    <%--<div class="row">--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label for="name" class="input-label col-md-3">Название лота:</label>--%>
                                            <%--<div class="col-lg-8">--%>
                                                <%--<div class="in-group">--%>
                                                    <%--<form:input type="text" name="auction.name" path="auction.name" id="name" class="form-control" placeholder="Auction" value="${formAuction.auction.name}" />--%>
                                            		<%--<form:errors path="auction.name" cssClass="error" />--%>
                                                <%--</div>--%>
                                                <%--<div class="err">--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <%--<div class="row top-buffer">--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label for="description" class="input-label col-md-3">Описание:</label>--%>
                                            <%--<div class="col-lg-8">--%>
                                                <%--<div class="in-group">--%>
                                                    <%--<form:textarea rows="5" name="description" path="auction.description" id="description" class="form-control" placeholder="Auction Info..." />--%>
                                                	<%--&lt;%&ndash; <form:errors path="formAuction.auction.description" cssClass="error" /> &ndash;%&gt;--%>
                                                <%--</div>--%>
                                                <%--<div class="err">--%>
                                                <%--</div>--%>
                                            <%--</div>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                        <div class="row">
                                            <div class="form-group">
                                                <label for="brand" class="input-label col-md-3">Марка:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.brand" path="auction.brand" id="brand" class="form-control" placeholder="Марка" value="${formAuction.auction.brand}" />
                                                        <form:errors path="auction.brand" cssClass="error" />
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
                                                        <form:input type="text" name="auction.model" path="auction.model" id="model" class="form-control" placeholder="Модель" value="${formAuction.auction.model}" />
                                                        <form:errors path="auction.model" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="released" class="input-label col-md-3">Год выпуска:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.released" path="auction.released" id="released" class="form-control" placeholder="Год выпуска" value="${formAuction.auction.released}" />
                                                        <form:errors path="auction.released" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="run" class="input-label col-md-3">Пробег:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.run" path="auction.run" id="run" class="form-control" placeholder="Пробег" value="${formAuction.auction.run}" />
                                                        <form:errors path="auction.run" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="engineType" class="input-label col-md-3">Тип двигателя:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.engineType" path="auction.engineType" id="engineType" class="form-control" placeholder="Тип двигателя" value="${formAuction.auction.engineType}" />
                                                        <form:errors path="auction.engineType" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="power" class="input-label col-md-3">Мощность:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.power" path="auction.power" id="power" class="form-control" placeholder="Мощность" value="${formAuction.auction.power}" />
                                                        <form:errors path="auction.power" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="transmission" class="input-label col-md-3">Коробка:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.transmission" path="auction.transmission" id="transmission" class="form-control" placeholder="Коробка" value="${formAuction.auction.transmission}" />
                                                        <form:errors path="auction.transmission" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="body" class="input-label col-md-3">Кузов:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.body" path="auction.body" id="body" class="form-control" placeholder="Кузов" value="${formAuction.auction.body}" />
                                                        <form:errors path="auction.body" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="drive" class="input-label col-md-3">Привод:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.drive" path="auction.drive" id="drive" class="form-control" placeholder="Привод" value="${formAuction.auction.drive}" />
                                                        <form:errors path="auction.drive" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="color" class="input-label col-md-3">Цвет:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.color" path="auction.color" id="color" class="form-control" placeholder="Цвет" value="${formAuction.auction.color}" />
                                                        <form:errors path="auction.color" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="doors" class="input-label col-md-3">Количество дверей:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.doors" path="auction.doors" id="doors" class="form-control" placeholder="Количество дверей" value="${formAuction.auction.doors}" />
                                                        <form:errors path="auction.doors" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="bodyState" class="input-label col-md-3">Состояние кузова:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:textarea rows="5" name="auction.bodyState" path="auction.bodyState" id="bodyState" class="form-control" placeholder="Состояние кузова" />
                                                        <form:errors path="auction.bodyState" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="owners" class="input-label col-md-3">Владельцев по ПТС:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.owners" path="auction.owners" id="owners" class="form-control" placeholder="Владельцев по ПТС" value="${formAuction.auction.owners}" />
                                                        <form:errors path="auction.owners" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="vin" class="input-label col-md-3">VIN код:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.vin" path="auction.vin" id="vin" class="form-control" placeholder="VIN код" value="${formAuction.auction.vin}" />
                                                        <form:errors path="auction.vin" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="gibdd" class="input-label col-md-3">База ГИБДД:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.gibdd" path="auction.gibdd" id="gibdd" class="form-control" placeholder="База ГИБДД" value="${formAuction.auction.gibdd}" />
                                                        <form:errors path="auction.gibdd" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="fssp" class="input-label col-md-3">База судебных приставов:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:input type="text" name="auction.fssp" path="auction.fssp" id="fssp" class="form-control" placeholder="База судебных приставов" value="${formAuction.auction.fssp}" />
                                                        <form:errors path="auction.fssp" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="driveState" class="input-label col-md-3">Cостояние ходовой:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:textarea rows="5" name="auction.driveState" path="auction.driveState" id="driveState" class="form-control" placeholder="Cостояние ходовой" value="${formAuction.auction.driveState}" />
                                                        <form:errors path="auction.driveState" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="row">
                                            <div class="form-group">
                                                <label for="engineState" class="input-label col-md-3">Cостояние двигателя:</label>
                                                <div class="col-lg-8">
                                                    <div class="in-group">
                                                        <form:textarea rows="5" name="auction.engineState" path="auction.engineState" id="engineState" class="form-control" placeholder="Cостояние двигателя" value="${formAuction.auction.engineState}" />
                                                        <form:errors path="auction.engineState" cssClass="error" />
                                                    </div>
                                                    <div class="err">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                </div>
                                <div class="col-md-6">
                                    <%--<div class="form-group">--%>
                                        <%--<label for="name" class="input-label col-md-3">Категория:</label>--%>
                                        <%--<div class="col-lg-8">--%>
                                            <%--<form:select path="categoryName" name="categoryName" class="selectpicker"--%>
                                                         <%--data-live-search="true" data-container="body"--%>
                                                         <%--data-max-options="1" title="Choose one of the following...">--%>
                                                <%--<form:options items="${categories}" itemValue="name"--%>
                                                              <%--itemLabel="name"></form:options>--%>
                                            <%--</form:select>--%>
                                        <%--</div>--%>
                                    <%--</div>--%>
                                    <div class="form-group">
                                        <c:set var="collored" value="Вторичный окрас" scope="page" />
                                        <c:set var="destructed" value="Требует восстановления" scope="page" />
                                        <label for="name" class="input-label col-md-3">Крашеные и битые элементы:</label>
                                        <div class="col-lg-8">
                                            <div class="col-lg-8">
                                                <table class="input-label col-md-3">
                                                    <tr>
                                                        <td>п.л. дверь</td>
                                                        <td>
                                                            <form:select path="el1" name="el1" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el1}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="1_c">${collored}</option>
                                                                        <option value="1_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el1 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="1_c" selected>${collored}</option>
                                                                        <option value="1_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el1 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="1_c">${collored}</option>
                                                                        <option value="1_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>з.л. дверь</td>
                                                        <td>
                                                            <form:select path="el2" name="el2" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el2}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="2_c">${collored}</option>
                                                                        <option value="2_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el2 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="2_c" selected>${collored}</option>
                                                                        <option value="2_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el2 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="2_c">${collored}</option>
                                                                        <option value="2_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>з.л. крыло</td>
                                                        <td>
                                                            <form:select path="el3" name="el3" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el3}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="3_c">${collored}</option>
                                                                        <option value="3_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el3 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="3_c" selected>${collored}</option>
                                                                        <option value="3_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el3 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="3_c">${collored}</option>
                                                                        <option value="3_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>кр. багажника</td>
                                                        <td>
                                                            <form:select path="el4" name="el4" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el4}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="4_c">${collored}</option>
                                                                        <option value="4_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el4 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="4_c" selected>${collored}</option>
                                                                        <option value="4_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el4 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="4_c">${collored}</option>
                                                                        <option value="4_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>з.п. крыло</td>
                                                        <td>
                                                            <form:select path="el5" name="el5" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el5}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="5_c">${collored}</option>
                                                                        <option value="5_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el5 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="5_c" selected>${collored}</option>
                                                                        <option value="5_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el5 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="5_c">${collored}</option>
                                                                        <option value="5_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>з.п. дверь</td>
                                                        <td>
                                                            <form:select path="el6" name="el6" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el6}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="6_c">${collored}</option>
                                                                        <option value="6_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el6 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="6_c" selected>${collored}</option>
                                                                        <option value="6_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el6 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="6_c">${collored}</option>
                                                                        <option value="6_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>п.п. дверь</td>
                                                        <td>
                                                            <form:select path="el7" name="el7" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el7}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="7_c">${collored}</option>
                                                                        <option value="7_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el7 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="7_c" selected>${collored}</option>
                                                                        <option value="7_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el7 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="7_c">${collored}</option>
                                                                        <option value="7_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>п.п. крыло</td>
                                                        <td>
                                                            <form:select path="el8" name="el1" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el1}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="8_c">${collored}</option>
                                                                        <option value="8_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el1 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="8_c" selected>${collored}</option>
                                                                        <option value="8_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el1 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="8_c">${collored}</option>
                                                                        <option value="8_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>капот</td>
                                                        <td>
                                                            <form:select path="el9" name="el1" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el1}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="9_c">${collored}</option>
                                                                        <option value="9_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el1 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="9_c" selected>${collored}</option>
                                                                        <option value="9_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el1 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="9_c">${collored}</option>
                                                                        <option value="9_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>крыша</td>
                                                        <td>
                                                            <form:select path="el10" name="el10" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el10}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="10_c">${collored}</option>
                                                                        <option value="10_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el10 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="10_c" selected>${collored}</option>
                                                                        <option value="10_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el10 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="10_c">${collored}</option>
                                                                        <option value="10_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>п.л. крыло </td>
                                                        <td>
                                                            <form:select path="el11" name="el11" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el11}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="11_c">${collored}</option>
                                                                        <option value="11_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el11 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="11_c" selected>${collored}</option>
                                                                        <option value="11_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el11 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="11_c">${collored}</option>
                                                                        <option value="11_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>п. бампер</td>
                                                        <td>
                                                            <form:select path="el12" name="el12" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el12}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="12_c">${collored}</option>
                                                                        <option value="12_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el12 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="12_c" selected>${collored}</option>
                                                                        <option value="12_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el12 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="12_c">${collored}</option>
                                                                        <option value="12_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>з. бампер</td>
                                                        <td>
                                                            <form:select path="el13" name="el13" class="selectpicker"
                                                                         data-live-search="true" data-container="body"
                                                                         data-max-options="1" title="">
                                                                <c:choose>
                                                                    <c:when test="${empty formAuction.el13}">
                                                                        <option value="" selected>-</option>
                                                                        <option value="13_c">${collored}</option>
                                                                        <option value="13_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el13 eq 'c'}">
                                                                        <option value="">-</option>
                                                                        <option value="13_c" selected>${collored}</option>
                                                                        <option value="13_d">${destructed}</option>
                                                                    </c:when>
                                                                    <c:when test="${formAuction.el13 eq 'd'}">
                                                                        <option value="">-</option>
                                                                        <option value="13_c">${collored}</option>
                                                                        <option value="13_d" selected>${destructed}</option>
                                                                    </c:when>
                                                                </c:choose>
                                                            </form:select>
                                                        </td>
                                                    </tr>
                                                </table>
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
                                     <div class="row">
                                         <div class="form-group">
                                             <label for="firstBid" class="input-label col-md-3">Стартовая цена:</label>
                                             <div class="col-lg-8">
                                                 <div class="input-group">
                                                     <span class="input-group-addon"><span class="glyphicon glyphicon-rub"></span></span>
                                                     <form:input type="text" name="firstBid" path="auction.firstBid" id="firstBid" class="form-control" placeholder="Required" />
                                                     <span class="input-group-addon"> 000</span>
                                             		<%-- <form:errors path="auction.name" cssClass="error" /> --%>
                                                </div>
                                                <div class="err">
                                                </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="buyPrice" class="input-label col-md-3">Цена покупки сейчас:</label>
                                             <div class="col-lg-8">
                                                 <div class="input-group">
                                                     <span class="input-group-addon"><span class="glyphicon glyphicon-rub"></span></span>
                                                     <form:input type="text" name="buyPrice" path="auction.buyPrice" id="buyPrice" class="form-control" placeholder="Optional" />
                                                     <span class="input-group-addon"> 000</span>
                                                     <%-- <form:errors path="auction.name" cssClass="error" /> --%>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="ends" class="input-label col-md-3">Дата и время окончания:</label>
                                             <div class="col-lg-8">
                                                 <div class='input-group date' id='datetimepicker1'>
                                                     <form:input type='text' path="auction.ends" id="ends" name="ends" class="form-control" />
                                                     <span class="input-group-addon">
                                                         <span class="glyphicon glyphicon-calendar"></span>
                                                    </span>
                                                 </div>
                                                 <div class="err">
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="col-md-6">
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="location" class="input-label col-md-3">Город:</label>
                                             <div class="col-lg-8">
                                                 <div class="in_group">
                                                     <form:input path="auction.location.name" id="location" name="location" class="form-control"></form:input>
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
                                      <li><button type="button" class="btn btn-lg btn-default prev-step">Назад</button></li>
                                      <li><button type="button" class="btn btn-lg btn-primary next-step">Продолжить</button></li>
                                  </ul>
                              </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="step3">
                             <h2 class="text-center">Загрузить фото</h2>
                             <div class="row content-row">
                                 <input id="input-1" name="input1" type="file" class="file-loading" multiple accept="image/x-png, image/jpeg"/>
                              </div>
                              <div class="row top-buffer">
                                  <ul class="list-inline pull-right">
                                      <li><button type="button" class="btn btn-lg btn-default prev-step">Назад</button></li>
                                      <li><button type="button" class="btn btn-lg btn-primary next-step">Продолжить</button></li>
                                  </ul>
                              </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="complete">
                             <h2 class="text-center">Создание аукциона почти завершено.</h2>
                             <div class="row content-row">
                                 <div class="text-center">
                                     <p class="lead">Вы успешно прошли все шаги.</p>
                                     <p class="lead">Нажмите сохранить, чтобы лот был опубликован для торгов.</p>
                                 </div>
                             </div>
                             <div class="row top-buffer">
                                 <ul class="list-inline pull-right">
                                     <form:input type="hidden" name='auctionid' path="auction.auctionid" class="form-control" />
                                     <li><button type="button" class="btn btn-lg btn-default prev-step">Назад</button></li>
                                     <li><button name="submit" type="submit" value="submit" class="btn btn-lg btn-success">Сохранить</button></li>
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
        $('#form').validate({
            onfocusout: function(element) {
                $(element).valid();
            },
    		rules: {
    			'auction.name': {
    				required: true
    			},
                'auction.description': {
    				required: true
    			},
                'auction.category': {
    				required: true
    			},
                'auction.firstBid': {
    				required: true
    			},
                'auction.ends': {
    				required: true
    			},
                'auction.location.name': {
    				required: true
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

    $(function () {
        $('#datetimepicker1').datetimepicker();
        // populateCountries("country");
    });

    /* File Upload */
    $(document).on('ready', function() {
        $("#input-1").fileinput({
            showUpload: false,
            maxFileCount: 20,
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
