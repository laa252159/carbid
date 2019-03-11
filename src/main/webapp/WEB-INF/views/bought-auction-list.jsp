
    <div class="well well-sm">
        <div class="btn-group">
            <%--<a href="#" id="list-bought" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list"></span>Список</a>--%>
            <%--<a href="#" id="grid-bought" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th"></span>Таблица</a>--%>
        </div>
    </div>
    <div id="products-bought" class="row list-group">
        <c:forEach items="${boughtAuctions}" var="auction">
            <div class="item  col-xs-4 col-lg-4 list-group-item">
                <div class="thumbnail">
                    <div class="auction-list-img-div">
                        <c:if test="${not empty auction.primaryImage}">
                            <a href="/auction/${auction.auctionid}"><img src="data:image/jpeg;base64,${auction.primaryImage}" alt="auction-image" /></a>
                        </c:if>
                        <c:if test="${empty auction.primaryImage}">
                            <a href="/auction/${auction.auctionid}"><img src="<c:url value="/resources/images/hammer1.png"/>" alt="hammer-image" /></a>
                        </c:if>
                    </div>
                    <div class="caption">
                        <div class="col">
                        <table class="text-in-galery-pannels">
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Марка:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.brand}</b></td></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Модель:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.model}</b></td></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Год выпуска:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.released}</b></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Пробег:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.run}</b></td></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Двигатель:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.released}</b></td></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Коробка:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.transmission}</b></td></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Кузов:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.body}</b></td></tr>
                            <tr><td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td><td>Привод:</td><td><b>&nbsp;&nbsp;&nbsp;${auction.drive}</b></td></tr>
                        </table>
                        </div>
                        <%--<div class="text-limit">--%>
                            <%--<h4 class="group inner list-group-item-heading">${auction.name}</h4>--%>
                        <%--</div>--%>
                        <div class="col">
                            <div class="col-xs-12 col-md-6">
                                <p class="lead">&#36;${auction.currently}</p>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <a class="btn_lot btn-primary" href="/auction/${auction.auctionid}">Подробнее</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
