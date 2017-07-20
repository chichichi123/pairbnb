$(document).on("turbolinks:load", function(){
  $("#joke").on("click", function(){

    $.ajax({
      url: "/reservations/date",
      type: "post",
      success: function(data){
        $("#haha").html(data.message)
      }
    })
  })
})