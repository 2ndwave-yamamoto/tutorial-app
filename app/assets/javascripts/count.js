$(document).on('turbolinks:load', function() {
    $("#input-text").on("keyup", function() {
      const countNum = $("#input-text").val().length;
      $("#counter").text(countNum + "文字");
    });
  });