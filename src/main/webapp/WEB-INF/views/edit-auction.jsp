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
            <form:form id="form" name="auctionForm" role="form" modelAttribute="formAuction" method="POST"
                       enctype="multipart/form-data">
                <h2 class="text-center">Подробнее</h2>
                <div class="row content-row">
                    <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                        <div class="row">
                            <div class="form-group">
                                <label for="brand" class="input-label col-md-3">Марка:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:input type="text" name="auction.brand" path="auction.brand" id="brand"
                                                    class="form-control" placeholder="Марка"
                                                    value="${formAuction.auction.brand}"/>
                                        <form:errors path="auction.brand" cssClass="error"/>
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
                                        <form:input type="text" name="auction.model" path="auction.model" id="model"
                                                    class="form-control" placeholder="Модель"
                                                    value="${formAuction.auction.model}"/>
                                        <form:errors path="auction.model" cssClass="error"/>
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
                                        <form:input type="text" name="auction.released" path="auction.released"
                                                    id="released" class="form-control" placeholder="Год выпуска"
                                                    value="${formAuction.auction.released}"/>
                                        <form:errors path="auction.released" cssClass="error"/>
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
                                        <form:input type="text" name="auction.run" path="auction.run" id="run"
                                                    class="form-control" placeholder="Пробег"
                                                    value="${formAuction.auction.run}"/>
                                        <form:errors path="auction.run" cssClass="error"/>
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
                                        <form:input type="text" name="auction.engineType" path="auction.engineType"
                                                    id="engineType" class="form-control" placeholder="Тип двигателя"
                                                    value="${formAuction.auction.engineType}"/>
                                        <form:errors path="auction.engineType" cssClass="error"/>
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
                                        <form:input type="text" name="auction.power" path="auction.power" id="power"
                                                    class="form-control" placeholder="Мощность"
                                                    value="${formAuction.auction.power}"/>
                                        <form:errors path="auction.power" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label for="engineCapacity" class="input-label col-md-3">Объём двигателя:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:input type="text" name="auction.engineCapacity" path="auction.engineCapacity"
                                                    id="engineCapacity" class="form-control" placeholder="Объём двигателя"
                                                    value="${formAuction.auction.engineCapacity}"/>
                                        <form:errors path="auction.engineCapacity" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="input-label col-md-3">Трансмиссия:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:select path="auction.transmission"
                                                     name="auction.transmission"
                                                     data-live-search="true"
                                                     data-container="body"
                                                     data-max-options="1"
                                                     title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.auction.transmission}">
                                                    <option value="" selected>-</option>
                                                    <option value="МКПП">
                                                        МКПП
                                                    </option>
                                                    <option value="АКПП">
                                                        АКПП
                                                    </option>
                                                    <option value="Вариатор">
                                                        Вариатор
                                                    </option>
                                                    <option value="Робот">
                                                        Робот
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.transmission eq 'МКПП'}">
                                                    <option value="">-</option>
                                                    <option value="МКПП" selected>
                                                        МКПП
                                                    </option>
                                                    <option value="АКПП">
                                                        АКПП
                                                    </option>
                                                    <option value="Вариатор">
                                                        Вариатор
                                                    </option>
                                                    <option value="Робот">
                                                        Робот
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.transmission eq 'АКПП'}">
                                                    <option value="">-</option>
                                                    <option value="МКПП">
                                                        МКПП
                                                    </option>
                                                    <option value="АКПП" selected>
                                                        АКПП
                                                    </option>
                                                    <option value="Вариатор">
                                                        Вариатор
                                                    </option>
                                                    <option value="Робот">
                                                        Робот
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.transmission eq 'Вариатор'}">
                                                    <option value="">-</option>
                                                    <option value="МКПП">
                                                        МКПП
                                                    </option>
                                                    <option value="АКПП">
                                                        АКПП
                                                    </option>
                                                    <option value="Вариатор" selected>
                                                        Вариатор
                                                    </option>
                                                    <option value="Робот">
                                                        Робот
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.transmission eq 'Робот'}">
                                                    <option value="">-</option>
                                                    <option value="МКПП">
                                                        МКПП
                                                    </option>
                                                    <option value="АКПП">
                                                        АКПП
                                                    </option>
                                                    <option value="Вариатор">
                                                        Вариатор
                                                    </option>
                                                    <option value="Робот" selected>
                                                        Робот
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.transmission" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="input-label col-md-3">Кузов:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:select path="auction.body"
                                                     name="auction.body"
                                                     data-live-search="true"
                                                     data-container="body"
                                                     data-max-options="1"
                                                     title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.auction.body}">
                                                    <option value="" selected>-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'седан'}">
                                                    <option value="">-</option>
                                                    <option value="седан" selected>
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'хетчбэк'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк" selected>
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'универсал'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал" selected>
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'внедорожник'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник" selected>
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'кабриолет'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет" selected>
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'купе'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе" selected>
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'минивэн'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн" selected>
                                                        минивэн
                                                    </option>
                                                    <option value="фургон">
                                                        фургон
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.body eq 'фургон'}">
                                                    <option value="">-</option>
                                                    <option value="седан">
                                                        седан
                                                    </option>
                                                    <option value="хетчбэк">
                                                        хетчбэк
                                                    </option>
                                                    <option value="универсал">
                                                        универсал
                                                    </option>
                                                    <option value="внедорожник">
                                                        внедорожник
                                                    </option>
                                                    <option value="кабриолет">
                                                        кабриолет
                                                    </option>
                                                    <option value="купе">
                                                        купе
                                                    </option>
                                                    <option value="минивэн">
                                                        минивэн
                                                    </option>
                                                    <option value="фургон" selected>
                                                        фургон
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.body" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="input-label col-md-3">Привод:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:select path="auction.drive"
                                                     name="auction.drive"
                                                     data-live-search="true"
                                                     data-container="body"
                                                     data-max-options="1"
                                                     title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.auction.drive}">
                                                    <option value="" selected>-</option>
                                                    <option value="передний">
                                                        передний
                                                    </option>
                                                    <option value="задний">
                                                        задний
                                                    </option>
                                                    <option value="полный">
                                                        полный
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.drive eq 'передний'}">
                                                    <option value="">-</option>
                                                    <option value="передний" selected>
                                                        передний
                                                    </option>
                                                    <option value="задний">
                                                        задний
                                                    </option>
                                                    <option value="полный">
                                                        полный
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.drive eq 'задний'}">
                                                    <option value="">-</option>
                                                    <option value="передний">
                                                        передний
                                                    </option>
                                                    <option value="задний" selected>
                                                        задний
                                                    </option>
                                                    <option value="полный">
                                                        полный
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.drive eq 'полный'}">
                                                    <option value="">-</option>
                                                    <option value="передний">
                                                        передний
                                                    </option>
                                                    <option value="задний">
                                                        задний
                                                    </option>
                                                    <option value="полный" selected>
                                                        полный
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.drive" cssClass="error"/>
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
                                        <form:input type="text" name="auction.color" path="auction.color" id="color"
                                                    class="form-control" placeholder="Цвет"
                                                    value="${formAuction.auction.color}"/>
                                        <form:errors path="auction.color" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="input-label col-md-3">Количество дверей:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:select path="auction.doors"
                                                     name="auction.doors"
                                                     data-live-search="true"
                                                     data-container="body"
                                                     data-max-options="1"
                                                     title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.auction.doors}">
                                                    <option value="" selected>-</option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.doors eq '2'}">
                                                    <option value="">-</option>
                                                    <option value="2" selected>
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.doors eq '3'}">
                                                    <option value="">-</option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3" selected>
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.doors eq '4'}">
                                                    <option value="">-</option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4" selected>
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.doors eq '5'}">
                                                    <option value="">-</option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5" selected>
                                                        5
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.doors" cssClass="error"/>
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
                                        <form:textarea rows="5" name="auction.bodyState" path="auction.bodyState"
                                                       id="bodyState" class="form-control"
                                                       placeholder="Состояние кузова"/>
                                        <form:errors path="auction.bodyState" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="input-label col-md-3">Владельцев по ПТС:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:select path="auction.owners"
                                                     name="auction.owners"
                                                     data-live-search="true"
                                                     data-container="body"
                                                     data-max-options="1"
                                                     title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.auction.owners}">
                                                    <option value="" selected>-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '1'}">
                                                    <option value="">-</option>
                                                    <option value="1" selected>
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '2'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2" selected>
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '3'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3" selected>
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '4'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4" selected>
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '5'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5" selected>
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '6'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6" selected>
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '7'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7" selected>
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '8'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8" selected>
                                                        8
                                                    </option>
                                                    <option value="9">
                                                        9
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.owners eq '9'}">
                                                    <option value="">-</option>
                                                    <option value="1">
                                                        1
                                                    </option>
                                                    <option value="2">
                                                        2
                                                    </option>
                                                    <option value="3">
                                                        3
                                                    </option>
                                                    <option value="4">
                                                        4
                                                    </option>
                                                    <option value="5">
                                                        5
                                                    </option>
                                                    <option value="6">
                                                        6
                                                    </option>
                                                    <option value="7">
                                                        7
                                                    </option>
                                                    <option value="8">
                                                        8
                                                    </option>
                                                    <option value="9" selected>
                                                        9
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.owners" cssClass="error"/>
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
                                        <form:input type="text" name="auction.vin" path="auction.vin" id="vin"
                                                    class="form-control" placeholder="VIN код"
                                                    value="${formAuction.auction.vin}"/>
                                        <form:errors path="auction.vin" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="form-group">
                                <label class="input-label col-md-3">Город:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:select path="auction.location.name"
                                                     name="auction.location.name"
                                                     data-live-search="true"
                                                     data-container="body"
                                                     data-max-options="1"
                                                     title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.auction.location.name}">
                                                    <option value="" selected>-</option>
                                                    <option value="Саратов">
                                                        Саратов
                                                    </option>
                                                    <option value="Энгельс">
                                                        Энгельс
                                                    </option>
                                                    <option value="Саратовская область">
                                                        Саратовская область
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.location.name eq 'Саратов'}">
                                                    <option value="">-</option>
                                                    <option value="Саратов" selected>
                                                        Саратов
                                                    </option>
                                                    <option value="Энгельс">
                                                        Энгельс
                                                    </option>
                                                    <option value="Саратовская область">
                                                        Саратовская область
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.location.name eq 'Энгельс'}">
                                                    <option value="">-</option>
                                                    <option value="Саратов">
                                                        Саратов
                                                    </option>
                                                    <option value="Энгельс" selected>
                                                        Энгельс
                                                    </option>
                                                    <option value="Саратовская область">
                                                        Саратовская область
                                                    </option>
                                                </c:when>
                                                <c:when test="${formAuction.auction.location.name eq 'Саратовская область'}">
                                                    <option value="">-</option>
                                                    <option value="Саратов">
                                                        Саратов
                                                    </option>
                                                    <option value="Энгельс">
                                                        Энгельс
                                                    </option>
                                                    <option value="Саратовская область" selected>
                                                        Саратовская область
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.location.name" cssClass="error"/>
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
                                        <form:input type="text" name="auction.gibdd" path="auction.gibdd" id="gibdd"
                                                    class="form-control" placeholder="База ГИБДД"
                                                    value="${formAuction.auction.gibdd}"/>
                                        <form:errors path="auction.gibdd" cssClass="error"/>
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
                                        <form:input type="text" name="auction.fssp" path="auction.fssp" id="fssp"
                                                    class="form-control" placeholder="База судебных приставов"
                                                    value="${formAuction.auction.fssp}"/>
                                        <form:errors path="auction.fssp" cssClass="error"/>
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
                                        <form:textarea rows="5" name="auction.driveState" path="auction.driveState"
                                                       id="driveState" class="form-control"
                                                       placeholder="Cостояние ходовой"
                                                       value="${formAuction.auction.driveState}"/>
                                        <form:errors path="auction.driveState" cssClass="error"/>
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
                                        <form:textarea rows="5" name="auction.engineState" path="auction.engineState"
                                                       id="engineState" class="form-control"
                                                       placeholder="Cостояние двигателя"
                                                       value="${formAuction.auction.engineState}"/>
                                        <form:errors path="auction.engineState" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <c:set var="collored" value="Вторичный окрас" scope="page"/>
                            <c:set var="destructed" value="Требует восстановления" scope="page"/>
                            <label class="input-label col-md-3">Крашеные и битые элементы:</label>
                            <div class="col-lg-8">
                                <div class="col-lg-8">
                                    <table class="input-label col-md-3">
                                        <tr>
                                            <td>пер.лев. дверь</td>
                                            <td>
                                                <form:select path="el1" name="el1"
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
                                            <td>зад.лев. дверь</td>
                                            <td>
                                                <form:select path="el2" name="el2"
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
                                            <td>зад.лев. крыло</td>
                                            <td>
                                                <form:select path="el3" name="el3"
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
                                                <form:select path="el4" name="el4"
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
                                            <td>зад.прав. крыло</td>
                                            <td>
                                                <form:select path="el5" name="el5"
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
                                            <td>зад.пер. дверь</td>
                                            <td>
                                                <form:select path="el6" name="el6"
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
                                            <td>пер.прав. дверь</td>
                                            <td>
                                                <form:select path="el7" name="el7"
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
                                            <td>пер.прав. крыло</td>
                                            <td>
                                                <form:select path="el8" name="el1"
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
                                                <form:select path="el9" name="el1"
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
                                                <form:select path="el10" name="el10"
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
                                            <td>пер.лев. крыло</td>
                                            <td>
                                                <form:select path="el11" name="el11"
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
                                            <td>пер. бампер</td>
                                            <td>
                                                <form:select path="el12" name="el12"
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
                                            <td>зад. бампер</td>
                                            <td>
                                                <form:select path="el13" name="el13"
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

                <div class="row content-row">
                    <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                        <div class="row">
                            <div class="form-group">
                                <label for="firstBid" class="input-label col-md-3">Стартовая цена:</label>
                                <div class="col-lg-8">
                                    <div class="input-group">
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-rub"></span></span>
                                        <form:input type="text" name="firstBid" path="auction.firstBid" id="firstBid"
                                                    class="form-control" placeholder="Required"/>
                                        <span class="input-group-addon"></span>
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
                                        <span class="input-group-addon"><span
                                                class="glyphicon glyphicon-rub"></span></span>
                                        <form:input type="text" name="buyPrice" path="auction.buyPrice" id="buyPrice"
                                                    class="form-control" placeholder="Optional"/>
                                        <span class="input-group-addon"></span>
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
                                        <form:input type='text' path="auction.ends" id="ends" name="ends"
                                                    class="form-control"/>
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
                </div>

                <h2 class="text-center">Дополнительная информация</h2>

                <div class="row content-row">
                    <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                            <%--Усилитель руля--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="powerSteering" class="input-label col-md-4">Усилитель руля:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="powerSteering" name="powerSteering"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.powerSteering}">
                                                    <option value="" selected>-</option>
                                                    <option value="гидро">гидро</option>
                                                    <option value="электро">электро</option>
                                                </c:when>
                                                <c:when test="${formAuction.powerSteering eq 'гидро'}">
                                                    <option value="">-</option>
                                                    <option value="гидро" selected>гидро</option>
                                                    <option value="электро">электро</option>
                                                </c:when>
                                                <c:when test="${formAuction.powerSteering eq 'электро'}">
                                                    <option value="">-</option>
                                                    <option value="гидро">гидро</option>
                                                    <option value="электро" selected>электро</option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>

                            </div>
                        </div>
                            <%--Усилитель руля--%>
                            <%--Управление климатом--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="climateControl" class="input-label col-md-4">Управление климатом:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="climateControl" name="climateControl"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.climateControl}">
                                                    <option value="" selected>-</option>
                                                    <option value="кондиционер">кондиционер</option>
                                                    <option value="климат контроль">климат контроль</option>
                                                </c:when>
                                                <c:when test="${formAuction.climateControl eq 'кондиционер'}">
                                                    <option value="">-</option>
                                                    <option value="кондиционер" selected>кондиционер</option>
                                                    <option value="климат контроль">климат контроль</option>
                                                </c:when>
                                                <c:when test="${formAuction.climateControl eq 'климат контроль'}">
                                                    <option value="">-</option>
                                                    <option value="кондиционер">кондиционер</option>
                                                    <option value="климат контроль" selected>климат контроль</option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Управление климатом--%>
                            <%--мультируль--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="climateControl"
                                       class="input-label col-md-4">Мультируль:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="controlOnWheel" name="controlOnWheel"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--мультируль--%>
                            <%--Отделка руля и рукоятки кпп кожей--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="leatherWheel" class="input-label col-md-4">Отделка руля и рукоятки кпп
                                    кожей:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="leatherWheel" name="leatherWheel"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Отделка руля и рукоятки кпп кожей--%>
                            <%--Подогрев руля--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="heatedWheel" class="input-label col-md-4">Подогрев руля:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="heatedWheel" name="heatedWheel"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Подогрев руля--%>
                            <%--обогрев сидений--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="heatedSeats" class="input-label col-md-4">Обогрев сидений:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="heatedSeats" name="heatedSeats"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.heatedSeats}">
                                                    <option value="" selected>-</option>
                                                    <option value="передние">передние</option>
                                                    <option value="передние и задние">передние и задние</option>
                                                </c:when>
                                                <c:when test="${formAuction.heatedSeats eq 'передние'}">
                                                    <option value="">-</option>
                                                    <option value="передние" selected>передние</option>
                                                    <option value="передние и задние">передние и задние</option>
                                                </c:when>
                                                <c:when test="${formAuction.heatedSeats eq 'передние и задние'}">
                                                    <option value="">-</option>
                                                    <option value="передние">передние</option>
                                                    <option value="передние и задние" selected>передние и задние
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--обогрев сидений--%>
                            <%--Электро обогрев и электро настройка зеркал--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="heatedMirrors" class="input-label col-md-4">Электро обогрев и электро
                                    настройка зеркал:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="heatedMirrors" name="heatedMirrors"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Электро обогрев и электро настройка зеркал--%>
                            <%--Электростеклоподъемники--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="powerWindows" class="input-label col-md-4">Эл/стеклоподъемники:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="powerWindows" name="powerWindows"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.powerWindows}">
                                                    <option value="" selected>-</option>
                                                    <option value="передние">передние</option>
                                                    <option value="передние и задние">передние и задние</option>
                                                </c:when>
                                                <c:when test="${formAuction.powerWindows eq 'передние'}">
                                                    <option value="">-</option>
                                                    <option value="передние" selected>передние</option>
                                                    <option value="передние и задние">передние и задние</option>
                                                </c:when>
                                                <c:when test="${formAuction.powerWindows eq 'передние и задние'}">
                                                    <option value="">-</option>
                                                    <option value="передние">передние</option>
                                                    <option value="передние и задние" selected>передние и задние
                                                    </option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Электростеклоподъемники--%>
                            <%--электропривод передних сидений--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="powerSeatsFront" class="input-label col-md-4">Электропривод передних
                                    сидений:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="powerSeatsFront" name="powerSeatsFront"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--электропривод передних сидений--%>
                            <%--Датчик света--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="lightSensor" class="input-label col-md-4">Датчик света:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="lightSensor" name="lightSensor"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Датчик света--%>
                            <%--Датчик дождя--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="rainSensor" class="input-label col-md-4">Датчик дождя:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="rainSensor" name="rainSensor"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Датчик дождя--%>
                            <%--Датчики парковки передний--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="frontParkingSensors" class="input-label col-md-4">Датчики парковки
                                    передний:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="frontParkingSensors" name="frontParkingSensors"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Датчики парковки передний--%>
                            <%--Датчики парковки задний--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="rearParkingSensors" class="input-label col-md-4">Датчики парковки
                                    задний:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="rearParkingSensors" name="rearParkingSensors"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Датчики парковки задний--%>
                            <%--Круиз-контроль--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="climateControl" class="input-label col-md-4">Круиз-контроль:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="cruiseControl" name="cruiseControl"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.cruiseControl}">
                                                    <option value="" selected>-</option>
                                                    <option value="есть">есть</option>
                                                    <option value="адаптивный">адаптивный</option>
                                                </c:when>
                                                <c:when test="${formAuction.cruiseControl eq 'есть'}">
                                                    <option value="">-</option>
                                                    <option value="есть" selected>есть</option>
                                                    <option value="адаптивный">адаптивный</option>
                                                </c:when>
                                                <c:when test="${formAuction.cruiseControl eq 'адаптивный'}">
                                                    <option value="">-</option>
                                                    <option value="есть">есть</option>
                                                    <option value="адаптивный" selected>адаптивный</option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Круиз-контроль--%>
                    </div>
                    <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                            <%--Бортовой компьютер--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="onBoardComputer" class="input-label col-md-4">Бортовой компьютер:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="onBoardComputer" name="onBoardComputer"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Бортовой компьютер--%>
                            <%--Сигнализация--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="climateControl" class="input-label col-md-4">Сигнализация:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="alarm" name="alarm"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.alarm}">
                                                    <option value="" selected>-</option>
                                                    <option value="с обратной связью">с обратной связью</option>
                                                    <option value="с автозапуском">с автозапуском</option>
                                                </c:when>
                                                <c:when test="${formAuction.alarm eq 'с обратной связью'}">
                                                    <option value="">-</option>
                                                    <option value="с обратной связью" selected>с обратной связью
                                                    </option>
                                                    <option value="с автозапуском">с автозапуском</option>
                                                </c:when>
                                                <c:when test="${formAuction.alarm eq 'с автозапуском'}">
                                                    <option value="">-</option>
                                                    <option value="с обратной связью">с обратной связью</option>
                                                    <option value="с автозапуском" selected>с автозапуском</option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Сигнализация--%>
                            <%--Подушки безопасности--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="airbags" class="input-label col-md-4">Подушки безопасности:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="airbags" name="airbags"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Подушки безопасности--%>
                            <%--Антиблокировочная система тормозов ABS--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="abs" class="input-label col-md-4">Антиблокировочная система тормозов
                                    ABS:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="abs" name="abs"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Антиблокировочная система тормозов ABS--%>
                            <%--Система курсовой устойчивости ESP--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="directionalStability" class="input-label col-md-4">Система курсовой
                                    устойчивости ESP:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="directionalStability" name="directionalStability"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Система курсовой устойчивости ESP--%>
                            <%--Противобуксовочная система TCS--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="antiSlip" class="input-label col-md-4">Противобуксовочная
                                    система TCS:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="antiSlip" name="antiSlip"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Противобуксовочная система TCS--%>
                            <%--Магнитола--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="carStereo" class="input-label col-md-4">Магнитола:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="carStereo" name="carStereo"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.carStereo}">
                                                    <option value="" selected>-</option>
                                                    <option value="аудиосистема">аудиосистема</option>
                                                    <option value="мультимедиа">мультимедиа</option>
                                                </c:when>
                                                <c:when test="${formAuction.carStereo eq 'аудиосистема'}">
                                                    <option value="">-</option>
                                                    <option value="аудиосистема" selected>аудиосистема</option>
                                                    <option value="мультимедиа">мультимедиа</option>
                                                </c:when>
                                                <c:when test="${formAuction.carStereo eq 'мультимедиа'}">
                                                    <option value="">-</option>
                                                    <option value="аудиосистема">аудиосистема</option>
                                                    <option value="мультимедиа" selected>мультимедиа</option>
                                                </c:when>
                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Магнитола--%>
                            <%--Аудиоколонки--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="audioSystem" class="input-label col-md-4">Аудиоколонки:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="audioSystem" name="audioSystem"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.audioSystem}">
                                                    <option value="" selected>-</option>
                                                    <option value="2">2</option>
                                                    <option value="4">4</option>
                                                    <option value="6">6</option>
                                                </c:when>
                                                <c:when test="${formAuction.audioSystem eq '2'}">
                                                    <option value="">-</option>
                                                    <option value="2" selected>2</option>
                                                    <option value="4">4</option>
                                                    <option value="6">6</option>
                                                </c:when>
                                                <c:when test="${formAuction.audioSystem eq '4'}">
                                                    <option value="">-</option>
                                                    <option value="2">2</option>
                                                    <option value="4" selected>4</option>
                                                    <option value="6">6</option>
                                                </c:when>
                                                <c:when test="${formAuction.audioSystem eq '6'}">
                                                    <option value="">-</option>
                                                    <option value="2">2</option>
                                                    <option value="4">4</option>
                                                    <option value="6" selected>6</option>
                                                </c:when>

                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Аудиоколонки--%>
                            <%--Камера заднего вида--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="backCamera" class="input-label col-md-4">Камера заднего вида:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="backCamera" name="backCamera"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Камера заднего вида--%>
                            <%--Головная оптика--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="headlights" class="input-label col-md-4">Головная оптика:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="headlights" name="headlights"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.headlights}">
                                                    <option value="" selected>-</option>
                                                    <option value="галоген">галоген</option>
                                                    <option value="ксенон">ксенон</option>
                                                    <option value="диодные">диодные</option>
                                                </c:when>
                                                <c:when test="${formAuction.headlights eq 'галоген'}">
                                                    <option value="">-</option>
                                                    <option value="галоген" selected>галоген</option>
                                                    <option value="ксенон">ксенон</option>
                                                    <option value="диодные">диодные</option>
                                                </c:when>
                                                <c:when test="${formAuction.headlights eq 'ксенон'}">
                                                    <option value="">-</option>
                                                    <option value="галоген">галоген</option>
                                                    <option value="ксенон" selected>ксенон</option>
                                                    <option value="диодные">диодные</option>
                                                </c:when>
                                                <c:when test="${formAuction.headlights eq 'диодные'}">
                                                    <option value="">-</option>
                                                    <option value="галоген">галоген</option>
                                                    <option value="ксенон">ксенон</option>
                                                    <option value="диодные" selected>диодные</option>
                                                </c:when>

                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Головная оптика--%>
                            <%--Размер колес--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="wheels" class="input-label col-md-4">Размер колес:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:select path="wheels" name="wheels"
                                                     data-live-search="true" data-container="body"
                                                     data-max-options="1" title="">
                                            <c:choose>
                                                <c:when test="${empty formAuction.wheels}">
                                                    <option value="" selected>-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R12'}">
                                                    <option value="">-</option>
                                                    <option value="R12" selected>R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R13'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13" selected>R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R14'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14" selected>R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R15'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15" selected>R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R16'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16" selected>R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R17'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17" selected>R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R18'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18" selected>R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R19'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19" selected>R19</option>
                                                    <option value="R20">R20</option>
                                                </c:when>
                                                <c:when test="${formAuction.wheels eq 'R20'}">
                                                    <option value="">-</option>
                                                    <option value="R12">R12</option>
                                                    <option value="R13">R13</option>
                                                    <option value="R14">R14</option>
                                                    <option value="R15">R15</option>
                                                    <option value="R16">R16</option>
                                                    <option value="R17">R17</option>
                                                    <option value="R18">R18</option>
                                                    <option value="R19">R19</option>
                                                    <option value="R20" selected>R20</option>
                                                </c:when>

                                            </c:choose>
                                        </form:select>
                                        <form:errors path="auction.fssp" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Размер колес--%>
                            <%--Зимние шины--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="winterTires" class="input-label col-md-4">Зимние шины:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="winterTires" name="winterTires"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Зимние шины--%>
                            <%--Сервисная книжка--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="vehicleLogBook" class="input-label col-md-4">Сервисная книжка:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="vehicleLogBook" name="vehicleLogBook"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Сервисная книжка--%>
                            <%--Заводская гарантия--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label for="warrantyOn" class="input-label col-md-4">Заводская гарантия:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="warrantyOn" name="warrantyOn"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Заводская гарантия--%>

                    </div>
                </div>

                <h2 class="text-center">Проверка по БАЗАМ</h2>
                <div class="row content-row">
                    <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                            <%--Владельцы по БАЗАМ--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label class="input-label col-md-3">Факты ДТП:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:input type="text" name="auction.numberAccidentsDB"
                                                    path="auction.numberAccidentsDB" id="numberAccidentsDB"
                                                    class="form-control" placeholder="Факты ДТП"
                                                    value="${formAuction.auction.numberAccidentsDB}"/>
                                        <form:errors path="auction.numberAccidentsDB" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Владельцы по БАЗАМ--%>
                            <%--количество аварий по БАЗАМ--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label class="input-label col-md-3">Количество владельцев:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:input type="text" name="auction.ownersDB"
                                                    path="auction.ownersDB" id="ownersDB"
                                                    class="form-control" placeholder="Количество владельцев"
                                                    value="${formAuction.auction.ownersDB}"/>
                                        <form:errors path="auction.ownersDB" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--количество аварий по БАЗАМ--%>
                            <%--В угоне ?--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label class="input-label col-md-4">Нахождение в розыске:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="auction.wantedDB"
                                                       name="auction.wantedDB"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--В угоне?--%>
                            <%--В такси ?--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label class="input-label col-md-4">Использование в такси:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="auction.taxiDB"
                                                       name="auction.taxiDB"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--В такси?--%>
                            <%--Пробег по базе ТО--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label class="input-label col-md-4">Пробег по базе ТО:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:input type="text" name="auction.mileageDB"
                                                    path="auction.mileageDB" id="mileageDB"
                                                    class="form-control" placeholder="Пробег по базе ТО"
                                                    value="${formAuction.auction.mileageDB}"/>
                                        <form:errors path="auction.mileageDB" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Пробег по базе ТО--%>
                            <%--Ограничения рег. действий--%>
                        <div class="row easylook">
                            <div class="form-group">
                                <label class="input-label col-md-4">Ограничения рег. действий:</label>
                                <div class="col-lg-4">
                                    <div class="in-group">
                                        <form:checkbox path="auction.restrictionsDB"
                                                       name="auction.restrictionsDB"
                                                       itemValue="value"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                            <%--Ограничения рег. действий--%>
                    </div>
                </div>

                <h2 class="text-center">Ролик на YouTube</h2>
                <div class="row content-row">
                    <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                        <div class="row">
                            <div class="form-group">
                                <label for="brand" class="input-label col-md-3">ID на YouTube:</label>
                                <div class="col-lg-8">
                                    <div class="in-group">
                                        <form:input type="text" name="auction.youtube" path="auction.youtube" id="youtube"
                                                    class="form-control" placeholder="ID на YouTube"
                                                    value="${formAuction.auction.youtube}"/>
                                        <form:errors path="auction.youtube" cssClass="error"/>
                                    </div>
                                    <div class="err">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <h2 class="text-center">Загрузить фото</h2>
                <div class="row content-row">
                    <input id="input-1" name="input1" type="file" class="file-loading" multiple
                           accept="image/x-png, image/jpeg"/>
                </div>
                <div class="row content-row">
                    <div class="text-center">
                        <p class="lead">Нажмите сохранить, чтобы лот был опубликован для торгов.</p>
                    </div>
                </div>
                <div class="row top-buffer">
                    <ul class="list-inline pull-right">
                        <form:input type="hidden" name='auctionid' path="auction.auctionid" class="form-control"/>
                        <li>
                            <button type="button" class="btn btn-lg btn-default prev-step">Назад</button>
                        </li>
                        <li>
                            <button name="submit" type="submit" value="submit" class="btn btn-lg btn-success">
                                Сохранить
                            </button>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"></div>
            </form:form>
        </section>
    </div>
</div>

<%@ include file="/resources/template/footer.jsp" %>

<script src=<c:url value="/resources/js/form.js"/>></script>
<script src=<c:url value="/resources/js/bootstrap-select.min.js"/>></script>
<script src=<c:url value="/resources/js/moment.min.js"/>></script>
<script src=<c:url value="/resources/js/bootstrap-datetimepicker.min.js"/>></script>
<script src=<c:url value="/resources/js/countries.js"/>></script>
<script src=<c:url value="/resources/js/fileinput.min.js"/>></script>
<script src=<c:url value="/resources/js/jquery.validate.min.js"/>></script>

<script>

    /* Validator */
    $().ready(function () {
        $('#form').validate({
            onfocusout: function (element) {
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
                },
                'auction.vin': {
                    required: true,
                    validatorVin : true
                }
            },
            // Specify validation error messages
            messages: {
                'auction.vin': "Допустимо только 17 - символов (буквы, цифры)"
        },
            highlight: function (element, errorClass) {
                $(element).closest('.form-group').addClass('has-error');
            },
            unhighlight: function (element, errorClass) {
                $(element).closest('.form-group').removeClass('has-error');
            },
            errorPlacement: function (error, element) {
                error.appendTo(element.parent().next("div.err"));
            }
        });
    });

    //проверка VIN кода
    jQuery.validator.addMethod("validatorVin", function(value, element) {
        return /^\w{17}$/.test(value);
    }, "*");

    $(function () {
        $('#datetimepicker1').datetimepicker();
        // populateCountries("country");
    });

    /* File Upload */
    $(document).on('ready', function () {
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
