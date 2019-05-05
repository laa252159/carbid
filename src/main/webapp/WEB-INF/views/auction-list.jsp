
    <div class="well well-sm">
        <div class="pull-left">
            <p style="font-size: 16px;" >Аукционы сейчас: ${filter.numberofItems}<p>
        </div>
        <div class="btn-group">
        </div>
    </div>
    <div id="products" class="row list-group">
        <c:forEach items="${auctions}" var="auction">

            <div class="item  col-xs-12 list-group-item list-group-item">
                <div class="thumbnail item-shadow">
                    <div class="auction-list-img-div">
                        <div style="float:left">
                            <c:if test="${not empty auction.imagesForGallery}">
                                <a class="js-item-slider item-slider" href="/auction/${auction.auctionid}">
                                    <ul class="item-slider-list js-item-slider-list">
                                        <c:forEach items="${auction.imagesForGallery}" var="image" varStatus="loop">
                                            <li class="item-slider-item js-item-slider-item ">
                                                <div class="item-slider-image">
                                                    <img src="data:image/jpeg;base64,${image}"
                                                         class="large-picture-img"/>
                                                </div>
                                            </li>
                                        </c:forEach>
                                    </ul>
                                </a>
                            </c:if>
                            <c:if test="${empty auction.imagesForGallery}">
                                <a href="/auction/${auction.auctionid}">
                                    <img src="<c:url value="/resources/images/empty_car.jpg"/>" class="large-picture" alt="hammer-image"/>
                                </a>
                            </c:if>
                        </div>

                        <div>
                            <div class="col-xs-12 col-md-7">
                                <table class="text-in-galery-pannels">
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>Марка:</td>
                                        <td><b>&nbsp;&nbsp;&nbsp;${auction.brand}</b></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>Модель:</td>
                                        <td><b>&nbsp;&nbsp;&nbsp;${auction.model}</b></td>
                                    </tr>
                                    <tr>
                                        <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td>Год выпуска:</td>
                                        <td><b>&nbsp;&nbsp;&nbsp;${auction.released}</b>
                                    </tr>
                                    <sec:authorize ifNotGranted="ROLE_ANONYMOUS">
                                        <tr>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td>Пробег:</td>
                                            <td><b>&nbsp;&nbsp;&nbsp;${auction.run}</b></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td>Двигатель:</td>
                                            <td><b>&nbsp;&nbsp;&nbsp;${auction.released}</b></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td>Коробка:</td>
                                            <td><b>&nbsp;&nbsp;&nbsp;${auction.transmission}</b></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td>Кузов:</td>
                                            <td><b>&nbsp;&nbsp;&nbsp;${auction.body}</b></td>
                                        </tr>
                                        <tr>
                                            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                            <td>Привод:</td>
                                            <td><b>&nbsp;&nbsp;&nbsp;${auction.drive}</b></td>
                                        </tr>
                                    </sec:authorize>
                                    <tr>
                                        <div id="fly-in" class="body-cinema">
                                            <div>
                                                <span></span><b style="color: red">проверено</b> &nbsp;
                                                <c:if test="${not empty auction.evaluation}">
                                                    баллов: <b style="color: red">${auction.evaluation}</b> из 30
                                                </c:if>
                                            </div>
                                        </div>
                                    </tr>
                                </table>
                            </div>
                            <div class="col-xs-12 col-md-5">
                                <p class="price-tag pull-right"><strong>${auction.currently} Руб</strong></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </c:forEach>
    </div>