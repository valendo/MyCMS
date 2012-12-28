function openPopup(title, url, width, height) {
    var w = $(window).width() - 300;
    var h = $(window).height() - 100;
    if (width != null) {
        w = width;
    }
    if (height != null) {
        h = height;
    }
    var $dialog = $('#popup')
        .html('<iframe style="border: 0px; " src="' + url + '" width="100%" height="100%"></iframe>')
        .dialog({
            autoOpen: false,
            modal: true,
            width: w,
            height: h,
            title: title
        });
    $dialog.dialog('open');
}

function closePopup() {
    parent.$('#popup').dialog("close");
    self.parent.location.reload();
}
