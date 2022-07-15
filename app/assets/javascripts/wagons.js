document.addEventListener("turbolinks:load", function() {
    $('#wagon_type').change(function() {
        let fields_to_show = {
            'AbstractWagon': [],
            'CoupeWagon': ['top_seats', 'bottom_seats'],
            'EconomyWagon': ['top_seats', 'bottom_seats', 'side_top_seats', 'side_bottom_seats'],
            'SittingWagon': ['sitting_seats'],
            'SleepingWagon': ['bottom_seats']
        }

        let chosen_type = $(this).val()

        $('.seats').each(function() {
            let a = $(this).find(':input').val('')
            console.log(a)
            $(this).hide();
        })

        fields_to_show[chosen_type].forEach(function(el) {
          $('#' + el).toggle()
        })
    })
});