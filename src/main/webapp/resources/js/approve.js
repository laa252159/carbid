var namesToApprove = [];

$('.us:checkbox').change(function() {
	if(this.checked) {
		/* Add class="info" (Blue color) */
		$(this).closest('tr').addClass('info', '200');

		/* Add name in Array */
	    var Name = $(this).closest('tr').find('td:eq(0)').text();
        console.log("Name: " + Name);
	    namesToApprove.push(Name);
	}
	else {
		/* Remove class="info" (Blue Color) */
		$(this).closest('tr').removeClass('info', '200');
		var Name = $(this).closest('tr').find('td:eq(0)').text();

		/* Remove name from Array */
		var index = namesToApprove.indexOf(Name);
		namesToApprove.splice(index,1);
	}

    console.log("names lentgh: " + namesToApprove.lentgh);

	/* Approve Button Check */
	if(namesToApprove.length > 0) {
		$('#appr-btn').removeAttr('disabled');
	}
	else {
		$('#appr-btn').attr('disabled', 'disabled');
	}
});

/* Ajax Submit */
$("#authorize-form").submit(function(e) {

	e.preventDefault();

	$.ajax({
		url: '/Auctioner/approveUsers',
   		type: 'POST',
   		data: {
	    	names: namesToApprove
	    },
	    success: function(data)
	    {
	    	/* Remove class="info" and name from Array */
	    	$('.info').each(function() {
	    		$(this).find('input:checkbox').attr('disabled', 'disabled');
				$(this).removeClass('info');
				namesToApprove = [];
		   	});
	    },
		error: function(data)
		{
			// Debug
			alert('error');
		}
	});
});
