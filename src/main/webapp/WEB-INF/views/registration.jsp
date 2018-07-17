<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
	<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

	<link href=<c:url value="/resources/css/bootstrap.min.css" /> rel="stylesheet" type="text/css">
	<link href=<c:url value="/resources/css/bootstrap-lumen.css" /> rel="stylesheet" type="text/css">
	<link href=<c:url value="/resources/css/style.css" /> rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<title>Registration</title>

	<style>

	.error{
		color:red;
		font-size: 0.8em;
	}

	</style>

</head>
<body>

	<%@ include file="/resources/template/menu-top.jsp" %>

	<div class="container">
		<div class="row">
			<c:if test="${not empty error}">
				<div class="alert alert-danger">${error}</div>
			</c:if>
			<c:if test="${not empty msg}">
				<div class="alert alert-info">${msg}</div>
			</c:if>
		</div>
		<form:form id="form" name="regForm" role="form" modelAttribute="user" method="POST">
			<div class="col-md-8 col-md-offset-2">
				<div class="col-md-6">
					<div class="form-group">
						 <label for="firstName">First Name:</label>
						 <form:input type="text" name='firstName' path="firstName" class="form-control" />
						 <form:errors path="firstName" cssClass="error" />
					 </div>
					 <div class="form-group">
						 <label for="lastName">Last Name:</label>
						 <form:input type="text" name='lastName' path="lastName" class="form-control" id="lastName" />
						 <form:errors path="lastName" cssClass="error" />
					 </div>
					 <div class="form-group">
						 <label for="username">Username:</label>
						 <form:input type="text" name='username' path="username" class="form-control" id="username" />
						 <form:errors path="username" cssClass="error" />
					 </div>
					 <div class="form-group">
						  <label for="pwd">Password:</label>
						  <form:input type="password" name='password' path="password" class="form-control" id="pwd" />
						  <form:errors path="password" cssClass="error" />
					 </div>
					  <div class="form-group">
						 <label for="email">Email:</label>
						 <form:input type="text" name='email' path="email" class="form-control" id="email" />
						 <form:errors path="email" cssClass="error" />
					 </div>
				 </div>
				 <div class="col-md-6">
					 <div class="form-group">
						 <label for="country">Country:</label>
						 <form:input type="text" name='country' path="country" class="form-control" id="country" />
						 <form:errors path="country" cssClass="error" />
					 </div>
					  <div class="form-group">
						 <label for="city">City:</label>
						 <form:input type="text" name='city' path="city" class="form-control" id="city" />
						 <form:errors path="city" cssClass="error" />
					 </div>
					 <br>
			 		 <button name="submit" type="submit"
						     value="submit" class="btn btn-success">Submit</button>
				 </div>
			</div>
		</form:form>
	</div>

	<!-- Footer -->
	<%@ include file="/resources/template/footer.jsp" %>

	<script src=<c:url value="/resources/js/jquery.validate.min.js" />></script>

   	<script>

 	$('#form').validate({

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
			country: {
				required:true
			},
			city: {
				required:true
			}
		},
		highlight: function(element, errorClass) {
			$(element).closest('.form-group').addClass('has-error');
		}
	});

   	</script>

</body>
</html>
