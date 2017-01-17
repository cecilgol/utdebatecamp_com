(function($) {
    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.pic>.bg').css('background-image', 'url('+ e.target.result +')');
            }

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("input#employee_avatar").change(function(){
        readURL(this);
    });

})(jQuery)
