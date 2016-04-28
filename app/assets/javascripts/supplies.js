function addSupplySubmitEvent(elem){
  $(elem).on("submit", function(e){

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      type: ($("input[name='_method']").val() || this.method),
      success: function(response){
        var supply = createSupply(response);
        this.type == "PATCH" ? patchSupply(supply) : postSupply(supply);
      }
    });
    e.preventDefault();
  });
};

function createSupply(response){
  response = response.supply
  var supply = {
    id: response.id,
    name: response.name,
    date_due: response.date_due,
    amount: response.amount,
    student_class_id: response.student_class_id,
    student_class_name: function(){
      return response.student_class.name + " - ages " + response.student_class.min_age + " to " + response.student_class.max_age;
    }
  };
  return supply;
}

function postSupply(supply){
    $("ul#supplies").append("<li>Supplies: <a href='/supplies/" + supply.id +"'>" + supply.name + "</a><br> Class Name: <a href='/classes/" + supply.student_class_id + "'>" + supply.student_class_name() + "</a><br> Amount: " + supply.amount + "<br>Due: " + supply.date_due + "<br></li>");
    $('#supply_form').html("<a data-remote='true' href='/supplies/new'>(Add New Supplies)</a>");
}

function patchSupply(supply){
    $('div#supply').html("<h1>Supplies: " +  supply.name + "</h1>Class: <a href='/classes/" + supply.student_class_id + "'>" + supply.student_class_name() + "</a><br>Amount: " + supply.amount);
    $('#show_navigation').show();
}
