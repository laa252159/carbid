
    <div class="well well-sm">
        <div class="btn-group">
            <a href="#" id="list" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th-list"></span>List</a>
            <a href="#" id="grid" class="btn btn-default btn-sm"><span class="glyphicon glyphicon-th"></span>Grid</a>
        </div>
    </div>
    <div id="products" class="row list-group">
        <c:forEach items="${auctions}" var="auction">
            <div class="item  col-xs-4 col-lg-4">
                <div class="thumbnail">
                    <div class="auction-list-img-div">
                        <c:if test="${not empty auction.primaryImage}">
                            <a href="/Auctioner/auction/${auction.auctionid}"><img src="data:image/jpeg;base64,${auction.primaryImage}" alt="auction-image" /></a>
                        </c:if>
                        <c:if test="${empty auction.primaryImage}">
                            <a href="/Auctioner/auction/${auction.auctionid}"><img src="<c:url value="/resources/images/hammer1.png"/>" alt="hammer-image" /></a>
                        </c:if>
                    </div>
                    <div class="caption">
                        <div class="text-limit">
                            <h4 class="group inner list-group-item-heading">${auction.name}</h4>
                        </div>
                        <div class="row">
                            <div class="col-xs-12 col-md-6">
                                <p class="lead">&#36;${auction.firstBid}</p>
                            </div>
                            <div class="col-xs-12 col-md-6">
                                <a class="btn btn-primary" href="/Auctioner/auction/${auction.auctionid}">View More</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </c:forEach>
    </div>
