$(document).on("turbolinks:load", function() {
  $('.search_form').submit(function() {
    var stationFirst;
    var stationLast;

    stationFirst = $(this).find('#station_first_id');
    stationLast = $(this).find('#station_last_id');

    if (stationFirst.val() == stationLast.val()) {
      alert('Начальная и конечная станция должны отличаться');
      return false;
    }
  });
});