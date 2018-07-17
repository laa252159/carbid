<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%-- Sent and Message View swap through Javascript --%>

<%-- Sent --%>
<div id="messages_sent" class="col-sm-9">
  <div class="panel panel-primary">
  	<div class="panel-heading">
  		<h4 class="panel-title">Sent</h4>
  	</div>
  	<div class="panel-body">
        <table id="sent" class="table table-hover table-condensed">
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
			<c:forEach items="${sent}" var="message">
			<tr <c:if test="${message.isRead==0}">
                class="info"
            </c:if>>
                <td><c:out value="${message.messageId}"></c:out></td>
                <td><c:out value="${message.receiver.username}"></c:out></td>
				<td><c:out value="${message.sender.username}"></c:out></td>
				<td class="text-right"><fmt:formatDate pattern="hh:mm dd-MMM-yyyy" value="${message.date}" /></td>
                <td><c:out value="${message.message}"></c:out></td>
			</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
	<div class="panel-footer">
		<input class="btn btn-success col-md-offset-10" type="submit" value="New Message" id="appr-btn"></input>
	</div>
  </div>
</div>

<%-- Message View --%>
<div id="message_sent" class="col-sm-9" style="display: none">
    <div class="panel panel-primary">
      	<div class="panel-heading">
      		<h4 id="header_sent" class="panel-title"></h4>
      	</div>
      	<div class="panel-body">
      		<button id="back_sent" class="btn btn-sm btn-default btn-active"><span class="glyphicon glyphicon-arrow-left"></span></button>
            <br />
            <p>
                <span id="sender_sent"></span><br/>
                <span id="receiver_sent"></span>
            </p>
            <br />
            <div class="well">
            	<p id="content_sent"></p>
            </div>
    	</div>
    	<div class="panel-footer">
            <a id="delete-sent" href="" class="btn btn-sm btn-danger col-md-offset-10">Delete</a>
    		<input class="btn btn-sm btn-success" type="submit" value="Reply" id="appr-btn"></input>
    	</div>
    </div>
</div>

<script>

/* Sent Table */
var table = $('#sent').DataTable({

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
            "width": "50%"
        },
        {
            "targets": [ 2 ],
            "visible": false,
            "searchable": false
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

/* Sent table onClick */
$('#sent tbody').on('click', 'tr', function () {
    var data = table.row( this ).data(),
        row = $(this);

    /* Table data */
    var id = data[0],
        receiver = data[1],
        sender = data[2],
        date = data[3],
        message = data[4];

    /* Populate Message View */
    $('#delete-sent').attr("href", "/Auctioner/messaging/delete/" + id);
    $('#header_sent').text(date);
    $('#sender_sent').text('From: '+ sender);
    $('#receiver_sent').text('To: ' + receiver);
    $('#content_sent').text(message);

    /* Swap to Message View */
    $('#messages_sent').hide();
    $('#message_sent').show();

});

/* Back button. Swap to Sent View */
$('#back_sent').click(function() {

     $('#message_sent').hide();
     $('#messages_sent').show();
});

</script>
