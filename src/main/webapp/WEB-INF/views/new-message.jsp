<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-9">
  <form:form id="new-message-form" name="newMessageForm" role="form" modelAttribute="new_message" method="POST">
      <div class="panel panel-primary">
          	<div class="panel-heading">
          		<h4 class="panel-title">New Message</h4>
          	</div>
          	<div class="panel-body">

    			<div id="new-msg-error" class="alert alert-danger" style="display: none">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                 <p></p>
                </div>
                <div id="new-msg-info" class="alert alert-info" style="display: none">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                 <p></p>
                </div>
                <form:input id = "replyTo" class="form-control" name="receiver" path="receiver.username" placeholder="Recipient username"></form:input>
                <br />
                <form:textarea class="form-control" name="message" path="message" placeholder="Type in your message" rows="10"></form:textarea>
        	</div>
        	<div class="panel-footer">
        		<input class="btn btn-success col-md-offset-9" type="submit" value="Send Message" id="appr-btn"></input>
        	</div>
      </div>
  </form:form>
</div>

<script>

error_display = error_msg;
info_display = info_msg;

/* Messages */
if(error_msg.length > 0) {
    $('#new-msg-error').show(function(){
       $(this).find("p:first").text(error_display);
    });
    error_msg = "";
}

if(info_msg.length > 0) {
    $('#new-msg-info').show(function(){
       $(this).find("p:first").text(info_display);
    });
    info_msg = "";
}

/* Reply */
if (recipient.length > 0) {
    $('#replyTo').val(recipient);
}


</script>
