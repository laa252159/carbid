<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-9">
    <form id="auction-form" method="GET">
      <div class="panel panel-primary">
        <div class="panel-heading">
            <h4 class="panel-title">All Auctions</h4>
        </div>
        <div class="panel-body">
                <table id="allAuctions" class="table table-striped table-hover table-condensed">
                    <thead>
                        <tr>
                            <th>Name</th><th>Seller</th><th>Ends</th><th>First Bid</th><th>Export</th><th></th>
                        </tr>
                    <thead>
                    <tbody>
                    <c:forEach items="${auctions}" var="auction">
                    <tr>
                        <td><c:out value="${auction.name}"></c:out></td>
                        <td><c:out value="${auction.user.username}"></c:out></td>
                        <td><c:out value="${auction.ends}"></c:out></td>
                        <td><c:out value="${auction.firstBid}"></c:out></td>
                        <td id="auc">
							<input type="checkbox" id="toXml" name="toXml" value="${auction.auctionid}"/>
						</td>
                        <td style="text-align: right">
                            <div class="dropdown">
                            <button class="btn btn-xs btn-primary" data-toggle="dropdown">More</button>
                            <ul class="dropdown-menu">
                                <li><a href="Profile">Details</a>
                                <li><a href="Profile">Seller</a>
                                <li><a href="api/auctions/${auction.auctionid}">Auction XML</a>
                                <%-- <li class="divider"></li>
                                <li id="deleteU"><a href="#">Delete</a> --%>
                            </ul>
                        </div>
                        </td>
                    </tr>
                    </c:forEach>
                    </tbody>
                </table>
        </div>
        <div class="panel-footer">
			<a class="btn btn-success col-md-offset-10" href="/Auctioner/admin/xmlDownload" id="xml-link" name="xml-link" disabled="disabled">Export XML</a>
		</div>
      </div>
    </form>
</div>

<script>

	/* All Auctions Table */
	$('#allAuctions').DataTable({

		lengthChange: false,

		"columnDefs": [
		{ "orderable": false, "targets": [4, 5] }
		 ]
		});

        var auctionIds = [];

        $('input:checkbox[id^="toXml"]').change(function() {
        	if(this.checked) {
        		/* Add class="info" (Blue color) */
        		$(this).closest('tr').addClass('info', '200');

        		/* Add id in Array */
        	    var id = $(this).val();
        	    auctionIds.push(id);

                console.log('id: ' + auctionIds);
        	}
        	else {
        		/* Remove class="info" (Blue Color) */
        		$(this).closest('tr').removeClass('info', '200');
        		var id = $(this).val();

        		/* Remove id from Array */
        		var index = auctionIds.indexOf(id);
        		auctionIds.splice(index,1);
        	}

        	/* Toxml Button Check */
        	if(auctionIds.length > 0) {
        		$('#xml-link').removeAttr('disabled');
        	}
        	else {
        		$('#xml-link').attr('disabled', 'disabled');
        	}
        });

        /* Add ids to link */
        (function($){
            $('#xml-link').click(function() {
                var id;
                var params = "?";
                for(id in auctionIds) {
                    params = params + "ids[]=" + id + "&";
                }
                $(this).attr("href", this.href + params);
                console.log(this.href);
            });
        })(jQuery);

        /* Ajax Submit */
        $("#auction-form").submit(function(e) {

        	e.preventDefault();

            console.log('submit');

        	$.ajax({
        		url: '/Auctioner/admin/xmlDownload',
           		type: 'GET',
           		data: {
        	    	ids: auctionIds
        	    },
        	    success: function(data)
        	    {
        	    	/* Remove class="info" and name from Array */
        	    	$('.info').each(function() {
        				$(this).removeClass('info');
        				auctionIds = [];
                        $('#xml-link').attr('disabled', 'disabled');
        		   	});
                    console.log(data);
                    window.location = "/Auctioner/admin/xmlDownload";
        	    },
        		error: function(data)
        		{
        			// Debug
        			alert('error');
        		}
        	});
        });

</script>
