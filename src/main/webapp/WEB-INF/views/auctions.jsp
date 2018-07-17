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

    <link href=<c:url value="/resources/css/auction-list.css" /> rel="stylesheet" type="text/css">
    <link href=<c:url value="/resources/css/categories-panel.css" /> rel="stylesheet" type="text/css">

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



     <div class="container">

         <div class="row">
             <div class="col-sm-12 text-center">
                 <div class="container">
                     <h1 class="page-header"><strong>${filter.category.name}</strong></h1>
                     <div class="row">
                         <%-- Left Column --%>
                         <div class="col-md-3 col-sm-3">
                             <div class="panel panel-primary">
                                 <div class="panel-heading">
                                     <h4 class="panel-title">Categories</h4>
                                 </div>
                                 <div class="panel-body">
                                     <div class="fancy-collapse-panel">
                                         <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                             <c:forEach items="${filter.category.categories}" var="childCategory" varStatus="loop">
                                             <div class="panel">
                                                 <div class="panel-heading" role="tab" id="heading${loop.index}">
                                                     <h4 class="panel-title">
                                                         <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapse${loop.index}" aria-expanded="false" aria-controls="#collapse${loop.index}">${childCategory.name}</a>
                                                     </h4>
                                                 </div>
                                                 <div id="collapse${loop.index}" class="panel-collapse collapse" role="tabpanel" aria-labelledby="heading${loop.index}">
                                                <div class="panel-body">
                                                    <ul class="list-group">
                                                        <c:forEach items="${childCategory.categories}" var="childCategory2">
                                                        <li class="list-group-item"><a href="/Auctioner/auctions?categoryId=${childCategory2.categoryId}">${childCategory2.name}</a></li>
                                                        </c:forEach>
                                                    </ul>
                                                </div>
                                                 </div>
                                             </div>
                                             </c:forEach>
                                         </div>
                                     </div>
                                 </div>
                             </div>
                         </div>
                         <%-- Right Column --%>
                         <div class="col-md-9 col-xs-12" >

                             <%@ include file="auction-list.jsp" %>

                             <div class="center-block">
                                 <nav aria-label="Page navigation">
                                     <ul class="pagination pagination-lg">
                                         <c:if test="${filter.pageNum > 1 }">
                                             <li class="page-item">
                                               <a class="page-link" href="/Auctioner/auctions?page=1" aria-label="First">
                                                 <span aria-hidden="true">&lt;&lt;</span>
                                                 <span class="sr-only">First</span>
                                               </a>
                                             </li>
                                             <li class="page-item">
                                               <a class="page-link" href="/Auctioner/auctions?page=${filter.pageNum - 1}" aria-label="Previous">
                                                 <span aria-hidden="true">&lt;</span>
                                                 <span class="sr-only">Previous</span>
                                               </a>
                                             </li>
                                         </c:if>
                                         <c:forEach items="${filter.pages}" var="page">
                                             <c:if test="${page == filter.pageNum}">
                                                  <li class="page-item active"><a class="page-link" href="/Auctioner/auctions?page=${page}">${page}</a></li>
                                             </c:if>
                                             <c:if test="${page != filter.pageNum}">
                                                  <li class="page-item"><a class="page-link" href="/Auctioner/auctions?page=${page}">${page}</a></li>
                                             </c:if>
                                         </c:forEach>
                                         <c:if test="${filter.pageNum < filter.numberofPages}">
                                             <li class="page-item">
                                               <a class="page-link" href="/Auctioner/auctions?page=${filter.pageNum + 1}" aria-label="Next">
                                                 <span aria-hidden="true">&gt;</span>
                                                 <span class="sr-only">Next</span>
                                               </a>
                                             </li>
                                             <li class="page-item">
                                               <a class="page-link" href="/Auctioner/auctions?page=${filter.numberofPages}" aria-label="Last">
                                                 <span aria-hidden="true">&gt;&gt;</span>
                                                 <span class="sr-only">Last</span>
                                               </a>
                                             </li>
                                         </c:if>
                                     </ul>
                                 </nav>
                             </div>

                         </div>
                     </div>
                 </div>
             </div>
        </div>

     </div>

    <%@ include file="/resources/template/footer.jsp" %>

    <script src=<c:url value="/resources/js/auction-list.js" />></script>

</body>

</html>
