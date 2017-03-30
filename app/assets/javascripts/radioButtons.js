$(document).ready(function() {
  $(".pitch-list").on('click', "input[type=radio]", function(event) {
    var el = $(this);
    var col = el.data("col");
    $("input[data-col=" + col + "]").prop("checked", false);
    el.prop("checked", true);
  });
});
