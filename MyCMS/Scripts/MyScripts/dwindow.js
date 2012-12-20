// Finding center -----------------------------------------------------------------------
function showdeadcenterdiv(Xwidth, Yheight, divid) { var scrolledX, scrolledY; if (self.pageYOffset) { scrolledX = self.pageXOffset; scrolledY = self.pageYOffset; } else if (document.documentElement && document.documentElement.scrollTop) { scrolledX = document.documentElement.scrollLeft; scrolledY = document.documentElement.scrollTop; } else if (document.body) { scrolledX = document.body.scrollLeft; scrolledY = document.body.scrollTop; } var centerX, centerY; if (self.innerHeight) { centerX = self.innerWidth; centerY = self.innerHeight; } else if (document.documentElement && document.documentElement.clientHeight) { centerX = document.documentElement.clientWidth; centerY = document.documentElement.clientHeight; } else if (document.body) { centerX = document.body.clientWidth; centerY = document.body.clientHeight; } var leftOffset = scrolledX + (centerX - Xwidth) / 2; var topOffset = scrolledY + (centerY - Yheight) / 2; var o = document.getElementById(divid); var r = o.style; r.position = 'absolute'; r.top = topOffset + 'px'; r.left = leftOffset + 'px'; r.display = "block"; }

function removeChildren(node) {
    var count = node.childNodes.length;
    while (node.hasChildNodes()) { removeNode(node.firstChild); }
    return count;
}

function removeNode(node) {
    if ($.browser.msie) {
        _discardElement(node);
        return node;
    } else {
        if (node && node.parentNode) {
            // return a ref to the removed child
            return node.parentNode.removeChild(node);
        }
    }
}

function _discardElement(element) {
    var garbageBin = document.getElementById('IELeakGarbageBin');
    if (!garbageBin) {
        garbageBin = document.createElement('DIV');
        garbageBin.id = 'IELeakGarbageBin';
        garbageBin.style.display = 'none';
        document.body.appendChild(garbageBin);
    }

    // move the element to the garbage bin
    garbageBin.appendChild(element);
    garbageBin.innerHTML = '';
}

// Create popup windows -----------------------------------------------------------------
var win;
var dWindowCount = 0;
function DWindowClass() { }

// Open a new window --------------------------------------------------------------------
DWindowClass.prototype.PostInfo = function (URL, XML) {
    $('body').append('' +
    '<div id="PushWindow' + dWindowCount + '">' +
    '<div id="PushWindowMask' + dWindowCount + '" class="PushWindowMask"></div>' +
    '<div id="PushWindowBox' + dWindowCount + '" class="PushWindowBox">' +
    '<iframe id="winiframe' + dWindowCount + '" name="winiframe' + dWindowCount + '" width="100%" height="100%" scrolling="no" frameborder="0">' +
    '</iframe>' +
    '<div id="PushWindowDrag' + dWindowCount + '" class="PushWindowDrag">' +
    '<button onclick="return top.window.DWindow.Close()" class="close PushWindowClose" id="PushWindowClose">X</button>' +
    '</div>' +
    '</div>' +
    '</div>');

    // Initalize the dom in ie
    var doc = $('#winiframe' + dWindowCount)[0].contentWindow.document;
    doc.open();
    doc.write("");
    doc.close();

    // Add form        
    $('#winiframe' + dWindowCount).contents().find("body").append('' +
    '<form method="post" action="' + URL + '" id="PostForm" enctype="multipart/form-data">' +
    '<input type="hidden" name="PostInfo" id="PostInfo" value="' + XML + '">' +
    '</form>');

    // Excecute
    $('#winiframe' + dWindowCount).contents().find("body").find('#PostForm').submit();

    dWindowCount = dWindowCount + 1;
    return false;
}

// Post to get XML of value --------------------------------------------------------------------
DWindowClass.prototype.PostAjaxInfo = function (AJAXURL, URL, XML, PostInfo) {
    $('body').append('' +
    '<div id="PushWindow' + dWindowCount + '">' +
    '<div id="PushWindowMask' + dWindowCount + '" class="PushWindowMask"></div>' +
    '<div id="PushWindowBox' + dWindowCount + '" class="PushWindowBox">' +
    '<iframe id="winiframe' + dWindowCount + '" name="winiframe' + dWindowCount + '" width="100%" height="100%" scrolling="no" frameborder="0">' +
    '</iframe>' +
    '<div id="PushWindowDrag' + dWindowCount + '" class="PushWindowDrag">' +
    '<button onclick="return top.window.DWindow.Close()" class="close PushWindowClose" id="PushWindowClose">X</button>' +
    '</div>' +
    '</div>' +
    '</div>');

    // Initalize the dom in ie
    var doc = $('#winiframe' + dWindowCount)[0].contentWindow.document;
    doc.open();
    doc.write("");
    doc.close();

    function ajaxevent(data) {
        FULLXML = data;
        //alert(FULLXML);

        // Add form
        $('#winiframe' + dWindowCount).contents().find("body").append('' +
        '<form method="post" action="' + URL + '" id="PostForm" enctype="multipart/form-data">' +
        '<input type="hidden" name="PostInfo" id="PostInfo" value="' + FULLXML + '">' +
        '</form>');

        // Excecute
        $('#winiframe' + dWindowCount).contents().find("body").find('#PostForm').submit();

        dWindowCount = dWindowCount + 1;
        return false;

    }

    // Get existing post
    if (PostInfo.length > 0) {

        $.post(
            AJAXURL,
            { AjaxPostInfo: XML, PostInfo: PostInfo.val() },
            ajaxevent
        );
    } else {
        $.post(
            AJAXURL,
            { AjaxPostInfo: XML },
            ajaxevent
        );
    }
}

// Open a new window --------------------------------------------------------------------
DWindowClass.prototype.PostSelfInfo = function (URL, XML) {
    // Add form        
    $("#Body").append('' +
    '<form method="post" action="' + URL + '" id="PostForm" enctype="multipart/form-data">' +
    '<input type="hidden" name="PostInfo" id="PostInfo" value="' + XML + '">' +
    '</form>');

    // Excecute
    $('#PostForm').submit();

    return false;
}

// Close the last opened window ---------------------------------------------------------
DWindowClass.prototype.ReturnPostInfo = function (XML) {

    // Close subwindow right away (Looks more responsive)
    top.window.DWindow.Close();

    if (dWindowCount > 0) {
        var e = document.getElementById('winiframe' + (dWindowCount - 1));
        var doc = e.contentWindow.document;
        var wform = e.contentWindow.document.forms['Form'];
        if (!wform) wform = e.contentWindow.document.Form[0];
    }
    else {
        var doc = top.window.document;
        var wform = top.window.document.forms['Form'];
        if (!wform) wform = top.window.document.Form[0];
    }


    $(wform).append('<input name="ReturnPostInfo" type="hidden" value="' + XML + '" />');
    $(wform).submit();

    return false;
}



// Open a new window --------------------------------------------------------------------
DWindowClass.prototype.Open = function (Title, URL) {
    var e = document.createElement('div');
    e.id = 'PushWindow' + dWindowCount;

    e.innerHTML = '<div id="PushWindowMask' + dWindowCount + '" class="PushWindowMask"></div><div id="PushWindowBox' + dWindowCount + '" class="PushWindowBox"><iframe id="winiframe' + dWindowCount + '" src="' + URL + '" width="100%" height="100%" scrolling="no" frameborder="0" /></iframe><div id="PushWindowDrag' + dWindowCount + '" class="PushWindowDrag"><button onclick="top.window.DWindow.Close()" class="close PushWindowClose" id="PushWindowClose">X</button></div></div>';
    var body = document.getElementById('Body');
    body.appendChild(e);
    $("#PushWindowBox" + dWindowCount).draggable();
    dWindowCount = dWindowCount + 1;
    return false;
}

// Open a new window --------------------------------------------------------------------
DWindowClass.prototype.Open = function (Title, URL, WindowWidth, WindowHeight) {
    var e = document.createElement('div');
    e.id = 'PushWindow' + dWindowCount;
    e.innerHTML = '<div id="PushWindowMask' + dWindowCount + '" class="PushWindowMask"></div><div id="PushWindowBox' + dWindowCount + '" class="PushWindowBox" style="width:' + WindowWidth + 'px; height:' + WindowHeight + 'px;"><iframe id="winiframe' + dWindowCount + '" src="' + URL + '" width="100%" height="100%" scrolling="no" frameborder="0" /></iframe><div id="PushWindowDrag' + dWindowCount + '" class="PushWindowDrag"><button onclick="top.window.DWindow.Close()" class="close PushWindowClose" id="PushWindowClose">X</button></div></div>';
    var body = document.getElementById('Body');
    body.appendChild(e);
    $("#PushWindowBox" + dWindowCount).draggable();
    dWindowCount = dWindowCount + 1;
    return false;
}

// Close the last opened window ---------------------------------------------------------
DWindowClass.prototype.Close = function (Title, URL) {
    if (dWindowCount > 0) {
        var body = document.getElementById('Body');
        var e = document.getElementById('PushWindow' + (dWindowCount - 1));
        removeNode(e);
        dWindowCount = dWindowCount - 1;
    }
    return false;
}

// Close the last opened window and do postback ------------------------------------------
DWindowClass.prototype.SaveClose = function (PageModuleID, PaneID) {

    if (dWindowCount > 0) {
        var body = document.getElementById('Body');
        var e = document.getElementById('PushWindow' + (dWindowCount - 1));
        removeNode(e);
        dWindowCount = dWindowCount - 1;

        // Engage postback on prior window to see changes in the top window
        if (dWindowCount > 0) {
            var e = document.getElementById('winiframe' + (dWindowCount - 1));
            var wform = e.contentWindow.document.forms['Form'];
            if (!wform) wform = e.contentWindow.document.Form;
            wform.submit();
        } else {

            if (PageModuleID) {
                //console.log("PageModuleID", PageModuleID);
                __doAjaxEvent('Destinet.Business.Events.PageModuleEvent', 'Reload', function (data) { $('#pane' + PaneID + '_' + PageModuleID).replaceWith(data); }, pagemoduleid);

            } else {
                var wform = top.window.document.forms['Form'];
                wform.submit();
            }
        }
    }
    return false;
}


// Open an popup window -----------------------------------------------------------------
DWindowClass.prototype.OpenPopup = function (URL) {
    var e = document.createElement('div');
    e.id = 'PushWindow' + dWindowCount;
    e.innerHTML = '<div id="PushPopupWindowMask"></div><div id="PushPopupWindowBox"><iframe id="winiframe' + dWindowCount + '" src="' + URL + '" width="700px" height="500px" scrolling="no" frameborder="0" /></iframe></div>';
    var body = document.getElementById('Body');
    dWindowCount = dWindowCount + 1;
    body.appendChild(e);
    return false;
}

function findElement(wdw, id) {
    var el = wdw.document.getElementById(id);
    if (el) return el;
    for (var i = 0; i < wdw.frames.length; i++) {
        try {
            var el = findElement(wdw.frames[i].window, id);
            if (el) return el;
        } catch (e) {
        }

    }
    return null;
}

// Set an value of the parent opened window, or the main document -----------------------
DWindowClass.prototype.SetValue = function (ID, Value) {
    if (dWindowCount - 1 > 0) {
        var el = $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID);
        if ($(el).length == 0) { el = findElement(window, ID); }

        if ($(el)[0].tagName == "INPUT") {
            $(el).val(Value);
        } else {
            $(el).html(Value);
        }
    } else {
        var el = $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID);
        if ($(el).length == 0) { el = findElement(window, ID); }

        if ($(el)[0].tagName == "INPUT") {
            $(el).val(Value);
        } else {
            $(el).html(Value);
        }
    }
    return false;
}

// Set an value of the parent opened window, or the main document -----------------------
DWindowClass.prototype.SetStyle = function (ID, Value) {
    if (dWindowCount - 1 > 0) {
        var el = $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID);
        if ($(el).length == 0) { el = findElement(window, ID); }

        $(el).attr("style", Value);
    } else {
        var el = $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID);
        if ($(el).length == 0) { el = findElement(window, ID); }

        $(el).attr("style", Value);
    }
    return false;
}


// Set an value of the parent opened window, or the main document -----------------------
DWindowClass.prototype.SetImgSrc = function (ID, Value) {
    if (dWindowCount - 1 > 0) {
        var el = $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID);
        if ($(el).length == 0) { el = findElement(window, ID); }

        if ($(el)[0].tagName == "IMG") {
            $(el).attr('src', Value);
        } else {
            $(el).html(Value);
        }
    } else {
        var el = $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID);
        if ($(el).length == 0) { el = findElement(window, ID); }

        if ($(el)[0].tagName == "IMG") {
            $(el).val(Value);
        } else {
            $(el).html(Value);
        }
    }
    return false;
}

// Preform an post back on a prior window -----------------------------------------------
DWindowClass.prototype.doPostBack = function (ID, Value) {
    if (dWindowCount - 1 > 0) {
        $('#winiframe' + (dWindowCount - 2)).contents().window.__doPostBack(ID, Value);
    } else {
        __doPostBack(ID, Value);
    }
    return false;
}


// Get an value of the parent opened window, or the main document -----------------------
DWindowClass.prototype.GetValue = function (ID) {
    if (dWindowCount - 1 > 0) {
        return $('#winiframe' + (dWindowCount - 2)).contents().find('#' + ID).val();
    } else {
        return $('#' + ID).val();
    }
    return false;
}

// Change window title ------------------------------------------------------------------
DWindowClass.prototype.Title = function (Title) {
    if (dWindowCount > 0) {
        var body = document.getElementById('Body');
        var e = document.getElementById('PushWindowTitle' + (dWindowCount - 1));
        e.innerHTML = Title;
    }
    return false;
}

// --------------------------------------------------------------------------------------
// Helper functions
// --------------------------------------------------------------------------------------

function GetAllElementsAt(target, x, y) {
    var $elements = $(target).map(function () {
        var $this = $(this);
        var offset = $this.offset();
        var l = offset.left;
        var t = offset.top;
        var h = $this.outerHeight();
        var w = $this.outerWidth();

        var maxx = l + w;
        var maxy = t + h;

        return (y <= maxy && y >= t) && (x <= maxx && x >= l) && (w > 0 && h > 0) ? $this : null;
    });

    return $elements;
}

function getPositions(box) {
    var $box = $(box);
    var pos = $box.position();
    var width = $box.outerWidth();
    var height = $box.outerHeight();
    return [[pos.left, pos.left + width], [pos.top, pos.top + height]];
}

function getAbsolutePositions(box) {
    var $box = $(box);
    var pos = $box.position();
    var width = $box.outerWidth();
    var height = $box.outerHeight();
    return [pos.left, pos.top, width, height];
}

function comparePositions(p1, p2) {
    var x1 = p1[0] < p2[0] ? p1 : p2;
    var x2 = p1[0] < p2[0] ? p2 : p1;
    return x1[1] > x2[0] || x1[0] === x2[0] ? true : false;
}
