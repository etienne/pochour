$(document).ready(function(){
  // Assign random color class to body
  var colors = [
    "91, 190, 113", // Green
    "58, 154, 197", // Blue
    // "197, 195, 58", // Yellow
    "197, 58, 106", // Fuschia
    "112, 68, 62" // Brown
  ];
  var color = colors[Math.floor(Math.random() * colors.length)];
  jQuery.get('/private/colors.css', function(css_template) {
    var css = css_template.replace(/COLOR/g, color);
    $('<style type="text/css" media="screen">' + css + '</style>').appendTo("head");
  });
  
  // Make specified <li>’s clickable. Use the first <a> as link target.
  $('ul.clickable_items li').each(function(item) {
    $(this).click(function() {
      location.href = $(this).find('a').first().attr('href');
    })
	});
});