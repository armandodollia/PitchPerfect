$(document).ready(function () {
  $('#show_pitch_form').on('click', function (event) {
    event.preventDefault();
    $('#new_pitch_form').removeClass('hide');
    $(this).addClass('hide');

  });

  $('#new_pitch_form').on('click', '.btn', function (event) {
    event.preventDefault();
    $('#new_pitch_form').addClass('hide');
    $('#show_pitch_form').removeClass('hide');
  });
});