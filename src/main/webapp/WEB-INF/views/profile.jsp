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

    <title>Auctioner</title>

</head>

<body>

   	 <%@ include file="/resources/template/menu-top.jsp" %>

    <!-- Page Content -->
    <div class="container">
        <link href=<c:url value="/resources/css/star-rating.min.css" /> rel="stylesheet" type="text/css">

        <div class="row">
            <div class="col-sm-12 text-center">
                <div class="container">
                    <h1 class="page-header"><strong>${usr.username}</strong></h1>
                    <div class="row">
                        <!-- left column -->
                        <div class="col-md-3 col-sm-6 col-xs-12">
                          <div class="text-center">
                            <c:if test="${not empty avatar}">
                            <div class="avatar-div">
                              <img src="data:image/jpeg;base64,${avatar}" class="avatar img-circle img-thumbnail" alt="avatar">
                            </div>
                            </c:if>
                            <c:if test="${empty avatar}">
                            <div class="avatar-div">
                              <img src="<c:url value="/resources/images/default_avatar.png"/>" class="avatar img-circle img-thumbnail" alt="avatar">
                            </div>
                            </c:if>
                            <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                                <label for="seller-rating" class="control-label"><h3>Auctioneer Rating</h3></label>
                                <input id="seller-rating" class="rating rating-loading" data-show-clear="false" data-show-caption="false" value="${usr.sellerRating}" data-min="0" data-max="5" data-step="0.5" data-size="xs">
                                <label for="bidder-rating" class="control-label"><h3>Bidder Rating</h3></label>
                                <input id="bidder-rating" class="rating rating-loading" data-show-clear="false" data-show-caption="false" value="${usr.bidderRating}" data-min="0" data-max="5" data-step="0.5" data-size="xs">
                            </sec:authorize>
                          </div>
                        </div>
                        <!-- edit form column -->
                        <div class="col-md-9 col-sm-6 col-xs-12 personal-info">
                          <h3>Personal info</h3>
                          <div class="col-md-offset-4 col-md-3">
                            <h4 class="text-left">Name</h4>
                          </div>
                          <div class="col-md-4">
                              <h4 class="text-left"><strong>${usr.firstName}</strong></h4>
                          </div>
                          <div class="col-md-offset-4 col-md-3">
                            <h4 class="text-left">Lastname</h4>
                          </div>
                          <div class="col-md-4">
                              <h4 class="text-left"><strong>${usr.lastName}</strong></h4>
                          </div>
                          <div class="col-md-offset-4 col-md-3">
                            <h4 class="text-left">Country</h4>
                          </div>
                          <div class="col-md-4">
                              <h4 class="text-left"><strong>${usr.country}</strong></h4>
                          </div>
                          <div class="col-md-offset-4 col-md-3">
                            <h4 class="text-left">City</h4>
                          </div>
                          <div class="col-md-4">
                              <h4 class="text-left"><strong>${usr.city}</strong></h4>
                          </div>
                          <div class="col-md-offset-4 col-md-3">
                            <h4 class="text-left">Email</h4>
                          </div>
                          <div class="col-md-4">
                              <h4 class="text-left"><strong>${usr.email}</strong></h4>
                          </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-11">
                            <sec:authorize ifAnyGranted="ROLE_ADMIN">
                                <a href="/Auctioner/admin-new-message/${usr.username}" class="btn btn-success pull-right">Send Message</a>
                            </sec:authorize>
                            <sec:authorize ifNotGranted="ROLE_ADMIN">
                                <a href="/Auctioner/myprofile-new-message/${usr.username}" class="btn btn-success pull-right">Send Message</a>
                            </sec:authorize>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

    <%@ include file="/resources/template/footer.jsp" %>
    <script src=<c:url value="/resources/js/star-rating.min.js" />></script>

    <script>

    $('#seller-rating').on('rating.change', function(event, value, caption) {
        console.log(value);
        sellerRatingPost(value);
    });

    $('#bidder-rating').on('rating.change', function(event, value, caption) {
        console.log(value);
        bidderRatingPost(value);
    });

    userId = "${usr.userid}";

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
    </script>

</body>

</html>
