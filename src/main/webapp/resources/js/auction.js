
/* Countdown */

window.addEventListener('load',
  function() {
    $('#clock').countdown(ends)
    .on('update.countdown', function(event) {
      var format = '%H:%M:%S';
      if(event.offset.totalDays > 0) {
        format = '%-d day%!d ' + format;
      }
      if(event.offset.weeks > 0) {
        format = '%-w week%!w ' + format;
      }
      $(this).html(event.strftime(format));
    })
    .on('finish.countdown', function(event) {
      $(this).html('This Auction is over!')
        .parent().addClass('disabled');

    });
}, false);
