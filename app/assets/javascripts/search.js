$(document).ready(function() {
    $('#search-form').submit(function() {
        let start_station = $(this).find('#search_first_station_id');
        let end_station = $(this).find('#search_last_station_id');

        if (start_station.val() === end_station.val()) {
            alert("Необходимо выбрать разные станции");
            return false;
        }
    })
});