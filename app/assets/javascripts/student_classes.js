function addStudentClassSubmitEvent(elem){
  $(elem).on("submit", function(e){

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      type: ($("input[name='_method']").val() || this.method),
      success: function(response){
        var student_class = createStudentClass(response);
        this.type == "PATCH" ? patchStudentClass(student_class) : postStudentClass(student_class);
      }
    });
    e.preventDefault();
  });
};

function createStudentClass(response){
  var student_class = {
    id: response.id,
    name: response.name,
    min_age: response.min_age,
    max_age: response.max_age,
    start_date: response.start_date,
    end_date: response.end_date,
    start_time: moment.utc(response.start_time).format("h:mm a"),
    end_time: moment.utc(response.end_time).format("h:mm a"),
    meets_on: response.meets_on,
    supplies: response.supplies,
    class_name: function(){
      return response.name + " - ages " + response.min_age + " to " + response.max_age;
    }
  }
  return student_class;
};


function patchStudentClass(student_class){
  var supplies = parseSupplies(student_class);
  var meets_on = parseMeetings(student_class);

  $('div#student_class').html("<h1>" + student_class.name + "</h1><p>Age range: " + student_class.min_age + " - " + student_class.max_age + "</p><p>Meets from " + student_class.start_time + " to " + student_class.end_time + " on</p><ul>" + meets_on + "</ul><p><div id='supply_list'><p id='supply_form'>Supplies: <a data-remote='true' href='/supplies/new?student_class_id=" + student_class.id + "'>(Add Supply Fee)</a></p><ul>" + supplies + "</ul>"); 
  $('#show_student_class').show();
}; 

function postStudentClass(student_class){
  $('ul#classes').append("<li><a href='classes/" + student_class.id + "'>" + student_class.class_name() + "</a></li>");
  $('div#class_form').html("<a data-remote='true' href='classes/new'>Add New Class</a>");
};

function parseSupplies(student_class){
  var supplies = '';
  student_class.supplies.forEach(function(supply){
    supplies += "<li><a href='/supplies/" + supply.id + "'>" + supply.name + " - " + supply.amount + "<a data-confirm='Are you sure?' data-remote='true' rel='nofollow' data-method='delete' href='/supplies/" + supply.id + "'>Delete</a></li>";
  });
  return supplies;
};

function parseMeetings(student_class){
  var meets_on = '';
  student_class.meets_on.forEach(function(day){
    meets_on += "<li>" + day + "</li>";
  });
  return meets_on;
};
