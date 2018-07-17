var auctionIds = [];

$('.auc:checkbox').change(function() {
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
