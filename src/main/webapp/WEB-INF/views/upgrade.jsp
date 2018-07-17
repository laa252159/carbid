<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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

    <title>Auctioner</title>

</head>

<body>

   	 <%@ include file="/resources/template/menu-top.jsp" %>
     <link href=<c:url value="/resources/css/bootstrap-select.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/bootstrap-datetimepicker.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/fileinput.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/form.css" /> rel="stylesheet" type="text/css">

     <div class="container">
        <c:if test="${user.approved == 1}" >
        <div class="row">
            <div class="row">
    			<c:if test="${not empty error}">
    				<div class="alert alert-danger">
                         <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                        ${error}
                    </div>
    			</c:if>
    			<c:if test="${not empty msg}">
    				<div class="alert alert-info">${msg}</div>
    			</c:if>
    		</div>
        	<div class="row top-buffer">
                <p class="lead text-center">
                    Please provide the following info in order to become an Auctioneer. <br />
                    After the completion of this step you will be able to create new Auctions.
                </p>
            </div>
            <div class="row top-buffer">
                <div class="col-md-4 col-md-offset-4">
            		<form name="upgradeForm" role="form" method="POST">
            			 <div class="form-group">
            				 <label for="address">Address: </label>
            				 <input type="text" name='address' class="form-control" id="address" />
            			 </div>
            			 <div class="form-group">
            				  <label for="postalCode">Postal Code: </label>
            				  <input type="postalCode" name='postalCode' class="form-control" id="postalCode" />
            			 </div>
                         <div class="form-group">
            				 <label for="afm">AFM: </label>
            				 <input type="text" name='afm' class="form-control" id="afm" />
            			 </div>
                         <div class="form-group">
    						 <label for="phone">Phone:</label>
    						 <input type="text" name='phone' path="phone" class="form-control" id="phone" />
    					 </div>
                         <div class="row top-buffer">
                             <ul class="list-inline pull-right">
                                 <li><button name="submit" type="submit" value="submit" class="btn btn-lg btn-success">Upgrade</button></li>
                             </ul>
                         </div>
            		</form>
            	</div>
            </div>
        </div>
        </c:if>
        <c:if test="${user.approved == 0}" >
            <h4 class="text-center">Your account has to be approved in order to be able to place bids and become an Auctioneer.</h4>
            <div class="row text-center">
                <a href="/Auctioner/" class="btn btn-primary">Back To Homepage</a>
            </div>
        </c:if>
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
    			country: {
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

    $(function () {
        $('#datetimepicker1').datetimepicker();
        populateCountries("country");
    });

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
