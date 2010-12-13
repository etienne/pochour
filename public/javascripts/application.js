$(document).ready(function(){
  $(".hidden_nojs").show();
  
  $("body.articles div.bio_form").hide();
  $("body.articles a.show_bio_form").click(function() {
    $("body.articles div.bio_form").show();
    $(this).hide();
    return false;
  });
});