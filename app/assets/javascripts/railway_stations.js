$(document).on("turbolinks:load", function () {
  $('a.edit_button_first').click(function (e) {
    e.preventDefault();

    let yourUlDel = $(".edit_form_del");
    for (i = 0; i < yourUlDel.length; i++) {
      $(yourUlDel[i]).addClass('invisibility').removeClass('visibility');
    };

    let yourUlAdd = $(".edit_form_add");
    for (i = 0; i < yourUlAdd.length; i++) {
      $(yourUlAdd[i]).removeClass('invisibility').addClass('visibility');
    };
  });
});

$(document).on("turbolinks:load", function () {
  $('a.edit_button_second').click(function (e) {
    e.preventDefault();

    let yourUlDel = $(".edit_form_del");
    for (i = 0; i < yourUlDel.length; i++) {
      $(yourUlDel[i]).addClass('visibility').removeClass('invisibility');
    };

    let yourUlAdd = $(".edit_form_add");
    for (i = 0; i < yourUlAdd.length; i++) {
      $(yourUlAdd[i]).removeClass('visibility').addClass('invisibility');
    };

  });
});

