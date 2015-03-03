$(document).ready(function() {
  $('#category').change(function() {
    $ajax({
      url : admin_wordlists_path,
      type : "GET",
      data : {
        "selected" : $('#category').val()
      }
    });
  });
});
