function addStudentSubmitEvent(elem){
  $(elem).on("submit", function(e){

    $.ajax({
      url: this.action,
      data: $(this).serialize(),
      type: ($("input[name='_method']").val() || this.method),
      success: function(response){
        if (this.type == "PATCH") {
          console.log("patch request");
        } else if (this.type == "POST") {
          console.log("post request");
          $('ul#student_list').append("<li><a href='students/" + response.id + "'>" + response.name + "</a></li>");
          $("div#student_form").html("<a data-remote='true' href='students/new'>Add Student</a>");
        }
      }
    });
    e.preventDefault();
  });
};
