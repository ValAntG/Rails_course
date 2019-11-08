$(document).on("turbolinks:load", function () {
  $('#carriage_type').change(function () {
    var carriage = $("#carriage_type option:selected").val();
    $('.carriage').attr("style", "display: none")
    $('.' + carriage).toggle()
  });
  $("#carriage_type").trigger('change');
});