<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <meta http-equiv="refresh" content="120">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
        div#map_container {
            width: 690px;
            height: 400px;
        }
    </style>

    <title>Perekup64</title>

</head>

<body>

<%@ include file="/resources/template/menu-top.jsp" %>

<div class="container single-item-content">

    <link href=
          <c:url value="/resources/css/auction.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/css/cars_elements.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/css/star-rating.min.css"/> rel="stylesheet" type="text/css">
    <link href=
          <c:url value="/resources/css/accordion.css"/> rel="stylesheet" type="text/css">

    <sec:authorize ifAnyGranted="ROLE_ADMIN">
    <div class="col-md-offset-10 col-md-2">
        <a href="/update-auction/${auction.auctionid}" class="btn btn-warning">Изменить лот</a>
    </div>
    </sec:authorize>

    <div class="row">
        <div class="col-xs-12 single-content-left">
            <div id="main_area">
                <!-- Slider -->
                <div class="row">
                    <div class="col-xs-12" id="slider">
                        <!-- Top part of the slider -->
                        <div class="row">
                            <div class="col-sm-12" id="carousel-bounding-box">
                                <div class="carousel slide" id="myCarousel">
                                    <!-- Carousel items -->
                                    <div class="carousel-inner">
                                        <c:if test="${not empty images}">
                                            <c:forEach items="${images}" var="image" varStatus="loop">
                                                <c:if test="${loop.count == 1}">
                                                    <div class="active item single-item-img" data-slide-number="0">
                                                        <img src="data:image/jpeg;base64,${image}"></div>
                                                </c:if>
                                                <c:if test="${loop.count != 1}">
                                                    <div class="item single-item-img" data-slide-number="${loop.index}">
                                                        <img src="data:image/jpeg;base64,${image}"></div>
                                                </c:if>
                                            </c:forEach>
                                        </c:if>
                                        <c:if test="${empty images}">
                                            <div class="active item single-item-img" data-slide-number="0">
                                                <img src="<c:url value="/resources/images/hammer1.png"/>"/></div>
                                        </c:if>
                                    </div><!-- Carousel nav -->
                                    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                                        <span class="glyphicon glyphicon-chevron-left"></span>
                                    </a>
                                    <a class="right carousel-control" href="#myCarousel" role="button"
                                       data-slide="next">
                                        <span class="glyphicon glyphicon-chevron-right"></span>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div><!--/Slider-->

                <div class="row hidden-xs" id="slider-thumbs">
                    <!-- Bottom switcher of slider -->
                    <ul class="hide-bullets">
                        <c:if test="${not empty images}">
                            <c:forEach items="${images}" var="image" varStatus="loop">
                                <li class="col-sm-3">
                                        <%-- <div class="small-img-div"> --%>
                                    <a class="thumbnail" id="carousel-selector-${loop.index}"><img
                                            src="data:image/jpeg;base64,${image}"></a>
                                        <%-- </div> --%>
                                </li>
                            </c:forEach>
                        </c:if>
                        <c:if test="${empty images}">
                            <li class="col-sm-3">
                                <a class="thumbnail" id="carousel-selector-${loop.index}"><img
                                        src="<c:url value="/resources/images/hammer1.png"/>"/></a>
                            </li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-xs-12 single-content-right">
                <div class="col-md-12">
                    <h2 class="text-uppercase title">${auction.name}</h2>
                    <div id="soldto-div" class="hidden">
                        <div class="alert alert-success">
                            <span id="soldto"></span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Стартовая цена</h4>
                        </div>
                        <div class="panel-body">
                            <div class="price-number text-center">${auction.firstBid} 000 Руб</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Дата начала</h4>
                        </div>
                        <div class="panel-body">
                            <span class="date-number text-center">${auction.started}</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Дата окончания</h4>
                        </div>
                        <div class="panel-body">
                            <span class="date-number text-center">${auction.ends}</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="clock-div panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Закончится через</h4>
                        </div>
                        <div class="panel-body" style="text-align: center;">
                            <div class="lead clock" id="clock" class="clock"></div>
                        </div>
                    </div>
                </div>
                <div id="bid-pricing" class="col-md-6 <c:if test='${empty user}'>hidden</c:if>">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Текущая цена</h4>
                        </div>
                        <div class="panel-body">
                            <div class="price-number text-center"><span
                                    id="currentPrice">${auction.firstBid} 000 Руб</span>
                            </div>
                        </div>
                        <div class="panel-footer">
                            <c:if test="${user.approved == 1}">
                                <c:if test="${user.userid != auction.user.userid}">
                                    <b>
                                        <c:choose>
                                            <c:when test="${empty auction.buyer}">
                                                <button type="button" class="btn btn-primary btn-block" id="nextBid"
                                                        style="font-weight : bold">
                                                    ПРИНЯТЬ НАЧАЛЬНУЮ СТАВКУ ${auction.currently} Руб
                                                </button>
                                            </c:when>
                                            <c:otherwise>
                                                <button type="button" class="btn btn-primary btn-block" id="nextBid"
                                                        disabled="true" style="font-weight : bold">
                                                    СДЕЛАТЬ СТАВКУ ${auction.currently + 1} Руб
                                                </button>
                                            </c:otherwise>
                                        </c:choose>
                                    </b>
                                </c:if>
                            </c:if>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <c:if test="${auction.buyPrice != null}">
                    <div id="buy-pricing" class="col-md-6 <c:if test='${empty user}'>hidden</c:if>">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">Купить без торга можно за</h4>
                            </div>
                            <div class="panel-body">
                                <div class="price-number text-center">${auction.buyPrice} 000 Руб</div>
                            </div>
                            <div class="panel-footer">
                                <c:if test="${user.approved == 1}">
                                    <c:if test="${user.userid != auction.user.userid}">
                                        <button class="btn btn-primary btn-block" data-toggle="modal"
                                                data-target="#buyModal"><b>КУПИТЬ БЕЗ ТОРГА</b></button>
                                    </c:if>
                                </c:if>
                                <div class="clearfix"></div>
                            </div>
                                <%--<div class="panel-footer">--%>
                                <%--<c:if test="${user.approved == 1}">--%>
                                <%--<c:if test="${user.userid != auction.user.userid}">--%>
                                <%--<button class="btn btn-primary btn-block" data-toggle="modal" data-target="#buyModal"><i><span class="icon-travel-car"></i></span>Купить</button>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${user.userid == auction.user.userid}">--%>
                                <%--<button class="btn btn-primary btn-block" data-toggle="tooltip" data-placement="top" title="You cannot bid your own Auction." disabled="disabled">Купить сейчас!</button>--%>
                                <%--</c:if>--%>
                                <%--</c:if>--%>
                                <%--<c:if test="${user.approved == 0}">--%>
                                <%--<button class="btn btn-primary btn-block" data-toggle="tooltip" data-placement="top" title="You need an approved account for this action." disabled="disabled">Купить сейчас!</button>--%>
                                <%--</c:if>--%>
                                <%--<div class="clearfix"></div>--%>
                                <%--</div>--%>
                        </div>
                    </div>
                </c:if>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Последние ставки</h4>
                        </div>
                        <div class="panel-body">
                            <ul id="liveFeed" class="list-group"></ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bid Modal -->
    <div class="modal fade" id="bidModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Подтверждение</h4>
                </div>
                <div class="modal-body" style="line-height: 1">
                    <p>Вы уверены, что хотите повысить ставку?</p>
                    <p>Ваша ставка лидирует!</p>
                </div>
                <div class="modal-footer">
                    <button id="bidButton" type="button" class="btn btn-primary" data-dismiss="modal">Продолжить
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </div>
            </div>

        </div>
    </div>
    <!-- Buy Modal -->
    <div class="modal fade" id="buyModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Подтверждение</h4>
                </div>
                <div class="modal-body" style="line-height: 1">
                    <p>Вы уверены, что хотите продолжить?</p>
                    <p>Это действие нельзя будет отменить!</p>
                </div>
                <div class="modal-footer">
                    <button id="buy-button" type="button" class="btn btn-primary" data-dismiss="modal">Продолжить
                    </button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
                </div>
            </div>

        </div>
    </div>
    <div class="row">
        <div class="col-sm-12">
            <button class="accordion">ПОДРОБНЕЕ</button>
            <div class="panel_accordion" style="font-size: 10pt; line-height: 1">
                <p>
                    Марка: <b>${auction.brand}</b>
                </p>
                <p>
                    Модель: <b>${auction.model}</b>
                </p>
                <p>
                    Год выпуска: <b>${auction.released}</b>
                </p>
                <p>
                    Пробег: <b>${auction.run}</b>
                </p>
                <p>
                    Двигатель: <b>${auction.engineType}</b>
                </p>
                <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                    <p>
                        Состояние двигателя: <b>${auction.engineState}</b>
                    </p>
                    <p>
                        Коробка: <b>${auction.transmission}</b>
                    </p>
                    <p>
                        Кузов: <b>${auction.body}</b>
                    </p>
                    <p>
                        Состояние кузова: <b>${auction.bodyState}</b>
                    </p>
                    <p>
                        Привод: <b>${auction.drive}</b>
                    </p>
                    <p>
                        Мощность: <b>${auction.power}</b>
                    </p>
                    <p>
                        Цвет: <b>${auction.color}</b>
                    </p>
                    <p>
                        Дверей: <b>${auction.doors}</b>
                    </p>
                    <p>
                        Владельцев по птс: <b>${auction.owners}</b>
                    </p>
                    <p>
                        VIN: <b>${auction.vin}</b>
                    </p>
                    <p>
                        База ГИБДД РФ: <b>${auction.gibdd}</b>
                    </p>
                    <p>
                        База судебных приставов: <b>${auction.fssp}</b>
                    </p>
                    <p>
                        Cостояние ходовой: <b>${auction.driveState}</b>
                    </p>
                </sec:authorize>
                <sec:authorize ifAnyGranted="ROLE_ANONYMOUS">
                    <p>
                        <b style="color: red">Остальная информация доступна только зарегистрированным
                            пользователям!</b>
                    </p>
                </sec:authorize>
            </div>

            <button class="accordion">ДОПОЛНИТЕЛЬНАЯ ИНФОРМАЦИЯ</button>
            <div class="panel_accordion">
                <div>
                    <div class="container">
                        <div class="img_inner_container">
                            <img class="trafaret"
                                 src="<c:url value="/resources/images/cars_elements/background.png"/>"/>
                            <c:forEach var="code" items="${auction.listOfDamagedElements}" varStatus="loop">
                                <img class="zakraska"
                                     src="<c:url value="/resources/images/cars_elements/${code}.png"/>"/>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
            <button class="accordion">ПРОВЕРКА ПО БАЗАМ</button>
            <div class="panel_accordion">
                <p>
                    В процессе реализации
                </p>
            </div>
            <button class="accordion">КОНТАКТНЫЕ ДАННЫЕ</button>
            <div class="panel_accordion">
                <p><b>Отдел продаж</b></p>
                <div class="col-sm-6">
                    <p class="lead">
                        <%--${auction.user.firstName} <br />--%>
                        <%--${auction.user.lastName} <br />--%>
                        менеджер <br/>
                        <span class="icon-phone"></span> ${auction.user.phone} <br/><br/>
                        ${auction.user.city}
                    </p>
                </div>
                <div class="col-sm-6">
                    <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                    </sec:authorize>
                </div>
            </div>
        </div>
    </div>

    <%@ include file="/resources/template/footer.jsp" %>

    <script src=<c:url value="/resources/js/auction.js"/>></script>
    <script src=<c:url value="/resources/js/jquery.countdown.min.js"/>></script>
    <script src=<c:url value="/resources/js/auction-carousels.js"/>></script>
    <script src=<c:url value="/resources/js/date.format.js"/>></script>
    <script src=<c:url value="/resources/js/bootstrap-confirmation.js"/>></script>
    <script src=<c:url value="/resources/js/star-rating.min.js"/>></script>

    <script>

        auctionId = "${auction.auctionid}";

        ends = "${ends}";

        /* Asychronous check of Bids */
        numberofBids = 0;

        myBidIsLast = false;

        stopFlag = 0;

        function pollforBids() {

            if (stopFlag == 1)   // Recursive returns
                return;

            var url = "/checkBids/" + auctionId

            if (request) {
                request.abort();  // abort any pending request
            }

            console.log("Polling for bids");

            var request = $.ajax({
                url: url,
                type: "GET",
                data: {numofBids: numberofBids},
                timeout: 45000,
                success: function (data) {
                    myBidIsLast = data.info.lastBidIsMy;
                    console.log("myBidIsLast: " + myBidIsLast);
                    console.log("No new bids: " + data.info.buyer);
                    if (data.info.bought) {
                        if (data.info.buyer == null)
                            updateOver();
                        else
                            updateBought(data);
                    }
                    else {
                        myBidIsLast = data.info.lastBidIsMy;
                        console.log("myBidIsLast: " + myBidIsLast);
                        console.log('New bids: ' + (data.info.numofBids - numberofBids));
                        console.log(data.bids);
                        numberofBids = data.info.numofBids;
                        console.log(data.info.buyer);
                        if (data.info.bought)
                            updateBought(data);
                    }
                    updatePriceAndLiveFeed(data);
                    pollforBids();  // Recursion
                },
                error: function (data) {
                    console.log("pollforBids: ERROR: " + data.responseText);
                    stopFlag = 1;
                }
            });
        }


        function pollforBidsSingle() {

            console.log("myBisIsLast: " + myBidIsLast);

            if (stopFlag == 1)   // Recursive returns
                return;

            var url = "/checkBids/" + auctionId

            if (request) {
                request.abort();  // abort any pending request
            }

            console.log("Polling for bids");

            var request = $.ajax({
                url: url,
                type: "GET",
                data: {numofBids: numberofBids},
                timeout: 45000,
                success: function (data) {
                    myBidIsLast = data.info.lastBidIsMy;
                    console.log("myBidIsLast: " + myBidIsLast);
                    console.log("No new bids: " + data.info.buyer);
                    if (data.info.bought) {
                        if (data.info.buyer == null)
                            updateOver();
                        else
                            updateBought(data);
                    }
                    else {
                        myBidIsLast = data.info.lastBidIsMy;
                        console.log('New bids: ' + (data.info.numofBids - numberofBids));
                        console.log(data.bids);
                        numberofBids = data.info.numofBids;
                        console.log(data.info.buyer);
                        if (data.info.bought)
                            updateBought(data);
                    }
                    updatePriceAndLiveFeed(data);
                },
                error: function (data) {
                    console.log("pollforBids: ERROR: " + data.responseText);
                    stopFlag = 1;
                }
            });
        }

        function updatePriceAndLiveFeed(data) {
            var latestBid = data.info.latestBid;
            if (latestBid > 2) {
                $('#currentPrice').text(data.info.latestBid + " 000 Руб");
            }
            var bid = data.info.latestBid + 1;
            if (bid > 2) {
                $('#nextBid').text("СДЕЛАТЬ СТАВКУ " + bid + " 000 Руб");
                $('#nextBid').removeAttr("disabled");
            }
            var bids = data.bids;
            var bid;
            var i;
            if (bids.length > 0) {
                $('#liveFeed').empty();
            }
            for (i = bids.length - 1; i >= 00; i--) {
                bid = bids[i];
                console.log('Name: ' + bid.username);
                var time = new Date(bid.time);
                var formattedTime = time.format("isoTime");

                $('#liveFeed').prepend('<li class="list-group-item">' + formattedTime + ' ' + bid.username + ' перебил ставкой ' + bid.amount + '000 Руб</li>');
            }
        }

        function updateBought(data) {
            $('.clock-div').addClass('hidden');
            $('#soldto').text("Аукцион выигран участником " + data.info.buyer + " с конечной ценой " + data.info.latestBid + " 000 Руб");
            $('#soldto-div').removeClass('hidden');
            $('#bid-pricing').addClass('hidden');
            $('#buy-pricing').addClass('hidden');

            stopFlag = 1;
        }

        function updateOver() {
            $('.clock-div').addClass('hidden');
            $('#soldto').text("The Auction has ended without any buyers.");
            $('#soldto-div').removeClass('hidden');
            $('#bid-pricing').addClass('hidden');
            $('#buy-pricing').addClass('hidden');

            stopFlag = 1;
        }

        window.addEventListener('load',
            function () {
                pollforBids();
            }, false);

        /* Function to ajax post the bid */
        function bidPost() {
            var bidUrl = "/auction/bid/" + auctionId;

            // var amount = $('#bidInput').val();
            var amount = 1; //hardcode!!!
            console.log("Amount: " + amount);

            $.ajax({
                url: bidUrl,
                type: "POST",
                data: {bidAmount: amount},
                success: function (data) {
                    console.log("bidPost: " + data);
                },
                error: function (data) {
                    console.log("ERROR: " + data.responseText);
                }
            });
            pollforBidsSingle();
        }

        <c:if test="${auction.buyPrice != null}">
        /* Function to ajax post the purchase */
        function buyPost() {

            var bidUrl = "/auction/bid/" + auctionId;

            var amount = ${auction.buyPrice};
            console.log("Amount: " + amount);

            $.ajax({
                url: bidUrl,
                type: "POST",
                data: {bidAmount: amount},
                success: function (data) {
                    console.log("bidPost: " + data);
                },
                error: function (data) {
                    console.log("ERROR: " + data.responseText);
                }
            });
        }

        </c:if>

        /* Google Maps */
        <c:if test="${not empty auction.location.latitude}">
        var lat = ${auction.location.latitude},
            long = ${auction.location.longitude};

        function loadMap() {

            if (lat.length == 0) // If latitude is not given no google maps
                return;


            var latlng = new google.maps.LatLng(lat, long);
            var myOptions = {
                zoom: 4,
                center: latlng,
                mapTypeId: google.maps.MapTypeId.ROADMAP
            };
            var map = new google.maps.Map(document.getElementById("map_container"), myOptions);

            var marker = new google.maps.Marker({
                position: latlng,
                map: map,
                title: "Auction Location"
            });
        }

        </c:if>

        /* Confirmation */

        /* On button click call bidPost() */
        $('#nextBid').on('click', function () {
            if (myBidIsLast) {
                $('#bidModal').modal();
            } else {
                $('#nextBid').attr("disabled", true);
                $('#nextBid').text("ОБРАБОТКА ЗАПРОСА");
                console.log("nextBid clicked")
                bidPost();
                console.log(numberofBids + "numberofBids")
            }
            pollforBids();
        });

        $('#bidButton').on('click', function () {
            $('#nextBid').attr("disabled", true);
            $('#nextBid').text("ОБРАБОТКА ЗАПРОСА");
            console.log("bidButton clicked")
            bidPost();
            console.log(numberofBids + "numberofBids")
            pollforBids();
        });

        /* Buy Auction */
        $('#buy-button').on('click', function () {
            console.log("buy-button clicked")
            buyPost();
        });

        /* Rating */
        <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
        $('#seller-rating').on('rating.change', function (event, value, caption) {
            console.log(value);
            sellerRatingPost(value);
        });

        $('#bidder-rating').on('rating.change', function (event, value, caption) {
            console.log(value);
            bidderRatingPost(value);
        });

        userId = "${auction.user.userid}";

        /* Function to ajax post the Seller Rating */
        function sellerRatingPost(value) {

            var url = "/rate/seller/" + userId;

            $.ajax({
                url: url,
                type: "POST",
                data: {rating: value},
                success: function (data) {
                    console.log("ratingPost: " + data);
                },
                error: function (data) {
                    console.log("ERROR: " + data.responseText);
                }
            });
        }

        /* Function to ajax post the Bidder Rating */
        function bidderRatingPost(value) {

            var url = "/rate/bidder/" + userId;

            $.ajax({
                url: url,
                type: "POST",
                data: {rating: value},
                success: function (data) {
                    console.log("ratingPost: " + data);
                },
                error: function (data) {
                    console.log("ERROR: " + data.responseText);
                }
            });
        }

        </sec:authorize>

    </script>
    <script>
        var acc = document.getElementsByClassName("accordion");
        var i;

        for (i = 0; i < acc.length; i++) {
            acc[i].addEventListener("click", function () {
                this.classList.toggle("active");
                var panel = this.nextElementSibling;
                if (panel.style.maxHeight) {
                    panel.style.maxHeight = null;
                } else {
                    panel.style.maxHeight = panel.scrollHeight + "px";
                }
            });
        }
    </script>

    <c:if test="${not empty auction.location.latitude}">
    <script type="text/javascript"
            src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDluUfh1eXZmSKvXQJ1Ctd9nYucJgPIcVo&callback=loadMap"
            async defer></script>
    </c:if>
    <script src=<c:url value="/resources/js/auction.js"/>></script>

</body>

</html>
