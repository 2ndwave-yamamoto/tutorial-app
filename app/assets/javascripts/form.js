$(document).on('turbolinks:load', function() {
  $("#input-text").on("input", function() {
    let countNum = String($(this).val().length);
    $("#counter").text(countNum + "文字");
  });
});