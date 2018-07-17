<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="col-sm-9">
  <form:form id="new-message-form" name="newMessageForm" role="form" modelAttribute="new_message" method="POST">
      <div class="panel panel-primary">
          	<div class="panel-heading">
          		<h4 class="panel-title">New Anouncement</h4>
          	</div>
          	<div class="panel-body">

    			<div id="new-an-info" class="alert alert-info" style="display: none">
                 <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                 <p></p>
                </div>
                <br />
                <form:textarea class="form-control" name="message" path="message" placeholder="Type in your message" rows="10"></form:textarea>
        	</div>
        	<div class="panel-footer">
        		<input class="btn btn-success col-md-offset-10" type="submit" value="Send Anouncement" id="appr-btn"></input>
        	</div>
      </div>
  </form:form>
</div>

<script>

info_display = info_an;

if(info_an.length > 0) {
    $('#new-an-info').show(function(){
       $(this).find("p:first").text(info_display);
    });
    info_an = "";
}

</script>
