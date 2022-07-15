document.addEventListener("turbolinks:load", function() {
    $('a.edit_route_link').click(function(e) {
        e.preventDefault()

        let route_id = $(this).data('routeId')
        let form = $('#edit-form-' + route_id)
        let name = $('#train-number-' + route_id)

        if (!$(this).hasClass('cancel')) {
            $(this).html('Cancel')
            $(this).addClass('cancel')
        } else {
            $(this).html('Edit')
            $(this).removeClass('cancel')
        }

        form.toggle()
        name.toggle()
    })
});