$(document).ready(function(){
  // Make specified <li>’s clickable. Use the first <a> as link target.
  $('ul.clickable_items li').each(function(item) {
    $(this).click(function() {
      location.href = $(this).find('a').first().attr('href');
    })
	});
});