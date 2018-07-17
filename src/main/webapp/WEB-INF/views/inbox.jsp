<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<%-- Inbox and Message View swap through Javascript --%>

<%-- Inbox --%>
<div id="messages" class="col-sm-9">
  <div class="panel panel-primary">
  	<div class="panel-heading">
  		<h4 class="panel-title">Inbox</h4>
  	</div>
  	<div class="panel-body">
        <table id="inbox" class="table table-hover table-condensed">
        	<thead>
        		<tr>
                    <td>Id</td>
                    <td>Receiver</td>
        			<td>Sender</td>
        			<td class="text-right">Date</td>
                    <td>Message</td>
        		</tr>
        	</thead>
			<tbody>
			<c:forEach items="${inbox}" var="message">
			<tr <c:if test="${message.isRead==0}">
                class="info"
            </c:if>>
                <td><c:out value="${message.messageId}"></c:out></td>
                <td><c:out value="${message.receiverUsername}"></c:out></td>
				<td><c:out value="${message.senderUsername}"></c:out></td>
				<td class="text-right"><fmt:formatDate pattern="hh:mm dd-MMM-yyyy" value="${message.date}" /></td>
                <td><c:out value="${message.message}"></c:out></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
  </div>
</div>

<%-- Message View --%>
<div id="message" class="col-sm-9" style="display: none">
    <div class="panel panel-primary">
      	<div class="panel-heading">
      		<h4 id="header" class="panel-title"></h4>
      	</div>
      	<div class="panel-body">
      		<button id="back" class="btn btn-sm btn-default btn-active"><span class="glyphicon glyphicon-arrow-left"></span></button>
            <br />
            <p>
                <span id="sender"></span><br/>
                <span id="receiver"></span>
            </p>
            <br />
            <div class="well">
            	<p id="content"></p>
            </div>
    	</div>
    	<div class="panel-footer">
            <a id="delete" href="" class="btn btn-sm btn-danger col-md-offset-10">Delete</a>
            <%-- Prepare Response --%>
            <sec:authorize ifAnyGranted="ROLE_ADMIN">
                <a id = "reply" href="/Auctioner/admin-new-message" class="btn btn-sm btn-success">Reply</a>
            </sec:authorize>
            <sec:authorize ifNotGranted="ROLE_ADMIN">
                <a id = "reply" href="/Auctioner/myprofile-new-message" class="btn btn-sm btn-success">Reply</a>
            </sec:authorize>
    	</div>
    </div>
</div>


<script>

	/* Inbox Table */
	var table = $('#inbox').DataTable({

	    lengthChange: false,
	    ordering: false,
	    info: false,
	    autoWidth: false,

        /* Hide Columns */
        "columnDefs": [
            {
                "targets": [ 0 ],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [ 1 ],
                "visible": false,
                "searchable": false
            },
            {
                "targets": [ 2 ],
                "width": "50%"
            },
            {
                "targets": [ 3 ],
                "width": "50%"
            },
            {
                "targets": [ 4 ],
                "visible": false,
                "searchable": false
            }
        ]
	});

    /* Inbox table onClick */
    $('#inbox tbody').on('click', 'tr', function () {
		var data = table.row( this ).data(),
            row = $(this);

        /* Table data */
        var id = data[0],
            receiver = data[1],
            sender = data[2],
            date = data[3],
            message = data[4];

        /* Populate Message View */
        $('#delete').attr("href", "/Auctioner/messaging/delete/" + id);
        $('#header').text(date);
        $('#sender').text('From: '+ sender);
        $('#receiver').text('To: ' + receiver);
        $('#content').text(message);

        /* Reply */
        $('#reply').each(function () {
            var href = $(this).attr('href');
            $(this).attr('href', href + '/' + sender);
        });

        /* Ajax update message.isRead value */
        $.ajax({
    		url: '/Auctioner/messaging/isRead/' + data[0],
       		type: 'GET',
    	    success: function(data)
    	    {
    	    	/* Remove class="info" and swap to Message View */
                $('#messages').hide();
                row.removeClass('info');
                $('#message').show();
                chekforMessagesOnce();
    	    },
    		error: function(data)
    		{
    			// Debug
    			alert('error');
    		}
        });
    });

    /* Back button. Swap to Inbox View */
    $('#back').click(function() {

    	 $('#message').hide();
         $('#messages').show();
    });

    // /* Delete Message */
    // $('#delete').on('click', function() {
    //     console.log("Delete");
    // });

</script>
