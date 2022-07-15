// required to work after redirect
document.addEventListener("turbolinks:load", function() {
  $('a.edit_station_link').click(function(e) {
      e.preventDefault()

      let station_id = $(this).data('stationId')
      let form = $('#edit-form-'+station_id)
      let title = $('#railway-station-title-' + station_id)

      if (!$(this).hasClass('cancel')) {
          $(this).html('Cancel')
          $(this).addClass('cancel')
      } else {
          $(this).html('Edit')
          $(this).removeClass('cancel')
      }

      form.toggle()
      title.toggle()
  })
});