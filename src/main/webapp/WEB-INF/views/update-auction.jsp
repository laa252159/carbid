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
                             <a href="#step1" data-toggle="tab" aria-controls="step1" role="tab" title="Auction Info">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-pencil"></i>
                                 </span>
                             </a>
                         </li>

                         <li role="presentation" class="disabled">
                             <a href="#step2" data-toggle="tab" aria-controls="step2" role="tab" title="Location & Time">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-globe"></i>
                                 </span>
                             </a>
                         </li>
                         <li role="presentation" class="disabled">
                             <a href="#step3" data-toggle="tab" aria-controls="step3" role="tab" title="Images">
                                 <span class="round-tab">
                                     <i class="glyphicon glyphicon-picture"></i>
                                 </span>
                             </a>
                         </li>

                         <li role="presentation" class="disabled">
                             <a href="#complete" data-toggle="tab" aria-controls="complete" role="tab" title="Complete">
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
                            <h2 class="text-center">Auction Info</h2>
                            <div class="row content-row">
                                <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                                    <div class="row">
                                        <div class="form-group">
                                            <label for="name" class="input-label col-md-3">Auction Name:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:input type="text" name="auction.name" path="auction.name" id="name" class="form-control" placeholder="Auction" value="${formAuction.auction.name}" />
                                            		<form:errors path="auction.name" cssClass="error" />
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row top-buffer">
                                        <div class="form-group">
                                            <label for="description" class="input-label col-md-3">Description:</label>
                                            <div class="col-lg-8">
                                                <div class="in-group">
                                                    <form:textarea rows="5" name="description" path="auction.description" id="description" class="form-control" placeholder="Auction Info..." />
                                                	<%-- <form:errors path="formAuction.auction.description" cssClass="error" /> --%>
                                                </div>
                                                <div class="err">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <label for="name" class="input-label col-md-3">Category:</label>
                                        <div class="col-lg-8">
                                            <form:select path="categoryName" name="categoryName" class="selectpicker" data-live-search="true" data-container="body" data-max-options="1" title="Choose one of the following...">
                                                <form:options items="${categories}" itemValue="name" itemLabel="name"></form:options>
                                            </form:select>
                                        </div>
                                    </div>
                                 </div>
                             </div>
                             <div class="row top-buffer">
                                 <ul class="list-inline pull-right">
                                     <li><button type="button" class="btn btn-lg btn-primary next-step">Continue</button></li>
                                 </ul>
                             </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="step2">
                             <h2 class="text-center">Location & Time</h2>
                             <div class="row content-row">
                                 <div class="col-md-6" style="padding-right:20px; border-right: 1px solid #ccc;">
                                     <div class="row">
                                         <div class="form-group">
                                             <label for="firstBid" class="input-label col-md-3">Starting Price:</label>
                                             <div class="col-lg-8">
                                                 <div class="input-group">
                                                     <span class="input-group-addon">&euro;</span>
                                                     <form:input type="text" name="firstBid" path="auction.firstBid" id="firstBid" class="form-control" placeholder="Required" />
                                                     <span class="input-group-addon">.00</span>
                                             		<%-- <form:errors path="auction.name" cssClass="error" /> --%>
                                                </div>
                                                <div class="err">
                                                </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="buyPrice" class="input-label col-md-3">Buy Price:</label>
                                             <div class="col-lg-8">
                                                 <div class="input-group">
                                                     <span class="input-group-addon">&euro;</span>
                                                     <form:input type="text" name="buyPrice" path="auction.buyPrice" id="buyPrice" class="form-control" placeholder="Optional" />
                                                     <span class="input-group-addon"> <span class="glyphicon glyphicon-euro"></span></span>
                                                     <%-- <form:errors path="auction.name" cssClass="error" /> --%>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="ends" class="input-label col-md-3">Ending Date & Time:</label>
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
                                     <div class="row">
                                         <div class="form-group">
                                             <label for="country" class="input-label col-md-3">Country:</label>
                                             <div class="col-lg-8">
                                                 <div class="in-group">
                                                     <form:select path="auction.country" id="country" name="country" class="form-control"></form:select>
                                                 </div>
                                                 <div class="err">
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                     <div class="row top-buffer">
                                         <div class="form-group">
                                             <label for="location" class="input-label col-md-3">City:</label>
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
                                      <li><button type="button" class="btn btn-lg btn-default prev-step">Back</button></li>
                                      <li><button type="button" class="btn btn-lg btn-primary next-step">Continue</button></li>
                                  </ul>
                              </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="step3">
                             <h2 class="text-center">Pictures</h2>
                             <div class="row">
                                 <c:if test="${not empty imageInfos}">
                                 <c:forEach var="imageInfo" items="${imageInfos}" varStatus="loop">
                                     <div id="item-${imageInfo.id}" class="item  col-xs-3 col-lg-3">
                                         <div class="thumbnail">
                                             <div class="auction-list-img-div">
                                                <img src="data:image/jpeg;base64,${imageInfo.image}" alt="auction-image" />
                                             </div>
                                             <div class="caption">
                                                 <div class="row">
                                                     <div class="col-md-offset-8 col-md-4">
                                                         <button id="${imageInfo.id}" type="button" class="btn btn-danger pull-right delete-img"><i><span class="glyphicon glyphicon-trash"></span></i>Delete</button>
                                                     </div>
                                                 </div>
                                             </div>
                                         </div>
                                     </div>
                                </c:forEach>
                                </c:if>
                             </div>
                             <div class="row content-row">
                                 <h2 class="text-center">Upload new pictures</h2>
                                 <input id="input-1" name="input1" type="file" class="file-loading" multiple accept="image/x-png, image/jpeg"/>
                                 <p>At least one picture is required.</p>
                              </div>
                              <div class="row top-buffer">
                                  <ul class="list-inline pull-right">
                                      <li><button type="button" class="btn btn-lg btn-default prev-step">Back</button></li>
                                      <li><button type="button" class="btn btn-lg btn-primary next-step">Continue</button></li>
                                  </ul>
                              </div>
                         </div>
                         <div class="tab-pane" role="tabpanel" id="complete">
                             <h2 class="text-center">Auction creation completed!</h2>
                             <div class="row content-row">
                                 <div class="text-center">
                                     <p class="lead">You have successfully completed all steps.</p>
                                     <p class="lead">Press Save and your auction will become available for bidding.</p>
                                 </div>
                             </div>
                             <div class="row top-buffer">
                                 <ul class="list-inline pull-right">
                                     <form:input type="hidden" name='auctionid' path="auction.auctionid" class="form-control" />
                                     <li><button name="submit" type="submit" value="submit" class="btn btn-lg btn-success">Save Auction</button></li>
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
                'auction.country': {
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
        populateCountries("country");
    });

    /* File Upload */
    $(document).on('ready', function() {
        $("#input-1").fileinput({
            showUpload: false,
            maxFileCount: 10,
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

    /* Delete Image */
    $(document).on('ready', function() {
        $(".delete-img").on('click', function() {

            var id = $(this).attr('id');
            console.log("Delete " + id)

            var url = "/Auctioner/delete-image/" + id;

            $.ajax({
        		url: url,
           		type: 'GET',
        	    success: function(data)
        	    {
                    console.log("Succesfully deleted");
                    $("#item-" + id).addClass("hidden");
        	    },
        		error: function(data)
        		{
        			console.log("Error on deletion");
        		}
        	});

        });
    });

    </script>

</body>

</html>
