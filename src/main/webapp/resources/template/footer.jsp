<div class="myfooter">
    <div class="container text-center" style="color: #FFFFFF; font-size: 12pt" >
        <p>&copy; cars64 2019</p>
    </div>
</div>

<%--<script src=<c:url value="/resources/js/jquery-3.2.1.min.js" />></script>--%>
<script src=<c:url value="/resources/js/jquery.min.js" />></script>
<script src=<c:url value="/resources/js/bootstrap.min.js" />></script>
<script src=<c:url value="/resources/js/jquery.mCustomScrollbar.concat.min.js" />></script>
<script src=<c:url value="/resources/js/style.js" />></script>
<sec:authorize ifNotGranted="ROLE_ANONYMOUS">
<script src=<c:url value="/resources/js/msg-notify.js" />></script>
</sec:authorize>
