(function() {
    $('.date').click(function() {
        showCreateEventDialog($(this));
    });

    function showCreateEventDialog(element) {
        console.log('fuck yeah!', $(element));
        $(element).popover('toggle');
        $(element).css("color", "red");
    }
})(jQuery);