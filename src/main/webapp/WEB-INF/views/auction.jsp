<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <style>
    div#map_container{
    	width:690px;
    	height:400px;
    }
    </style>

    <title>Auctioner</title>

</head>

<body>

   	 <%@ include file="/resources/template/menu-top.jsp" %>

    <div class="container single-item-content">

        <link href=<c:url value="/resources/css/auction.css" /> rel="stylesheet" type="text/css">
        <link href=<c:url value="/resources/css/star-rating.min.css" /> rel="stylesheet" type="text/css">

        <c:if test="${modify == 1}">
            <div class="col-md-offset-10 col-md-2">
                <a href="/Auctioner/update-auction/${auction.auctionid}" class="btn btn-warning">Modify Auction</a>
            </div>
        </c:if>

        <div class="row">
            <div class="col-xs-5 single-content-left">
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
                                            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
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
                                                    <a class="thumbnail" id="carousel-selector-${loop.index}"><img src="data:image/jpeg;base64,${image}"></a>
                                                <%-- </div> --%>
                                            </li>
                                        </c:forEach>
                                    </c:if>
                                    <c:if test="${empty images}">
                                        <li class="col-sm-3">
                                            <a class="thumbnail" id="carousel-selector-${loop.index}"><img src="<c:url value="/resources/images/hammer1.png"/>"/></a>
                                        </li>
                                    </c:if>
                                </ul>
                        </div>
                    </div>
            </div>
            <div class="col-xs-7 single-content-right" >
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
                            <h4 class="panel-title">Starting Price</h4>
                        </div>
                        <div class="panel-body">
                            <div class="price-number text-center">$${auction.firstBid}</div>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Starting Date</h4>
                        </div>
                        <div class="panel-body">
                            <span class="date-number text-center">${auction.started}</span>
                        </div>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Ending Date</h4>
                        </div>
                        <div class="panel-body">
                            <span class="date-number text-center">${auction.ends}</span>
                        </div>
                    </div>
                </div>
                <div class="col-md-12">
                    <div class="clock-div panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Auction Ends In</h4>
                        </div>
                        <div class="panel-body" style="text-align: center;">
                            <div class="lead clock" id="clock" class="clock"></div>
                        </div>
                    </div>
                </div>
                <div id="bid-pricing" class="col-md-6 <c:if test='${empty user}'>hidden</c:if>">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Current Price</h4>
                        </div>
                        <div class="panel-body">
                            <div class="price-number text-center"><span id="currentPrice">$${auction.firstBid}</span></div>
                        </div>
                        <div class="panel-footer">
                            <div class="col-md-9" style="padding-left: 0px;">
                                <div class="form-group" style="margin-bottom: 0px;">
                                    <div class="input-group">
                                        <span class="input-group-addon">$</span>
                                        <input type="text" class="form-control" id="bidInput" placeholder="Place Bid">
                                        <span class="input-group-addon">.00</span>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3 bid-button" style="padding-right: 0px;">
                                <c:if test="${user.approved == 1}">
                                    <c:if test="${user.userid == auction.user.userid}">
                                        <button class="btn btn-success btn-block" data-toggle="tooltip" data-placement="top" title="You cannot bid your own Auction" disabled="disabled">Bid</button>
                                    </c:if>
                                    <c:if test="${user.userid != auction.user.userid}">
                                        <button type="button" class="btn btn-success btn-block" data-toggle="modal" data-target="#bidModal">Bid</button>
                                    </c:if>
                                </c:if>
                                <c:if test="${user.approved == 0}">
                                    <button class="btn btn-success btn-block" data-toggle="tooltip" data-placement="top" title="You need an approved account for this action." disabled="disabled">Bid</button>
                                </c:if>
                            </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>
                <c:if test="${auction.buyPrice != null}">
                    <div id="buy-pricing" class="col-md-6 <c:if test='${empty user}'>hidden</c:if>">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <h4 class="panel-title">Buy Price</h4>
                            </div>
                            <div class="panel-body">
                                <div class="price-number text-center">$${auction.buyPrice}</div>
                            </div>
                            <div class="panel-footer">
                                <c:if test="${user.approved == 1}">
                                    <c:if test="${user.userid != auction.user.userid}">
                                        <button class="btn btn-primary btn-block" data-toggle="modal" data-target="#buyModal"><i><span class="icon-hammer2"></i></span>Buy Now!</button>
                                    </c:if>
                                    <c:if test="${user.userid == auction.user.userid}">
                                        <button class="btn btn-primary btn-block" data-toggle="tooltip" data-placement="top" title="You cannot bid your own Auction." disabled="disabled"><i><span class="icon-hammer2"></i></span>Buy Now!</button>
                                    </c:if>
                                </c:if>
                                <c:if test="${user.approved == 0}">
                                    <button class="btn btn-primary btn-block" data-toggle="tooltip" data-placement="top" title="You need an approved account for this action." disabled="disabled"><i><span class="icon-hammer2"></i></span>Buy Now!</button>
                                </c:if>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </div>
                </c:if>
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <h4 class="panel-title">Bids</h4>
                        </div>
                        <div class="panel-body">
                            <ul id="liveFeed" class="list-group"></ul>
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
                  <h4 class="modal-title">Confirmation</h4>
                </div>
                <div class="modal-body">
                  <p>Are you sure you want to continue? This action cannot be cancelled later.</p>
                </div>
                <div class="modal-footer">
                  <button id="bidButton" type="button" class="btn btn-primary" data-dismiss="modal">Bid</button>
                  <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
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
                    <h4 class="modal-title">Confirmation</h4>
                  </div>
                  <div class="modal-body">
                    <p>Are you sure you want to continue? This action cannot be cancelled later.</p>
                  </div>
                  <div class="modal-footer">
                    <button id="buy-button" type="button" class="btn btn-primary" data-dismiss="modal">Bid</button>
                    <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
                  </div>
                </div>

              </div>
            </div>

        <div class="row">
            <div class="col-sm-12">
                <ul class="nav nav-tabs">
                    <li class="active"><a href="#detailsTab" data-toggle="tab">DETAILS</a></li>
                    <li><a href="#locationTab" data-toggle="tab">LOCATION</a></li>
                    <li><a href="#auctioneerTab" data-toggle="tab">AUCTIONEER INFO</a></li>
                </ul>

                <div class="tab-content">
                    <div class="well tab-pane active" id="detailsTab">
                        <h3>Description</h3>
                        <p>
                            ${auction.description}
                        </p>
                    </div>
                    <div class="well tab-pane" id="locationTab">
                        <div class="container">
                            <div class="col-sm-4">
                                <p class="lead">
                                    <br />
                                    ${auction.country} <br />
                                    ${auction.location.name}
                                </p>
                            </div>
                            <div class="col-sm-8" id="map_container">
                            </div>
                        </div>
                    </div>
                    <div class="well tab-pane" id="auctioneerTab">

                        <div class="container">
                            <h2>${auction.user.username}</h2>
                            <div class="col-sm-6">
                                <p class="lead">
                                    ${auction.user.firstName} <br />
                                    ${auction.user.lastName} <br />
                                    <span class="icon-phone"></span> ${auction.user.phone} <br /><br />
                                    ${auction.user.country} <br />
                                    ${auction.user.city}
                                </p>
                            </div>
                            <div class="col-sm-6">
                                <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                                    <label for="seller-rating" class="control-label"><h3>Auctioneer Rating</h3></label>
                                    <input id="seller-rating" class="rating rating-loading" data-show-clear="false" data-show-caption="false" value="${auction.user.sellerRating}" data-min="0" data-max="5" data-step="0.5" data-size="xs">
                                    <label for="bidder-rating" class="control-label"><h3>Bidder Rating</h3></label>
                                    <input id="bidder-rating" class="rating rating-loading" data-show-clear="false" data-show-caption="false" value="${auction.user.bidderRating}" data-min="0" data-max="5" data-step="0.5" data-size="xs">
                                </sec:authorize>
                            </div>
                            <div class="col-sm-11">
                                <a href="/Auctioner/profile/${auction.user.userid}" class="btn btn-primary pull-right">View Profile</a>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <%-- Suggestions and New Auctions --%>
        <div class="row">
            <hr style="width: 100%; color: black; height: 1px; background-color:black;" />
            <div class="container">
                <div class="row">
                    <div class="row">
                        <div class="col-md-9">
                            <h3>Suggestions</h3>
                        </div>
                        <div class="col-md-3">
                            <!-- Controls -->
                            <div class="controls pull-right hidden-xs">
                                <a class="left btn btn-primary" href="#carousel-example" data-slide="prev"><span class="glyphicon glyphicon-chevron-left"></span></a>
                                <a class="right btn btn-primary" href="#carousel-example" data-slide="next"><span class="glyphicon glyphicon-chevron-right"></span></a>
                            </div>
                        </div>
                    </div>
                    <div id="carousel-example" class="carousel slide hidden-xs" data-ride="carousel">
                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <c:forEach var="rec" items="${recs}" varStatus="loop">
                                <c:if test="${loop.count == 1}">
                                    <div class="item active">
                                        <div class="row">
                                </c:if>
                                <div class="col-sm-3">
                                    <div class="col-item">
                                        <div class="photo">
                                            <c:if test="${not empty rec.primaryImage}">
                                                <a href="/Auctioner/auction/${rec.auctionid}"><img src="data:image/jpeg;base64,${rec.primaryImage}" alt="auction-image" /></a>
                                            </c:if>
                                            <c:if test="${empty rec.primaryImage}">
                                                <a href="/Auctioner/auction/${rec.auctionid}"><img src="<c:url value="/resources/images/hammer1.png"/>" alt="hammer-image" /></a>
                                            </c:if>
                                        </div>
                                        <div class="info">
                                            <div class="row">
                                                <div class="price col-md-12">
                                                    <div class="text-limit">
                                                        <h4>${rec.name}</h4>
                                                    </div>
                                                </div>
                                                <div class="col-xs-12 col-md-6">
                                                    <p class="lead">$${rec.firstBid}</p>
                                                </div>
                                                <div class="col-xs-12 col-md-6">
                                                    <a class="btn btn-primary" href="/Auctioner/auction/${auction.auctionid}">View More</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <c:if test="${loop.count % 4 == 0 && loop.count != 1}">
                                        </div>
                                    </div>
                                    <c:if test="${loop.count != 16}">
                                    <div class="item">
                                        <div class="row">
                                    </c:if>
                                </c:if>

                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>

    <%@ include file="/resources/template/footer.jsp" %>

    <script src=<c:url value="/resources/js/auction.js" />></script>
    <script src=<c:url value="/resources/js/jquery.countdown.min.js" />></script>
    <script src=<c:url value="/resources/js/auction-carousels.js" />></script>
    <script src=<c:url value="/resources/js/date.format.js" />></script>
    <script src=<c:url value="/resources/js/bootstrap-confirmation.js" />></script>
    <script src=<c:url value="/resources/js/star-rating.min.js" />></script>

    <script>

    auctionId = "${auction.auctionid}";

    ends = "${ends}";

    /* Asychronous check of Bids */
    numberofBids = 0;

    stopFlag = 0;

    function pollforBids(){

        if(stopFlag == 1)   // Recursive returns
            return;

        var url = "/Auctioner/checkBids/" + auctionId

        if (request) {
            request.abort();  // abort any pending request
        }

        console.log("Polling for bids");

        var request = $.ajax({
            url: url,
            type: "GET",
            data: {numofBids : numberofBids},
            timeout:45000,
            success: function( data ) {

                if (data.info.numofBids == numberofBids) {
                    console.log("No new bids: " + data.info.buyer);
                    if(data.info.bought){
                        if(data.info.buyer == null)
                            updateOver();
                        else
                            updateBought(data);
                    }
                }
                else {
                    console.log('New bids: ' + (data.info.numofBids - numberofBids));
                    console.log(data.bids);
                    numberofBids = data.info.numofBids;
                    updatePriceAndLiveFeed(data);
                    console.log(data.info.buyer);
                    if(data.info.bought)
                        updateBought(data);
                }
                pollforBids();  // Recursion
            },
            error: function(data){
                console.log("pollforBids: ERROR: " + data.responseText);
                stopFlag = 1;
            }
        });
    }

    function updatePriceAndLiveFeed(data) {
        $('#currentPrice').text("$"+ data.info.latestBid);

        var bids = data.bids;
        var bid;
        var i;
        for(i = bids.length-1; i >= 00 ; i--) {
            bid = bids[i];
            console.log('Name: ' + bid.username);
            var time = new Date(bid.time);
            var formattedTime = time.format("isoTime");

            $('#liveFeed').prepend('<li class="list-group-item">'+ formattedTime + ' ' + bid.username + ' bidded $'+ bid.amount + '</li>');
        }
    }

    function updateBought(data) {
        $('.clock-div').addClass('hidden');
        $('#soldto').text("Auction was sold to " + data.info.buyer + " for $" + data.info.latestBid);
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
      function() {
        pollforBids();
    }, false);

    /* Function to ajax post the bid */
    function bidPost() {

        var bidUrl = "/Auctioner/auction/bid/" + auctionId;

        var amount = $('#bidInput').val();
        console.log("Amount: " + amount);

        $.ajax({
            url: bidUrl,
            type: "POST",
            data: {bidAmount : amount},
            success: function( data ) {
                console.log("bidPost: " + data);
            },
            error: function(data){
                console.log("ERROR: " + data.responseText);
            }
        });
    }

    <c:if test="${auction.buyPrice != null}">
    /* Function to ajax post the purchase */
    function buyPost() {

        var bidUrl = "/Auctioner/auction/bid/" + auctionId;

        var amount = ${auction.buyPrice};
        console.log("Amount: " + amount);

        $.ajax({
            url: bidUrl,
            type: "POST",
            data: {bidAmount : amount},
            success: function( data ) {
                console.log("bidPost: " + data);
            },
            error: function(data){
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

        if(lat.length == 0) // If latitude is not given no google maps
            return;


        var latlng = new google.maps.LatLng(lat, long);
        var myOptions = {
          zoom: 4,
          center: latlng,
          mapTypeId: google.maps.MapTypeId.ROADMAP
        };
        var map = new google.maps.Map(document.getElementById("map_container"),myOptions);

        var marker = new google.maps.Marker({
          position: latlng,
          map: map,
          title: "Auction Location"
        });
    }
    </c:if>

    /* Confirmation */

    /* On button click call bidPost() */
    $('#bidButton').on('click', function(){
        console.log("bidButton clicked")
        bidPost();
    });

    /* Buy Auction */
    $('#buy-button').on('click', function() {
        console.log("buy-button clicked")
        buyPost();
    });

    /* Rating */
    <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
    $('#seller-rating').on('rating.change', function(event, value, caption) {
        console.log(value);
        sellerRatingPost(value);
    });

    $('#bidder-rating').on('rating.change', function(event, value, caption) {
        console.log(value);
        bidderRatingPost(value);
    });

    userId = "${auction.user.userid}";

    /* Function to ajax post the Seller Rating */
    function sellerRatingPost(value) {

        var url = "/Auctioner/rate/seller/" + userId;

        $.ajax({
            url: url,
            type: "POST",
            data: {rating : value},
            success: function( data ) {
                console.log("ratingPost: " + data);
            },
            error: function(data){
                console.log("ERROR: " + data.responseText);
            }
        });
    }

    /* Function to ajax post the Bidder Rating */
    function bidderRatingPost(value) {

        var url = "/Auctioner/rate/bidder/" + userId;

        $.ajax({
            url: url,
            type: "POST",
            data: {rating : value},
            success: function( data ) {
                console.log("ratingPost: " + data);
            },
            error: function(data){
                console.log("ERROR: " + data.responseText);
            }
        });
    }
    </sec:authorize>

    </script>

    <c:if test="${not empty auction.location.latitude}">
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?libraries=places&key=AIzaSyDluUfh1eXZmSKvXQJ1Ctd9nYucJgPIcVo&callback=loadMap" async defer></script>
    </c:if>
    <script src=<c:url value="/resources/js/auction.js" />></script>

</body>

</html>
