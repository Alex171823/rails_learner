document.addEventListener("turbolinks:load", function() {
    $('a.edit_train_link').click(function(e) {
        e.preventDefault()

        let train_id = $(this).data('trainId')
        let form = $('#edit-form-'+train_id)
        let number = $('#train-number-' + train_id)

        if (!$(this).hasClass('cancel')) {
            $(this).html('Cancel')
            $(this).addClass('cancel')
        } else {
            $(this).html('Edit')
            $(this).removeClass('cancel')
        }

        form.toggle()
        number.toggle()
    })
});
