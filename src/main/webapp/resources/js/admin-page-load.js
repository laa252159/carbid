var users_visited = false,
    auctions_visited = false,
    inbox_visited = false,
    sent_visited = false,
    anouncements_visited = false;

$('[data-toggle="pill"]').click(function(e) {
    var $this = $(this),
        loadurl = $this.attr('href'),
        targ = $this.attr('data-target');

    /* Load only once */
    if((users_visited == false && $this.attr('id') == "users_tab") || (auctions_visited == false && $this.attr('id') == "auctions_tab")
    || (inbox_visited == false && $this.attr('id') == "inbox_tab") || (sent_visited == false && $this.attr('id') == "sent_tab")
    || (anouncements_visited == false && $this.attr('id') == "anouncements_tab")) {
        $('#loading').addClass('opaque');                   // add opaque in background
        $('#loading').spin();                               // add spinner
        $(targ).load(loadurl, null, function() {
            $('#loading').spin();
            $('#loading').removeClass('opaque');
        });
    }
    else if (($this.attr('id') == "newMessage_tab") || ($this.attr('id') == "newAnouncement_tab")) {
        $(targ).load(loadurl);
    }

    /* Visited Pages = true if are load once */
    if($this.attr('id') == "users_tab") {
       users_visited = true;
    }
    if($this.attr('id') == "auctions_tab") {
       auctions_visited = true;
    }
    if($this.attr('id') == "inbox_tab") {
       inbox_visited = true;
    }
    if($this.attr('id') == "sent_tab") {
       sent_visited = true;
    }
    if($this.attr('id') == "anouncements_tab") {
       anouncements_visited = true;
    }

    $this.tab('show');
       return false;
});
