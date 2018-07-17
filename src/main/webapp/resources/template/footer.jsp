<div class="navbar navbar-default navbar-fixed-bottom" >
    <div class="container text-center">
        <p>&copy; <span class="icon-hammer2"></span> Auctioner.com 2016. All rights reserved.</p>
    </div>
</div>

<script src=<c:url value="/resources/js/jquery.min.js" />></script>
<script src=<c:url value="/resources/js/bootstrap.min.js" />></script>
<script src=<c:url value="/resources/js/jquery.mCustomScrollbar.concat.min.js" />></script>
<script src=<c:url value="/resources/js/style.js" />></script>
<sec:authorize ifNotGranted="ROLE_ANONYMOUS">
<script src=<c:url value="/resources/js/msg-notify.js" />></script>
</sec:authorize>
