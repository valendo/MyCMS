jQuery(function ($) {
    $('#widget').width($(window).width());
    $('#widget').height($(window).height());
    $('#widget').split({ orientation: 'vertical', limit: 0, position: '20%' });
});