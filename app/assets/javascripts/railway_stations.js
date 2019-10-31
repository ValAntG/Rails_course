$(document).on("turbolinks:load", function () {
  $('a.edit_button').click(function (e) {
    e.preventDefault()
    let yourUlAdd = document.getElementsByClassName("edit_form_add")
    var i;
    for (i = 0; i < yourUlAdd.length; i++) {
      yourUlAdd[i].style.display = yourUlAdd[i].style.display === 'none' ? 'block' : 'none';
    }
    let yourUlDel = document.getElementsByClassName("edit_form_del")
    for (i = 0; i < yourUlDel.length; i++) {
      yourUlDel[i].style.display = yourUlDel[i].style.display === 'none' ? 'block' : 'none';
    }
  });
});
