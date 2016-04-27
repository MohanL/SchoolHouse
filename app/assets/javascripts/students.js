function addStudentSubmitEvent(elem){
  $(elem).on("submit", function(e){

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      type: ($("input[name='_method']").val() || this.method),
      success: function(response){
        var student = createStudent(response);
        this.type == "PATCH" ? patchStudent(student) : postStudent(student);
      }
    });
    e.preventDefault();
  });
};

function createStudent(response){
  var student = {
    name: response.name,
    id: response.id,
    student_class_id: response.student_class_id,
    birthday: response.birthday,
    parent_id: response.user.id,
    parent_name: response.user.name,
    student_class_name: function(){
      return response.student_class.name + " - ages " + response.student_class.min_age + " to " + response.student_class.max_age;
    }
  }
  return student;
};

function postStudent(student){
  $('ul#student_list').append("<li><a href='students/" + student.id + "'>" + student.name + "</a></li>");
  $("div#student_form").html("<a data-remote='true' href='students/new'>Add Student</a>");
}

function patchStudent(student){
  $('div#student').html("<h1>" + student.name + "</h1><p>Birthday: " + student.birthday + "</p><p>Class: <a href='classes/" + student.stduent_class_id + "'>" + student.student_class_name() + "</a></p><p>Parent: <a href='users/'" + student.parend_id + ">" + student.parent_name + "</a></p>");
  $('#show_navigation').show();
}

