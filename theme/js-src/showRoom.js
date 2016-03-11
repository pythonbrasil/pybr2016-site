$(document).ready(function(){
  showRoom();

  function showRoom(){
    $(".days a").on("click", function(e){
      e.preventDefault();

      var dayId = $(this).attr("href");

      $("*").removeClass("active");

      $(this).addClass("active");
      $(dayId).addClass("active");
    });
  }
});