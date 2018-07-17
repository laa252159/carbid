<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<html>
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

	<title>Login Page</title>


</head>
<body onload='document.loginForm.username.focus();'>

 	<%@ include file="/resources/template/menu-top.jsp" %>

	<div class="col-md-4 col-md-offset-4">
		<c:if test="${not empty error}">
		<div class="alert alert-danger">${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
		</c:if>
		<c:if test="${not empty msg}">
			<div class="alert alert-info">
				 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
				${msg}
			</div>
		</c:if>
	</div>
	<br/>
	<br/>
	<div class="col-md-4 col-md-offset-4 well">
		<form name="loginForm" role="form" action="<c:url value='j_spring_security_check' />" method="POST">
			 <div class="form-group">
				 <label for="email">Username:</label>
				 <input type="text" name='username' class="form-control" id="username">
			 </div>
			 <div class="form-group">
				  <label for="pwd">Password:</label>
				  <input type="password" name='password' class="form-control" id="pwd">
			 </div>
			 <div class="checkbox">
 			      <label><input type="checkbox"> Remember me</label>
			 </div>
	  		 <button name="submit" type="submit"
					value="submit" class="btn btn-success">Login</button>
		</form>
		<p>Not a member? Sign up <a href="registration">here</a><p>
	</div>

	<!-- Footer -->
	<%@ include file="/resources/template/footer.jsp" %>


</body>
</html>
