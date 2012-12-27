$(function () {
    $("#x_left").resizable({
        "resize": function (event, ui) {
            var w = $(this).width() + 30;
            $("#x_main").css("margin-left", w + 'px');
        },
        minWidth: 250,
        maxWidth: 500
    });

    $('.x_pane').css('border', '1px dotted #cdcdcd');
    $('.x_pane').each(function (index) {
        $(this).prepend("<div class='ui-state-disabled' style='text-align:center;'>" + $(this).attr('id') + "</div>");
    });

});