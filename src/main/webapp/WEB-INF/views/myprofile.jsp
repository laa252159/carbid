<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>
<html lang="en">

<head>

	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link href=<c:url value="/resources/css/dataTables.bootstrap.min.css" /> rel="stylesheet" type="text/css">
    <link href=<c:url value="/resources/css/auction-list.css" /> rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Auctioner</title>

    <style>

    .table tbody {
        cursor: pointer;
    }

    </style>

</head>

<body >

   	<%@ include file="/resources/template/menu-top.jsp" %>

    <div class="container">
        <link href=<c:url value="/resources/css/sidenav.css" /> rel="stylesheet" type="text/css">
	  <div class="row content">

          <!-- Mobile navbar -->
          <nav class="navbar navbar-default sidebar" role="navigation">
              <div class="container-fluid">
              <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-sidebar-navbar-collapse-1">
                  <span class="sr-only">Toggle navigation</span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                  <span class="icon-bar"></span>
                </button>
              </div>

              <!-- Desktop sidebar -->
              <div class="sidenav col-sm-3 collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
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
                <h4 class="text-center">${user.username}</h4>
                <ul class="nav navbar-nav nav-pills">
                  <li class="active"><a class="left-color" href="#section1" data-toggle="pill">Overview<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                  <li class="dropdown">
                    <a class="left-color" href="#" class="dropdown-toggle" data-toggle="dropdown">Messages <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                      <li><a href="/Auctioner/messaging/inbox" data-target="#section2" id="inbox_tab" data-toggle="pill" rel="tooltip">Inbox</a></li>
                      <li><a href="/Auctioner/messaging/new-message" data-target="#section3" id="newMessage_tab" data-toggle="pill" rel="tooltip">New Message</a></li>
                      <li><a href="/Auctioner/messaging/sent" data-target="#section4" id="sent_tab" data-toggle="pill" rel="tooltip">Sent</a></li>
                      <li class="divider" data-toggle="pill"></li>
                      <li><a href="/Auctioner/messaging/anouncements" data-target="#section5" id="anouncements_tab" data-toggle="pill" rel="tooltip">Anouncements</a></li>
                    </ul>
                  </li>
                  <sec:authorize ifAnyGranted="ROLE_SELLER">
                  <li ><a class="left-color" href="#section6" id="auctions_tab" data-toggle="pill">My Auctions<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-tasks"></span></a></li>
                  </sec:authorize>
                  <li ><a class="left-color" href="#section7" id="bought_tab" data-toggle="pill">Bought Auctions<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-usd"></span></a></li>
                </ul>
              </div>
            </div>
         </nav>

	     <div  id="loading" class="tab-content">
	    	<div class="tab-pane fade in active" id="section1" name="overview">
                <div class="col-md-9">
                  <h3 class="text-center">Personal info</h3>
                  <div class="col-md-offset-4 col-md-3">
                      <h4 class="text-left">Name</h4>
                  </div>
                  <div class="col-md-4">
                      <h4 class="text-left"><strong>${user.firstName}</strong></h4>
                  </div>
                  <div class="col-md-offset-4 col-md-3">
                      <h4 class="text-left">Lastname</h4>
                  </div>
                  <div class="col-md-4">
                      <h4 class="text-left"><strong>${user.lastName}</strong></h4>
                  </div>
                  <div class="col-md-offset-4 col-md-3">
                      <h4 class="text-left">Country</h4>
                  </div>
                  <div class="col-md-4">
                      <h4 class="text-left"><strong>${user.country}</strong></h4>
                  </div>
                  <div class="col-md-offset-4 col-md-3">
                      <h4 class="text-left">City</h4>
                  </div>
                  <div class="col-md-4">
                      <h4 class="text-left"><strong>${user.city}</strong></h4>
                  </div>
                  <div class="col-md-offset-4 col-md-3">
                      <h4 class="text-left">Email</h4>
                  </div>
                  <div class="col-md-4">
                      <h4 class="text-left"><strong>${user.email}</strong></h4>
                  </div>
                  <sec:authorize ifAnyGranted="ROLE_SELLER">
                      <div class="col-md-offset-4 col-md-3">
                          <h4 class="text-left">Phone</h4>
                      </div>
                      <div class="col-md-4">
                          <h4 class="text-left"><strong>${user.phone}</strong></h4>
                      </div>
                      <div class="col-md-offset-4 col-md-3">
                          <h4 class="text-left">Address</h4>
                      </div>
                      <div class="col-md-4">
                          <h4 class="text-left"><strong>${user.address}</strong></h4>
                      </div>
                      <div class="col-md-offset-4 col-md-3">
                          <h4 class="text-left">Postal Code</h4>
                      </div>
                      <div class="col-md-4">
                          <h4 class="text-left"><strong>${user.postalCode}</strong></h4>
                      </div>
                      <div class="col-md-offset-4 col-md-3">
                          <h4 class="text-left">AFM</h4>
                      </div>
                      <div class="col-md-4">
                          <h4 class="text-left"><strong>${user.afm}</strong></h4>
                      </div>
                  </sec:authorize>
                </div>
                <div class="row">
                    <div class="col-sm-9">
                        <c:if test="${user.approved == 1}">
                            <a href="/Auctioner/myprofile/update" class="btn btn-primary pull-right">Change Profile</a>
                        </c:if>
                        <c:if test="${user.approved == 0}">
                            <a href="#" class="btn btn-primary pull-right" data-toggle="tooltip" data-placement="top" title="You need an approved account for this action." disabled="disabled">Change Profile</a>
                        </c:if>
                    </div>
                </div>
            </div>

		    <div class="tab-pane fade" id="section2" name="inbox">

			</div>

            <div class="tab-pane fade" id="section3" name="newMessage">

		    </div>

		    <div class="tab-pane fade" id="section4" name="sent">

		    </div>

            <div class="tab-pane fade" id="section5" name="anouncements">
			    <div class="col-sm-9">
                    <%-- <div class="panel panel">
                      	<div class="panel-heading">
                      		<h4 class="panel-title">User Details</h4>
                      	</div>
                      	<div class="panel-body">

                        </div>
                    </div> --%>
			    </div>
		    </div>

            <div class="tab-pane fade" id="section6" name="auctions">
			    <div class="col-sm-9">
                    <c:if test="${not empty msg}">
        				<div class="alert alert-info">${msg}</div>
        			</c:if>
                    <c:if test="${empty msg}">
        				<%@ include file="myauction-list.jsp" %>
        			</c:if>
                </div>
		    </div>

            <div class="tab-pane fade" id="section7" name="bought">
                <div class="col-sm-9">
                    <c:if test="${not empty msg2}">
        				<div class="alert alert-info">${msg}</div>
        			</c:if>
                    <c:if test="${empty msg2}">
        				<%@ include file="bought-auction-list.jsp" %>
        			</c:if>
                </div>
		    </div>

	  	</div>

	  </div>
	</div>

    <%@ include file="/resources/template/footer.jsp" %>

    <!-- /.container -->

    <script src=<c:url value="/resources/js/jquery.dataTables.min.js" />></script>
    <script src=<c:url value="/resources/js/dataTables.bootstrap.min.js" />></script>
    <script src=<c:url value="/resources/js/spin.min.js" />></script>
    <script src=<c:url value="/resources/js/spinner.js" />></script>
    <script src=<c:url value="/resources/js/myprofile-page-load.js" />></script>

    <script>

    $('#${button}').click();

    /* Messages for New Message Tab */
    var error_msg = "${err_msg}";
    var info_msg = "${info_msg}";

    /* Reply Receiver */
    var recipient = "${receiver}";

    $(document).ready(function() {
        $('#list').click(function(event){event.preventDefault();$('#products .item').addClass('list-group-item');});
        $('#grid').click(function(event){event.preventDefault();$('#products .item').removeClass('list-group-item');$('#products .item').addClass('grid-group-item');});
    });

    $(document).ready(function() {
        $('#list-bought').click(function(event){event.preventDefault();$('#products-bought .item').addClass('list-group-item');});
        $('#grid-bought').click(function(event){event.preventDefault();$('#products-bought .item').removeClass('list-group-item');$('#products-bought .item').addClass('grid-group-item');});
    });


    </script>

</body>

</html>
