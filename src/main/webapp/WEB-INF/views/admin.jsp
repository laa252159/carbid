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

	<link href=<c:url value="/resources/css/sidenav.css" /> rel="stylesheet" type="text/css">
	<link href=<c:url value="/resources/css/dataTables.bootstrap.min.css" /> rel="stylesheet" type="text/css">
    <link href=<c:url value="/resources/css/fileinput.min.css" /> rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

    <title>Auctioner</title>

    <style>

    /*.opaque > *:not(.spinner) {
        opacity: 0.1
     }*/

     /*li > a {
         margin-right: 15px;
     }*/

     .dash-number {
         font-size: 35px;
         text-shadow: 2px 2px 1px #999;
     }

     .list-item {
         border-top: 1px orange;
         border-bottom: 1px orange;
     }

    </style>

</head>

<body data-spy="scroll" data-target="#bs-sidebar-navbar-collapse-1" data-offset="50">

   	<%@ include file="/resources/template/menu-top.jsp" %>

	<div class="container">
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
              <div class="col-sm-3 collapse navbar-collapse" id="bs-sidebar-navbar-collapse-1">
                <h4 class="text-center">Admin Panel</h4>
                <ul class="nav navbar-nav nav-pills">
                  <li class="active"><a class="left-color" href="#section1" data-toggle="pill">Overview<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-dashboard"></span></a></li>
                  <li class="dropdown">
                    <a class="left-color" href="#" class="dropdown-toggle" data-toggle="dropdown">Messages <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-envelope"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                      <li><a href="/Auctioner/messaging/inbox" data-target="#section2" id="inbox_tab" data-toggle="pill" rel="tooltip">Inbox</a></li>
                      <li><a href="/Auctioner/messaging/new-message" data-target="#section3" id="newMessage_tab" data-toggle="pill" rel="tooltip">New Message</a></li>
                      <li><a href="/Auctioner/messaging/sent" data-target="#section4" id="sent_tab" data-toggle="pill" rel="tooltip">Sent</a></li>
                      <li class="divider" data-toggle="pill"></li>
                      <li><a href="/Auctioner/messaging/anouncements" data-target="#section5" id="anouncements_tab" data-toggle="pill" rel="tooltip">Anouncements</a></li>
                      <li><a href="/Auctioner/messaging/new-anouncement" data-target="#section6" id="newAnouncement_tab" data-toggle="pill" rel="tooltip">New Anouncement</a></li>
                    </ul>
                  </li>
                  <li ><a class="left-color" href="admin/users" data-target="#section7" id="users_tab" data-toggle="pill" rel="tooltip">Users<span style="font-size:16px;" class="pull-right hidden-xs showopacity glyphicon glyphicon-user"></span></a></li>
                  <li class="dropdown">
                    <a class="left-color" href="#" class="dropdown-toggle" data-toggle="dropdown">Auctions <span class="caret"></span><span style="font-size:16px;" class="pull-right hidden-xs showopacity icon-hammer2"></span></a>
                    <ul class="dropdown-menu forAnimate" role="menu">
                      <li><a href="/Auctioner/admin/auctions" data-target="#section8" id="auctions_tab" data-toggle="pill" rel="tooltip">View Auctions</a></li>
                      <li><a href="/Auctioner/admin/xmlUpload" data-target="#section9" id="xml_tab" data-toggle="pill" rel="tooltip">XML Upload</a></li>
                    </ul>
                  </li>
                </ul>
              </div>
            </div>
          </nav>

	    <div id="loading" class="tab-content">
	    	<div class="tab-pane fade in active" id="section1">
			    <div class="col-sm-9">
			      <div class="panel panel-primary">
                      <div class="panel-heading">
                          <h4 class="panel-title">Dashboard</h4>
                      </div>
                      <div class="panel-body">
                          <p><span class="glyphicon glyphicon-alert text-danger" style="margin-right:10px;"></span><strong >${dashboard.nonApprovedUsers}</strong> non approved <strong >Users</strong>.</p>
                          <p><span class="glyphicon glyphicon-info-sign text-info" style="margin-right:10px;"></span><strong>${dashboard.newAuctions}</strong> new <strong>Auctions</strong> in the last 3 days.</p>
                      </div>
                  </div>
			      <div class="row">
			        <div class="col-sm-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Users</h4>
                            </div>
                            <div class="panel-body">
			                    <div class="dash-number text-center">${dashboard.userNum}</div>
                            </div>
                        </div>
			        </div>
			        <div class="col-sm-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Bidders</h4>
                            </div>
                            <div class="panel-body">
                                <div class="dash-number text-center">${dashboard.bidders}</div>
                            </div>
                        </div>
			        </div>
			        <div class="col-sm-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Auctioneers</h4>
                            </div>
                            <div class="panel-body">
                                <div class="dash-number text-center">${dashboard.sellers}</div>
                            </div>
                        </div>
			        </div>
			        <div class="col-sm-3">
                        <div class="panel panel-primary">
                            <div class="panel-heading">
                                <h4 class="panel-title">Auctions</h4>
                            </div>
                            <div class="panel-body">
                                <div class="dash-number text-center">${dashboard.auctionNum}</div>
                            </div>
                        </div>
			        </div>
			      </div>
			      <div class="row">
			        <div class="col-sm-4">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                              <h4 class="panel-title">Latest Users</h4>
                          </div>
                          <div class="panel-body">
                              <ul class="list-group">
                                <c:forEach items="${dashboard.newUsers}" var="newuser">
                                <li class="list-group-item list-item"><a href="/Auctioner/profile/${newuser.userid}">${newuser.username}</a></li>
                                </c:forEach>
                              </ul>
                          </div>
                      </div>
			        </div>
			        <div class="col-sm-8">
                      <div class="panel panel-primary">
                          <div class="panel-heading">
                              <h4 class="panel-title">Latest Auctions</h4>
                          </div>
                          <div class="panel-body">
                              <ul class="list-group">
                                <c:forEach items="${dashboard.latestAuctions}" var="latestAuction">
                                <li class="list-group-item list-item"><a href="/Auctioner/profile/${latestAuction.auctionid}">${latestAuction.name}</a></li>
                                </c:forEach>
                              </ul>
                          </div>
                      </div>
			        </div>
			      </div>
			    </div>
			</div>

		    <div class="tab-pane fade" id="section2">

			</div>
            <div class="tab-pane fade" id="section3">

		    </div>
            <div class="tab-pane fade" id="section4">

		    </div>
            <div class="tab-pane fade" id="section5">

		    </div>
            <div class="tab-pane fade" id="section6">

		    </div>
		    <div class="tab-pane fade" id="section7">

		    </div>
		    <div class="tab-pane fade" id="section8">

		    </div>
            <div class="tab-pane fade" id="section9">
                <div class="col-sm-9">
                    <h2 class="text-center">Upload XML File</h2>
                    <input id="input-1" name="input1" type="file" class="file-loading" accept="text/xml"/>
                    <div id="error-1" style="margin-top:10px;display:none"></div>
                    <div id="success-1" class="alert alert-success fade in" style="margin-top:10px;display:none"></div>
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
    <script src=<c:url value="/resources/js/admin-page-load.js" />></script>
    <script src=<c:url value="/resources/js/fileinput.min.js" />></script>

    <script>

     $('#${button}').click();

     /* Messages for New Message Tab */
     var error_msg = "${err_msg}";
     var info_msg = "${info_msg}";

     /* Messages for New Anouncement Tab */
     var info_an = "${info_an}";

     /* Reply Receiver */
     var recipient = "${receiver}";

     /* XML File Upload */
     $(document).on('ready', function() {
         $("#input-1").fileinput({
            uploadUrl: "/Auctioner/api/auction/upload", // server upload action
            uploadAsync: true,
            showPreview: false,
            allowedFileExtensions: ['xml'],
            maxFileCount: 1,
            elErrorContainer: '#error-1'
        }).on('filebatchpreupload', function(event, data, id, index) {
            $('#success-1').html('<h4>Upload Status</h4><ul></ul>').hide();
        }).on('fileuploaded', function(event, data, id, index) {
            console.log(JSON.stringify(data));
            var fname = data.files[index].name,
                out = '<li>' + 'Uploaded file # ' + (index + 1) + ' - '  +
                    fname + ' successfully.' + '</li>'+
                    '<li>' + data.response.auctions + ' new Auctions</li>' +
                    '<li>' + data.response.users + " new Users</li>" +
                    '<li>' + data.response.bids + " new Bids</li>" +
                    '<li>' + data.response.categories + " new Categories</li>";
            $('#success-1 ul').append(out);
            $('#success-1').fadeIn('slow');
        });
     });

    </script>

</body>

</html>
