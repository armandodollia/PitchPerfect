$(document).ready(function () {
  $('#show_pitch_form_button').on('click', function (event) {
    event.preventDefault();
    $('#add_pitch_form_container').removeClass('hide');
    $(this).addClass('hide');

  });

  $('#new_pitch').on('submit', '.btn', function (event) {
    var $form = $(this)
    event.preventDefault();


    var call = $form.click(function(event){
      event.preventDefault()
      $.ajax({
        url: $form.attr('action'),
        method: $form.attr('method'),
        data: $form.serialize()
      });

    });
  });
});