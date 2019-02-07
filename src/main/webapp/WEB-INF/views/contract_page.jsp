<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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

     <link href=<c:url value="/resources/css/bootstrap-select.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/bootstrap-datetimepicker.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/fileinput.min.css" /> rel="stylesheet" type="text/css">
     <link href=<c:url value="/resources/css/form.css" /> rel="stylesheet" type="text/css">

      <%@ include file="/resources/template/menu-top.jsp" %>

     <div class="container">
        <div class="row" style="margin: 10px">
        	<section>
                <div class="tab-pane" role="tabpanel" id="complete">
                    <div class="row content-row">
                        <div class="text-center">
                            <jsp:include page="contract.jsp"/>
                            <%--<p class="lead">Только подтвержденные аккаунты <b>с внесенным депозитом не менее 1000 рублей</b> могут принимать участие в торгах</p>--%>
                            <h2 class="lead" style="color: red;">Только подтвержденные аккаунты могут принимать участие
                                в торгах</h2>
                            <%--<p><a class="btn-success" href="/">Перейти на стартовую страницу</a></p>--%>



                        </div>
                        <c:if test="${showApplyContractButtons}">
                            <div class="col-md-offset-0 col-md-2">
                                <p><a class="btn-success" href="${applyContractAndLogIn}">ПРИНИМАЮ УСЛОВИЯ</a></p>
                            </div>
                            <div class="col-md-offset-0 col-md-2">
                                <p><a class="btn-danger" href="${rejectContractAndRemoveUser}">не принимаю условия</a></p>
                            </div>
                        </c:if>
                    </div>
                </div>
            </section>
        </div>
    </div>

    <%@ include file="/resources/template/footer.jsp" %>
</body>

</html>
