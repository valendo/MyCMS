$(
function () {
    $('a.maxmin').click(
	function () {
	    $(this).parent().siblings('.dragbox-content').toggle();
	});

    $('a.delete').click(
	function () {
	    var sel = confirm('do you want to delete the widget?');
	    if (sel) {
	        //del code here
	    }
	}
	);

    var oldPane = "";
    var newPane = "";
    var pageModuleId = "";

    $('.pane').sortable({
        connectWith: '.pane',
        handle: 'h2',
        cursor: 'move',
        placeholder: 'placeholder',
        forcePlaceholderSize: true,
        opacity: 0.4,
        start: function (event, ui) {
            oldPane = $(ui.item).parent().attr('id');
            pageModuleId = $(ui.item).attr('id');
        },
        stop: function (event, ui) {
            $(ui.item).find('h2').click();
            var sortorder = '';

            $('.pane').each(function () {
                var itemorder = $(this).sortable('toArray');
                var columnId = $(this).attr('id');
                sortorder += columnId + '=' + itemorder.toString() + '&';
            });
            sortorder = sortorder.substring(0, sortorder.length - 1)
            newPane = $(ui.item).parent().attr('id');
            //alert('SortOrder: ' + sortorder);
            $.ajax({
                type: "POST",
                url: "Cmd.asmx/SortModules",
                data: "{'PageModuleId':'" + pageModuleId + "', 'OldPane':'" + oldPane + "', 'NewPane':'" + newPane + "','SortOrder':'" + sortorder + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert("ok");
                },
                failure: function (msg) {
                    alert(msg);
                }
            });

        }
    }).disableSelection();
});