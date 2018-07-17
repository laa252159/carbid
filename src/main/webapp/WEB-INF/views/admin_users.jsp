<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class="col-sm-9">
   	<form id="authorize-form" method="GET">
      <div class="panel panel-primary">
      	<div class="panel-heading">
      		<h4 class="panel-title">All Users</h4>
      	</div>
      	<div class="panel-body">
		        <table id="allUsers" class="table table-striped table-hover table-condensed">
		        	<thead>
						<tr>
							<th>Username</th><th>Firstname</th><th>Lastname</th><th>Email</th><th>Approved</th><th></th>
						</tr>
					<thead>
					<tbody>
					<c:forEach items="${users}" var="user">
					<tr>
						<td><c:out value="${user.username}"></c:out></td><td><c:out value="${user.firstName}"></c:out></td><td><c:out value="${user.lastName}"></c:out></td><td><c:out value="${user.email}"></c:out></td>
						<td id="us">
							<input type="checkbox" id="approved" name="approved" value="${user.userid }"
								<c:if test="${user.approved==1}">
									checked disabled="disabled"
								</c:if>
							/>
						</td>
						<td style="text-align: right">
							<div class="dropdown">
							<button class="btn btn-xs btn-primary" data-toggle="dropdown">More</button>
							<ul class="dropdown-menu">
								<li><a href="/Auctioner/profile/${user.userid}">Profile</a>
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
			<input class="btn btn-success col-md-offset-10" type="submit" value="Approve" id="appr-btn" disabled="disabled"></input>
		</div>
      </div>
    </form>
</div>

<script>

	/* All Users Table */
	$(document).ready(function() {
		$('#allUsers').DataTable({

			lengthChange: false,

			columnDefs: [
			{ "orderable": false, "targets": 5 }
			 ]
		});
	});

    var namesToApprove = [];

    $('input:checkbox[id^="approved"]').change(function() {
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

        console.log("names lentgh: " + namesToApprove.length);

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
                    $('#appr-btn').attr('disabled', 'disabled');
    		   	});
    	    },
    		error: function(data)
    		{
    			// Debug
    			alert('error');
    		}
    	});
    });


</script>
