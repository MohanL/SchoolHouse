function addSupplySubmitEvent(elem){
  $(elem).on("submit", function(e){

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      type: ($("input[name='_method']").val() || this.method),
      success: function(response){
        if (this.type == "PATCH") {
          console.log("patch request");
          $('div#supply').html("<h1>Supplies: " +  response.name + "</h1>Class: <a href='/classes/" + response.student_class_id + "'>" + response.data.class_name + "</a><br>Amount: " + response.data.amount);
          $('#show_navigation').show();
        } else if (this.type == "POST") {
          $("ul#supplies").append("<li>Supplies: <a href='/supplies/" + response.id +"'>" + response.name + "</a><br> Class Name: <a href='/classes/" + response.student_class_id + "'>" + response.data.class_name + "</a><br> Amount: " + response.data.amount + "<br>Due: " + response.date_due + "<br></li>");
          $('#supply_form').html("<a data-remote='true' href='/supplies/new'>(Add New Supplies)</a>");
        }
      }
    });
    e.preventDefault();
  });
};
