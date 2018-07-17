/* Category Navbar */
// $(document).ready(function(){
//     $(".dropdown").on('click',
//         function(e) {
//             e.stop(event);
//             $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideDown(1000);
//             $(this).toggleClass('open');
//         },
//         function(e) {
//             e.stop(event);
//             $('.dropdown-menu', this).not('.in .dropdown-menu').stop(true,true).slideUp(1000);
//             $(this).toggleClass('open');
//         }
//     );
// });

/* Navbar affix */
$('.nav-wrapper').affix({
  offset: {top: 50}
});

// ADD SLIDEDOWN ANIMATION TO DROPDOWN //
(function($){
$('.mega-dropdown').on('show.bs.dropdown', function(e){
    $(this).find('.mega-dropdown-menu').first().stop(true, true).slideDown();
  });
})(jQuery);

// ADD SLIDEUP ANIMATION TO DROPDOWN //
(function($){
    $('.mega-dropdown').on('hide.bs.dropdown', function(e){
       $(this).find('.mega-dropdown-menu').first().stop(true, true).slideUp();
    });
})(jQuery);


/* Prevent menu from closing on carousel click */
(function($){
    $('.mega-dropdown').on('click', '.dropdown-menu', function(e) {
      e.stopPropagation()
  });
})(jQuery);

/* Scrollbar */
(function($){
    $(window).on("load",function(){
        $(".mega-dropdown .pre-scrollabler").mCustomScrollbar({
            theme:"dark-3",
            mouseWheel:{ scrollAmount: 100 }
        });
    });
})(jQuery);

$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
});
