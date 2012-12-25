﻿function openPopup(title, url) {
    var $dialog = $('#popup')
        .html('<iframe style="border: 0px; " src="' + url + '" width="100%" height="100%"></iframe>')
        .dialog({
            autoOpen: false,
            modal: true,
            width: $(window).width() - 300,
            height: $(window).height() - 100,
            title: title
        });
    $dialog.dialog('open');
}

function closePopup() {
    parent.$('#popup').dialog("close");
    self.parent.location.reload();
}
