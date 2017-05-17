(function() {
    $('.date').click(function() {
        if ($('.modal').hasClass('show')) {
            return false;
        } else {
            showCreateEventDialog($(this));
        }
    });

    function showCreateEventDialog(element) {
        var params = {
            'date': element.data('date'),
            'startTime': element.data('startTime'),
            'endTime': element.data('endTime')
        };
        $.get('events/new', params, $.noop, "text")
            .done(function(res) {
                $('#m').html(res);
                $('#utnif-modal').modal('toggle');
            })
            .fail(function(err, textStatus) {
                console.log(textStatus);
            });
    }
})(jQuery);