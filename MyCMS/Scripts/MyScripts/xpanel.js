$(function () {
    $("#x_left").resizable({
        "resize": function (event, ui) {
            var w = $(this).width() + 10;
            $("#x_main").css("margin-left", w + 'px');
        },
        minWidth: 250,
        maxWidth: 500
    });
});