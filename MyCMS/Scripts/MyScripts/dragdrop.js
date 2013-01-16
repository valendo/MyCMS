$(
function () {
    //$('a.maxmin').click(
	//function () {
	//    $(this).parent().siblings('.dragbox-content').toggle();
	//});

    $('a.delete').click(
	function () {
	    var sel = confirm('Do you want to delete this module?');
	    if (sel) {
	        var pageModuleId = $(this).parent().parent().attr("id");
	        $.ajax({
	            type: "POST",
	            url: "/Cmd.asmx/DeleteModule",
	            data: "{'PageModuleId':'" + pageModuleId + "'}",
	            contentType: "application/json; charset=utf-8",
	            dataType: "json",
	            success: function (response) {
	                self.location.reload();
	            },
	            failure: function (msg) {
	                alert(msg);
	            }
	        });
	    }
	}
	);

    var oldPane = "";
    var newPane = "";
    var pageModuleId = "";

    $('.x_pane').sortable({
        connectWith: '.x_pane',
        handle: 'h2',
        cursor: 'move',
        placeholder: 'placeholder',
        forcePlaceholderSize: true,
        opacity: 0.5,
        items: ".dragbox",
        start: function (event, ui) {
            oldPane = $(ui.item).parent().attr('id');
            pageModuleId = $(ui.item).attr('id');
        },
        stop: function (event, ui) {
            $(ui.item).find('h2').click();
            var sortorder = '';

            $('.x_pane').each(function () {
                var itemorder = $(this).sortable('toArray');
                var columnId = $(this).attr('id');
                sortorder += columnId + '=' + itemorder.toString() + '&';
            });
            sortorder = sortorder.substring(0, sortorder.length - 1)
            newPane = $(ui.item).parent().attr('id');
            //alert('SortOrder: ' + sortorder);
            $.ajax({
                type: "POST",
                url: "/Cmd.asmx/SortModules",
                data: "{'PageModuleId':'" + pageModuleId + "', 'OldPane':'" + oldPane + "', 'NewPane':'" + newPane + "','SortOrder':'" + sortorder + "'}",
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (response) {
                    //alert(response);
                },
                failure: function (msg) {
                    alert(msg);
                }
            });

        }
    }).disableSelection();

    $('.dragbox').mouseover(function () {
        $(this).children('h2').show();
        $(this).css('border','2px dotted #000');
    });
    $('.dragbox').mouseout(function () {
        $(this).children('h2').hide();
        $(this).css('border', 'none');
    });
    
    

});