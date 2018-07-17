<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="col-sm-9">
    <div class="panel panel-primary">
      	<div class="panel-heading">
      		<h4 class="panel-title">${message.date}</h4>
      	</div>
      	<div class="panel-body">
            <p>
                From: ${message.sender.username} <br />
                To: ${message.receiver.username} <br />
            </p>
            <br />
            <div class="well" name="message">
                ${message.message}
            </div>
    	</div>
    	<div class="panel-footer">
    		<input class="btn btn-sm btn-success col-md-offset-11" type="submit" value="Reply" id="appr-btn"></input>
    	</div>
    </div>
</div>
